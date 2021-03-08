using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace DukeConsultantSprint1
{
    public partial class EmpViewRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Make sure a service Request was chosen and identify the request, then fill the gridview that will help the user decide how to proceed.
            if (Session["activeSR"] != null)
            {
                int activeSRID = Convert.ToInt32(Session["activeSR"]);
                string sqlQuery = "SELECT ServiceRequest.sType, ServiceRequest.sDate, serviceRequest.originAddress, ServiceRequest.delAdd, Customer.cFName, Customer.cLName from ServiceRequest inner join Customer on Customer.cID = ServiceRequest.CID WHERE ServiceRequest.srID = " + activeSRID;
                SqlConnection sqlConnect = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
                DataTable dtGridView = new DataTable();
                sqlAdapter.Fill(dtGridView);
                grdShowRequest.DataSource = dtGridView;
                grdShowRequest.DataBind();
            }
        }
        //If user chooses to deny the request the sttus will be changed to 'denied'
        protected void denyRequest_Click(object sender, EventArgs e)
        {
            string sqlQuery4 = "UPDATE ServiceRequest SET status = 'Denied' WHERE srID = " + Session["activeSR"];
            SqlConnection sqlConnect4 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            SqlCommand sqlCommand4 = new SqlCommand();
            sqlCommand4.Connection = sqlConnect4;
            sqlCommand4.CommandType = CommandType.Text;
            sqlCommand4.CommandText = sqlQuery4;
            sqlConnect4.Open();
            SqlDataReader queryResults4 = sqlCommand4.ExecuteReader();
            queryResults4.Close();
            sqlConnect4.Close();
            Session["activeSR"] = null;
            Response.Redirect("EmpHomepage.aspx");
        }
        //Proceed to Add Service form, where Information will be prepopulated
        protected void fillRequest_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmpAddService.aspx");
        }
    }
}
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
    public partial class EmpViewTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void lbNoteTitles_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtNoteBody.Text = "";
            string title = lbNoteTitles.SelectedItem.ToString();
            string thService = viewDropDown.SelectedItem.ToString();
            string separator = "--";
            int dashIndex = thService.IndexOf(separator);
            string stTemp = "";
            int stID = 0;
            if (dashIndex > 0)
            {
                stTemp = thService.Substring(0, dashIndex);
                stID = int.Parse(stTemp);
            }
            //Gets the note based on stID (Found above in the same way as previously) and the chosen note title.
            String sqlQuery1 = "Select thNote from TicketHistory where stID = " + stID + " And thNoteTitle = '" + title + "'";
            SqlConnection sqlConnect1 = new SqlConnection
                (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
            SqlCommand sqlCommand1 = new SqlCommand();
            sqlCommand1.Connection = sqlConnect1;
            sqlCommand1.CommandType = CommandType.Text;
            sqlCommand1.CommandText = sqlQuery1;
            sqlConnect1.Open();
            SqlDataReader queryResults1 = sqlCommand1.ExecuteReader();
            while (queryResults1.Read())
            {
                string currentNote = queryResults1[0].ToString();
                txtNoteBody.Text = currentNote;
            }
            queryResults1.Close();
            sqlConnect1.Close();
        }
        //Button allows items to be viewed once an item is chosen
        protected void viewItemsBtn_Click(object sender, EventArgs e)
        {
            lbNoteTitles.Items.Clear();
            lbNoteTitles.Visible = true;
            txtNoteBody.Visible = true;
            txtNoteBody.Text = "";
            string thService = viewDropDown.SelectedItem.ToString();
            string separator = "--";
            int dashIndex = thService.IndexOf(separator);
            string stTemp = "";
            int stID = 0;
            if (dashIndex > 0)
            {
                stTemp = thService.Substring(0, dashIndex);
                stID = int.Parse(stTemp);
            }
            //Query and connection fills gridview with rows regarding history of a ticket
            String sqlQuery = "Select TicketHistory.thID, TicketHistory.thDate, TicketHistory.thNoteTitle, Employee.eName, TicketHistory.stStatus FROM TicketHistory inner join Employee on Employee.eID = TicketHistory.eID where TicketHistory.stID = " + stID;
            SqlConnection sqlConnect = new SqlConnection
                (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            DataTable dtGridView = new DataTable();
            sqlAdapter.Fill(dtGridView);
            grdShowItems.DataSource = dtGridView;
            grdShowItems.DataBind();
            //Get the titles of notes and add them to a hidden list box that becomes visible once the button is clicked
            String sqlQuery2 = "Select thNoteTitle from TicketHistory where stID = " + stID;
            SqlConnection sqlConnect2 = new SqlConnection
                (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
            SqlDataAdapter sqlAdapter2 = new SqlDataAdapter(sqlQuery2, sqlConnect2);
            SqlCommand sqlCommand2 = new SqlCommand();
            sqlCommand2.Connection = sqlConnect2;
            sqlCommand2.CommandType = CommandType.Text;
            sqlCommand2.CommandText = sqlQuery2;
            sqlConnect2.Open();
            SqlDataReader queryResults2 = sqlCommand2.ExecuteReader();
            while (queryResults2.Read())
            {
                string currentTitle = queryResults2[0].ToString();
                lbNoteTitles.Items.Add(currentTitle);
            }
            queryResults2.Close();
            sqlConnect2.Close();
        }
    }
}
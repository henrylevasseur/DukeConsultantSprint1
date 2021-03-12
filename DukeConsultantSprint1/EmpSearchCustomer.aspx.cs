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
    public partial class EmpSearchCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //Sets second two gridviews to null when a new customer is searched for.
            grdShowServiceTickets.DataSource = null;
            grdShowServiceTickets.DataBind();
            grdShowTH.DataSource = null;
            grdShowTH.DataBind();
            string sqlQuery = "Select cID, cFName AS 'First Name', cLName AS 'Last Name', cAddress AS 'Address', cPhone as 'Phone', cEmail AS 'Email' FROM Customer WHERE (UPPER(cFName) = @ChosenName) OR (UPPER(cLName) = @ChosenName)";
            SqlConnection sqlConnect = new SqlConnection
                (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            sqlAdapter.SelectCommand.Parameters.AddWithValue("@ChosenName", txtSearch.Text.ToUpper());
            DataTable dtGridView = new DataTable();
            sqlAdapter.Fill(dtGridView);
            grdShowCustomers.DataSource = dtGridView;
            grdShowCustomers.DataBind();
        }
        //On selected index change read the ID chosen and display that customers pertinent service information.
        protected void grdShowCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = grdShowCustomers.SelectedRow;
            string tempCID = row.Cells[1].Text;
            string sqlQuery = "SELECT ServiceTicket.sID, Service.sType As 'Type', Format(ServiceTicket.stODate, 'yyyy-MM-dd') As 'Date Opened', FORMAT(Service.sDate, 'yyyy-MM-dd') As 'Start Date', FORMAT(Service.sCompDate, 'yyyy-MM-dd') As 'Completion Date', Service.sCost AS 'Cost', Service.sFromAdd AS 'Origin Address', Service.sDelAdd AS 'Destination Address' FROM Service Inner Join ServiceTicket on Service.sID = ServiceTicket.sID WHERE ServiceTicket.cID = " + tempCID;
            SqlConnection sqlConnect = new SqlConnection
                (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            DataTable dtGridView = new DataTable();
            sqlAdapter.Fill(dtGridView);
            grdShowServiceTickets.DataSource = dtGridView;
            grdShowServiceTickets.DataBind();
        }
        //On selected index change, read ID and display that tickets pertinent history information.
        protected void grdShowServiceTickets_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = grdShowServiceTickets.SelectedRow;
            string tempSTID = row.Cells[1].Text;
            string sqlQuery = "SELECT TicketHistory.thDate AS 'Date', TicketHistory.thNoteTitle AS 'Note Title', TicketHistory.thNote AS 'Note', Employee.eName AS 'Employee', TicketHistory.stStatus AS 'Status' FROM TicketHistory inner join Employee ON Employee.eID=TicketHistory.eID WHERE TicketHistory.stID = " + tempSTID;
            SqlConnection sqlConnect = new SqlConnection
                (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            DataTable dtGridView = new DataTable();
            sqlAdapter.Fill(dtGridView);
            grdShowTH.DataSource = dtGridView;
            grdShowTH.DataBind();
        }
    }
}
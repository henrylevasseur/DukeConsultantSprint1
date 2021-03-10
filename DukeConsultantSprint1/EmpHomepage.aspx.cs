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
    public partial class EmpHomepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnProceed_Click1(object sender, EventArgs e)
        {
            string selected = homepageDropdown.Text;
            if (selected.Equals("Add Customer"))
            {
                Response.Redirect("EmpAddCustomer.aspx");
            }
            else if (selected.Equals("Add Vehicle to Service"))
            {
                Response.Redirect("EmpAddVehicle.aspx");
            }
            else if (selected.Equals("Add Item"))
            {
                Response.Redirect("EmpAddItem.aspx");
            }
            else if (selected.Equals("Add Service"))
            {
                Response.Redirect("EmpAddService.aspx");
            }
            else if (selected.Equals("Edit Service Ticket"))
            {
                Response.Redirect("EmpEditTicket.aspx");
            }
            else if (selected.Equals("View Service History"))
            {
                Response.Redirect("EmpViewTicket.aspx");
            }
            else if (selected.Equals("Assign Auction Items"))
            {
                Response.Redirect("EmpAssignAuctionItems.aspx");
            }
            else if (selected.Equals("Search for Customer"))
            {
                Response.Redirect("EmpSearchCustomer.aspx");
            }
            else if (selected.Equals("Add Room Information"))
            {
                Response.Redirect("RoomForm.aspx");
            }
            else if (selected.Equals("Move Form"))
            {
                Response.Redirect("MoveForm.aspx");
            }
        }
        //Choosing an Item in the list box allows Employees to view the request Information.
        protected void btnViewRequest_Click(object sender, EventArgs e)
        {
            string chosenSRequest = lbRequests.SelectedValue.ToString();
            string srTemp = "";
            int srID = 0;
            string separator = "--";
            int dashIndex = chosenSRequest.IndexOf(separator);
            if (dashIndex > 0)
            {
                srTemp = chosenSRequest.Substring(0, dashIndex);
                srID = int.Parse(srTemp);
                Session["activeSR"] = srID;
                Response.Redirect("EmpViewRequest.aspx");
            }
        }
    }
}
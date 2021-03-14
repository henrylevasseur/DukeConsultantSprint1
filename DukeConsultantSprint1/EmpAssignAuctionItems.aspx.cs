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
    public partial class EmpAssignAuctionItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAssign_Click(object sender, EventArgs e)
        {
            //Try-catch for error handling.
            try
            {
                string selectedItem = lbItems.SelectedValue.ToString();
                string itemTemp3 = "";
                int itemIDChosen = 0;
                string separator3 = "--";
                int dashIndex3 = selectedItem.IndexOf(separator3);
                //Takes stID from the concatenation statement to know which auction the item are being added to.
                if (dashIndex3 > 0)
                {
                    itemTemp3 = selectedItem.Substring(0, dashIndex3);
                    itemIDChosen = int.Parse(itemTemp3);
                }
                //Query and connection established to ensure that the items are not already assigned to an auction.
                string sqlQuery2 = "Select count(itemID) from AuctionInventory WHERE itemID = @itemID";
                SqlConnection sqlConnect2 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                SqlCommand selectCommand = new SqlCommand(sqlQuery2, sqlConnect2);
                selectCommand.Connection = sqlConnect2;
                selectCommand.Parameters.AddWithValue("@itemID", itemIDChosen);
                sqlConnect2.Open();
                SqlDataReader queryResults2 = selectCommand.ExecuteReader();
                int numItemID = 0;
                while (queryResults2.Read())
                {
                    numItemID = queryResults2.GetInt32(0);
                }
                sqlConnect2.Close();
                queryResults2.Close();
                //lblStatus.ForeColor = Color.Green;
                //lblStatus.Text = numItemID.ToString();
                string chosenAID = ddlAuction.SelectedValue.ToString();
                string chosenItemID = lbItems.SelectedValue.ToString();
                string itemTemp = "";
                int itemID = 0;
                string separator = "--";
                int dashIndex = chosenItemID.IndexOf(separator);
                //Takes stID from the concatenation statement to know which ticket to assign to an auction
                if (dashIndex > 0)
                {
                    itemTemp = chosenItemID.Substring(0, dashIndex);
                    itemID = int.Parse(itemTemp);
                }
                string aTemp = "";
                int aID = 0;
                int dashIndex2 = chosenAID.IndexOf(separator);
                //Takes auctionID from the concatenation statement to know which auction
                if (dashIndex2 > 0)
                {
                    aTemp = chosenAID.Substring(0, dashIndex2);
                    aID = int.Parse(aTemp);
                }
                // If the items are unassigned, go ahed and assign the values to the bridge table.
                if (numItemID == 0)
                {
                    //Insert with parameters to get values in the bridge table. From here, joins can be used to show items in auctions.
                    string sqlQuery1 = "INSERT INTO AuctionInventory(ItemID, AuctionID) VALUES (@itemID, @aID)";
                    SqlConnection sqlConnect1 = new SqlConnection
                        (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                    SqlCommand insertCommand = new SqlCommand(sqlQuery1, sqlConnect1);
                    insertCommand.Connection = sqlConnect1;
                    insertCommand.Parameters.AddWithValue("@itemID", itemID);
                    insertCommand.Parameters.AddWithValue("@aID", aID);
                    sqlConnect1.Open();
                    SqlDataReader queryResults1 = insertCommand.ExecuteReader();
                    queryResults1.Close();
                    sqlConnect1.Close();
                    lblStatus.ForeColor = Color.Green;
                    lblStatus.Text = "Successfully Saved Record!";
                }
                else if (numItemID == 1)
                {
                    string sqlQuery3 = "UPDATE AuctionInventory Set AuctionID = @aID WHERE ItemID = @itemID";
                    SqlConnection sqlConnect3 = new SqlConnection
                        (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                    SqlCommand insertCommand2 = new SqlCommand(sqlQuery3, sqlConnect3);
                    insertCommand2.Connection = sqlConnect3;
                    insertCommand2.Parameters.AddWithValue("@itemID", itemID);
                    insertCommand2.Parameters.AddWithValue("@aID", aID);
                    sqlConnect3.Open();
                    SqlDataReader queryResults3 = insertCommand2.ExecuteReader();
                    queryResults3.Close();
                    sqlConnect3.Close();
                    lblStatus.ForeColor = Color.Green;
                    lblStatus.Text = "Successfully Saved Record!";
                }
                //Display Message If Items are assigned.
                else
                {
                    lblStatus.ForeColor = Color.Red;
                    lblStatus.Text = "Inventory already assigned to auction!";
                }
            }
            //Catches sql Exceptions
            catch (SqlException)
            {
                lblStatus.ForeColor = Color.Red;
                lblStatus.Text = "Could Not Save Record!";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ddlCustomers.Items.Clear();
            string enteredName = txtCName.Text;
            string sqlQuery2 = "SELECT CONCAT(cFName, ' ', cLName) FROM Customer WHERE UPPER(CONCAT(cFName, ' ', cLName)) LIKE UPPER(@cName)";
            SqlConnection sqlConnect2 = new SqlConnection
                (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
            SqlCommand selectCommand = new SqlCommand(sqlQuery2, sqlConnect2);
            selectCommand.Connection = sqlConnect2;
            selectCommand.Parameters.AddWithValue("@cName", "%"+ enteredName + "%");
            sqlConnect2.Open();
            SqlDataReader queryResults2 = selectCommand.ExecuteReader();
            while (queryResults2.Read())
            {
                ddlCustomers.Items.Add(queryResults2[0].ToString());
            }
            sqlConnect2.Close();
            queryResults2.Close();
        }

        protected void ddlCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void btnViewAuctions_Click(object sender, EventArgs e)
        {
            string chosenCName = ddlCustomers.SelectedValue.ToString();
            ddlService.Items.Clear();
            string enteredName = txtCName.Text;
            string sqlQuery2 = "select CONCAT(ServiceTicket.stID, '--', Service.sDate), CONCAT(Customer.cFName, ' ', Customer.cLName) from Customer right join ServiceTicket on ServiceTicket.CID = Customer.CID right join Service on Service.sID = ServiceTicket.sID WHERE sType = 'Auction' AND CONCAT(cFName, ' ', cLName) = @cName";
            SqlConnection sqlConnect2 = new SqlConnection
                (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
            SqlCommand selectCommand = new SqlCommand(sqlQuery2, sqlConnect2);
            selectCommand.Connection = sqlConnect2;
            selectCommand.Parameters.AddWithValue("@cName", chosenCName);
            sqlConnect2.Open();
            SqlDataReader queryResults2 = selectCommand.ExecuteReader();
            while (queryResults2.Read())
            {
                ddlService.Items.Add(queryResults2[0].ToString());
            }
            sqlConnect2.Close();
            queryResults2.Close();
        }

        protected void btnViewItems_Click(object sender, EventArgs e)
        {
            string serviceDesc = ddlService.SelectedValue.ToString();
            string stTemp3 = "";
            int stIDChosen = 0;
            string separator3 = "--";
            int dashIndex3 = serviceDesc.IndexOf(separator3);
            //Takes stID from the concatenation statement to know which auction the item are being added to.
            if (dashIndex3 > 0)
            {
                stTemp3 = serviceDesc.Substring(0, dashIndex3);
                stIDChosen = int.Parse(stTemp3);
            }

            string chosenCName = ddlCustomers.SelectedValue.ToString();
            lbItems.Items.Clear();
            string sqlQuery2 = "Select Concat(Inventory.ItemID, '--', Inventory.ItemName, ' .. ', Auction.AuctionDesc) From Inventory full outer join InventoryService ON Inventory.ItemID = InventoryService.ItemID full outer join AuctionInventory on Inventory.ItemID = AuctionInventory.ItemID full outer join Auction on Auction.AuctionID = AuctionInventory.AuctionID WHERE InventoryService.stID = @stID";
            SqlConnection sqlConnect2 = new SqlConnection
                (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
            SqlCommand selectCommand = new SqlCommand(sqlQuery2, sqlConnect2);
            selectCommand.Connection = sqlConnect2;
            selectCommand.Parameters.AddWithValue("@stID", stIDChosen);
            sqlConnect2.Open();
            SqlDataReader queryResults2 = selectCommand.ExecuteReader();
            while (queryResults2.Read())
            {
                lbItems.Items.Add(queryResults2[0].ToString());
            }
            sqlConnect2.Close();
            queryResults2.Close();
        }
    }
}
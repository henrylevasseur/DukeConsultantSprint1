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
                //Query and connection established to ensure that the items are not already assigned to an auction.
                string sqlQuery2 = "Select count(stID) from AuctionInventory WHERE stID = @stID";
                SqlConnection sqlConnect2 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                SqlCommand selectCommand = new SqlCommand(sqlQuery2, sqlConnect2);
                selectCommand.Connection = sqlConnect2;
                selectCommand.Parameters.AddWithValue("@stID", stIDChosen);
                sqlConnect2.Open();
                SqlDataReader queryResults2 = selectCommand.ExecuteReader();
                int numSTID = 0;
                while (queryResults2.Read())
                {
                    numSTID = queryResults2.GetInt32(0);
                }
                // If the items are unassigned, go ahed and assign the values to the bridge table.
                if (numSTID == 0)
                {
                    string chosenAID = ddlAuction.SelectedValue.ToString();
                    string chosenSTID = ddlService.SelectedValue.ToString();
                    string stTemp = "";
                    int stID = 0;
                    string separator = "--";
                    int dashIndex = chosenSTID.IndexOf(separator);
                    //Takes stID from the concatenation statement to know which ticket to assign to an auction
                    if (dashIndex > 0)
                    {
                        stTemp = chosenSTID.Substring(0, dashIndex);
                        stID = int.Parse(stTemp);
                    }
                    string aTemp = "";
                    int aID = 0;
                    int dashIndex2 = chosenSTID.IndexOf(separator);
                    //Takes auctionID from the concatenation statement to know which auction
                    if (dashIndex2 > 0)
                    {
                        aTemp = chosenAID.Substring(0, dashIndex2);
                        aID = int.Parse(aTemp);
                    }
                    //Insert with parameters to get values in the bridge table. From here, joins can be used to show items in auctions.
                    string sqlQuery1 = "INSERT INTO AuctionInventory(stID, AuctionID) VALUES (@stID, @aID)";
                    SqlConnection sqlConnect1 = new SqlConnection
                        (WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                    SqlCommand insertCommand = new SqlCommand(sqlQuery1, sqlConnect1);
                    insertCommand.Connection = sqlConnect1;
                    insertCommand.Parameters.AddWithValue("@stID", stID);
                    insertCommand.Parameters.AddWithValue("@aID", aID);
                    sqlConnect1.Open();
                    SqlDataReader queryResults1 = insertCommand.ExecuteReader();
                    queryResults1.Close();
                    sqlConnect1.Close();
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
    }
}
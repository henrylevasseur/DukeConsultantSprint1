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
    public partial class EmpAddItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ddlAuction.Items.Add("Add at Later Date");
        }
        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                //Take variables from data in text fields and assign them.
                float estValue = float.Parse(txtEstValue.Text);
                string itemName = txtItemName.Text;
                string serviceDesc = serviceList.SelectedItem.ToString();
                string separator = "--";
                int dashIndex = serviceDesc.IndexOf(separator);
                string stTemp = "";
                int stID = 0;
                //Find stID from the concatenation Using Right Joins in sqlDataSource
                if (dashIndex > 0)
                {
                    stTemp = serviceDesc.Substring(0, dashIndex);
                    stID = int.Parse(stTemp);
                }
                //Create query and connection to find a new, unique ID value for the item. Close connection.
                string sqlQuery1 = "Select max(itemID) as maxItemID from Inventory";
                SqlConnection sqlConnect1 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                SqlCommand sqlCommand1 = new SqlCommand();
                sqlCommand1.Connection = sqlConnect1;
                sqlCommand1.CommandType = CommandType.Text;
                sqlCommand1.CommandText = sqlQuery1;
                sqlConnect1.Open();
                SqlDataReader queryResults1 = sqlCommand1.ExecuteReader();
                int currentItemID = 0;
                while (queryResults1.Read())
                {
                    currentItemID = queryResults1.GetInt32(0);
                }
                currentItemID = currentItemID + 1;
                queryResults1.Close();
                sqlConnect1.Close();
                //Add new item to inventory. Uses parameters.
                string sqlQuery2 = "Insert into Inventory(itemID, itemName, itemDesc, itemValue) VALUES (@ItemID, @ItemName, @itemDesc, @EstValue)";
                SqlConnection sqlConnect2 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                SqlCommand insertCommand = new SqlCommand(sqlQuery2, sqlConnect2);
                insertCommand.Connection = sqlConnect2;
                insertCommand.Parameters.AddWithValue("@ItemID", currentItemID);
                insertCommand.Parameters.AddWithValue("@ItemName", txtItemName.Text);
                insertCommand.Parameters.AddWithValue("@ItemDesc", txtItemDesc.Text);
                insertCommand.Parameters.AddWithValue("@EstValue", txtEstValue.Text); 
                sqlConnect2.Open();
                SqlDataReader queryResults2 = insertCommand.ExecuteReader();
                queryResults2.Close();
                sqlConnect2.Close();
                //Add to InventoryService (Bridge) table to be able to associate Items with Services. Uses parameters.
                string sqlQuery3 = "Insert into InventoryService(stID, itemID) VALUES (@stID, @itemID)";
                SqlConnection sqlConnect3 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                SqlCommand insertCommand2 = new SqlCommand(sqlQuery3, sqlConnect3);
                insertCommand2.Connection = sqlConnect3;
                insertCommand2.Parameters.AddWithValue("@stID", stID);
                insertCommand2.Parameters.AddWithValue("@itemID", currentItemID);
                sqlConnect3.Open();
                SqlDataReader queryResults3 = insertCommand2.ExecuteReader();
                queryResults3.Close();
                sqlConnect3.Close();

                string chosenAID = ddlAuction.SelectedValue.ToString();               
                string aTemp = "";
                int aID = 0;
                int dashIndex2 = chosenAID.IndexOf(separator);
                //Takes auctionID from the concatenation statement to know which auction
                if (dashIndex2 > 0)
                {
                    aTemp = chosenAID.Substring(0, dashIndex2);
                    aID = int.Parse(aTemp);
                }
                if (ddlAuction.Visible == true)
                {
                    if (!(ddlAuction.Text.Equals("Add at Later Date")))
                    {
                        string sqlQuery5 = "INSERT INTO AuctionInventory(ItemID, AuctionID) VALUES (@itemID, @aID)";
                        SqlConnection sqlConnect5 = new SqlConnection
                            (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                        SqlCommand insertCommand5 = new SqlCommand(sqlQuery5, sqlConnect5);
                        insertCommand5.Connection = sqlConnect5;
                        insertCommand5.Parameters.AddWithValue("@itemID", currentItemID);
                        insertCommand5.Parameters.AddWithValue("@aID", aID);
                        sqlConnect5.Open();
                        SqlDataReader queryResults5 = insertCommand5.ExecuteReader();
                        queryResults5.Close();
                        sqlConnect5.Close();                        
                    }
                }
                lblSaveStatus.ForeColor = Color.Green;
                lblSaveStatus.Text = "Save Successful!";
            }
            //Catches SQL Exceptions And displays a message to user
            catch (SqlException)
            {
                lblSaveStatus.ForeColor = Color.Red;
                lblSaveStatus.Text = "Save Unsuccessful. Please Try Again.";
            }
        }
        //Clears out data fields on click
        protected void ClearBtn_Click(object sender, EventArgs e)
        {
            txtEstValue = null;
            txtItemName = null;
            txtItemDesc = null;
            txtCSearch = null;
        }
        protected Boolean isAuction(string service)
        {
            Boolean auction = false;
            string aletters = "AUCTION";
            service = service.ToUpper();
            if (service.Contains(aletters))
            {
                auction = true;
            }
            return auction;
        }

        protected void serviceList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string testString = serviceList.SelectedValue.ToString();
            if (isAuction(testString))
            {
                lblAddAuction.Visible = true;
                chkAdd.Visible = true;
            }
            else
            {
                lblAddAuction.Visible = false;
                ddlAuction.Visible = false;
                chkAdd.Visible = false;
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblAddAuction.Visible = false;
            ddlAuction.Visible = false;
            chkAdd.Visible = false;
            serviceList.Items.Clear();
            ddlCustomers.Items.Clear();
            string enteredName = txtCSearch.Text;
            string sqlQuery2 = "SELECT CONCAT(cFName, ' ', cLName) FROM Customer WHERE UPPER(CONCAT(cFName, ' ', cLName)) LIKE UPPER(@cName)";
            SqlConnection sqlConnect2 = new SqlConnection
                (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
            SqlCommand selectCommand = new SqlCommand(sqlQuery2, sqlConnect2);
            selectCommand.Connection = sqlConnect2;
            selectCommand.Parameters.AddWithValue("@cName", "%" + enteredName + "%");
            sqlConnect2.Open();
            SqlDataReader queryResults2 = selectCommand.ExecuteReader();
            while (queryResults2.Read())
            {
                ddlCustomers.Items.Add(queryResults2[0].ToString());
            }
            sqlConnect2.Close();
            queryResults2.Close();
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            lblAddAuction.Visible = false;
            ddlAuction.Visible = false;
            chkAdd.Visible = false;
            serviceList.Items.Clear();
            string chosenCName = ddlCustomers.SelectedValue.ToString();
            string enteredName = txtCSearch.Text;
            string sqlQuery2 = "select CONCAT(ServiceTicket.stID, '-- ', Service.sType, ' ', Service.sDate), CONCAT(Customer.cFName, ' ', Customer.cLName), Service.sType from Customer right join ServiceTicket on ServiceTicket.CID = Customer.CID right join Service on Service.sID = ServiceTicket.sID WHERE CONCAT(cFName, ' ', cLName) = @cName";
            SqlConnection sqlConnect2 = new SqlConnection
                (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
            SqlCommand selectCommand = new SqlCommand(sqlQuery2, sqlConnect2);
            selectCommand.Connection = sqlConnect2;
            selectCommand.Parameters.AddWithValue("@cName", chosenCName);
            sqlConnect2.Open();
            SqlDataReader queryResults2 = selectCommand.ExecuteReader();
            while (queryResults2.Read())
            {
                serviceList.Items.Add(queryResults2[0].ToString());
            }
            sqlConnect2.Close();
            queryResults2.Close();
            serviceList.SelectedValue = null;
        }

        protected void chkAdd_CheckedChanged(object sender, EventArgs e)
        {
            if (chkAdd.Checked)
            {
                ddlAuction.Visible = true;
            }
            else
            {
                ddlAuction.Visible = false;
            }
        }
    }
}
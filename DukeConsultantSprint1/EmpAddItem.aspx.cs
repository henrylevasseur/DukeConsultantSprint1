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
                    (WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
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
                string sqlQuery2 = "Insert into Inventory(itemID, itemName, itemValue) VALUES (@ItemID, @ItemName, @EstValue)";
                SqlConnection sqlConnect2 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                SqlCommand insertCommand = new SqlCommand(sqlQuery2, sqlConnect2);
                insertCommand.Connection = sqlConnect2;
                insertCommand.Parameters.AddWithValue("@ItemID", currentItemID);
                insertCommand.Parameters.AddWithValue("@ItemName", txtItemName.Text);
                insertCommand.Parameters.AddWithValue("@EstValue", txtEstValue.Text); ;
                sqlConnect2.Open();
                SqlDataReader queryResults2 = insertCommand.ExecuteReader();
                queryResults2.Close();
                sqlConnect2.Close();
                //Add to InventoryService (Bridge) table to be able to associate Items with Services. Uses parameters.
                string sqlQuery3 = "Insert into InventoryService(stID, itemID) VALUES (@stID, @itemID)";
                SqlConnection sqlConnect3 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                SqlCommand insertCommand2 = new SqlCommand(sqlQuery3, sqlConnect3);
                insertCommand2.Connection = sqlConnect3;
                insertCommand2.Parameters.AddWithValue("@stID", stID);
                insertCommand2.Parameters.AddWithValue("@itemID", currentItemID);
                sqlConnect3.Open();
                SqlDataReader queryResults3 = insertCommand2.ExecuteReader();
                queryResults3.Close();
                sqlConnect3.Close();
                lblSaveStatus.Text = "Save Successful!";
            }
            //Catches SQL Exceptions And displays a message to user
            catch (SqlException)
            {
                lblSaveStatus.Text = "Save Unsuccessful. Please Try Again.";
            }
        }
        //Clears out data fields on click
        protected void ClearBtn_Click(object sender, EventArgs e)
        {
            txtEstValue = null;
            txtItemName = null;
        }
    }
}
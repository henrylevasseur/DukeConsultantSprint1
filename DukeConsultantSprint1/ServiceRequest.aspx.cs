using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;

namespace DukeConsultantSprint1
{
    public partial class ServiceRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void clearBtn_Click(object sender, EventArgs e)
        {
            txtDelivAdd.Text = null;
            txtOrigin = null;
            txtServDate = null;
        }
        // Save button saves service request information
        protected void saveBtn_Click(object sender, EventArgs e)
        {
            //Try-catch for error handling
            try
            {
                //Find Customer by using the session username to get cID
                string cUsername = Session["UserName"].ToString();
                string sqlQuery1 = "Select cID from Customer WHERE cEmail = @Username";
                SqlConnection sqlConnect1 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                SqlCommand selectCommand = new SqlCommand(sqlQuery1, sqlConnect1);
                selectCommand.Connection = sqlConnect1;
                selectCommand.Parameters.AddWithValue("@Username", cUsername);
                sqlConnect1.Open();
                SqlDataReader queryResults1 = selectCommand.ExecuteReader();
                int currentCID = 0;
                while (queryResults1.Read())
                {
                    currentCID = queryResults1.GetInt32(0);
                }
                //Pull the highest service request and add one to ensure you have a unique ID
                string sqlQuery2 = "Select max(srID) as srID from ServiceRequest";
                SqlConnection sqlConnect2 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                SqlCommand sqlCommand2 = new SqlCommand();
                sqlCommand2.Connection = sqlConnect2;
                sqlCommand2.CommandType = CommandType.Text;
                sqlCommand2.CommandText = sqlQuery2;
                sqlConnect2.Open();
                SqlDataReader queryResults2 = sqlCommand2.ExecuteReader();
                int currentsrID = 0;
                while (queryResults2.Read())
                {
                    currentsrID = queryResults2.GetInt32(0);
                }
                currentsrID = currentsrID + 1;
                queryResults2.Close();
                sqlConnect2.Close();
                //Create two different Queries, since Auctions will only have one Address. Choose depending on selection in dropdown.
                string sqlQuery4 = "";
                string cleaning = "";
                string storage = "";
                string TR = "";
                if (chkCleaning.Checked)
                {
                    cleaning = "Yes";
                }
                else
                {
                    cleaning = "No";
                }
                if (chkStorage.Checked)
                {
                    storage = "Yes";
                }
                else
                {
                    storage = "No";
                }
                if (chkTrashRemoval.Checked)
                {
                    TR = "Yes";
                }
                else
                {
                    TR = "No";
                }
                if (DrpDwnServType.SelectedValue.ToString().Equals("Auction"))
                {
                    sqlQuery4 = "Insert into ServiceRequest(srID, srType, sDate, delAdd, cID, status, aoCleaning, aoStorage, aoTR) " +
                      "VALUES(@srID, @sType, @Date, @delAdd, @cID, 'Active', @Cleaning, @Storage, @TrashRemoval)";
                }
                else
                {
                    sqlQuery4 = "Insert into ServiceRequest(srID, srType, sDate, originAddress, delAdd, cID, status, aoCleaning, aoStorage, aoTR) " +
                      "VALUES(@srID, @sType, @Date, @originAddress, @delAdd, @cID, 'Active', @Cleaning, @Storage, @TrashRemoval)";
                }
                //Connect and use parameters before inserting records.
                SqlConnection sqlConnect4 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                SqlCommand insertCommand = new SqlCommand(sqlQuery4, sqlConnect4);
                insertCommand.Connection = sqlConnect4;
                insertCommand.Parameters.AddWithValue("@srID", currentsrID);
                insertCommand.Parameters.AddWithValue("@cID", currentCID);
                insertCommand.Parameters.AddWithValue("@sType", DrpDwnServType.SelectedValue.ToString());
                insertCommand.Parameters.AddWithValue("@Date", txtServDate.Text);
                insertCommand.Parameters.AddWithValue("@originAddress", txtOrigin.Text);
                insertCommand.Parameters.AddWithValue("@delAdd", txtDelivAdd.Text);
                insertCommand.Parameters.AddWithValue("@Cleaning", cleaning);
                insertCommand.Parameters.AddWithValue("@Storage", storage);
                insertCommand.Parameters.AddWithValue("@TrashRemoval", TR);
                sqlConnect4.Open();
                SqlDataReader queryResults4 = insertCommand.ExecuteReader();
                queryResults4.Close();
                sqlConnect4.Close();
                lblSaveStatus.ForeColor = Color.Green;
                lblSaveStatus.Text = "Request Sent";
            }
            //Catches sqlExceptions
            catch (SqlException)
            {
                lblSaveStatus.ForeColor = Color.Red;
                lblSaveStatus.Text = "Could not Apply Request";
            }

        }
        //Set visibility modifiers for address based on the selected value in service type dropdown.
        protected void DrpDwnServType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string chosenType = DrpDwnServType.SelectedValue.ToString();
            if (chosenType.Equals("Move"))
            {
                lblOriginAddress.Visible = true;
                txtOrigin.Visible = true;
                rfOrigValidator.Visible = true;
            }
            else
            {
                lblOriginAddress.Visible = false;
                txtOrigin.Visible = false;
                rfOrigValidator.Visible = false;
            }
        }
    }
}
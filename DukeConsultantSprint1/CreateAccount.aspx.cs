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
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void clearBtn_Click(object sender, EventArgs e)
        {
            txtAddress.Text = null;
            txtEmail.Text = null;
            txtFName.Text = null;
            txtLName.Text = null;
            txtPhone.Text = null;
            txtPW.Text = null;
            txtPW2.Text = null;
        }
        //Method dictates action on save button click
        protected void saveBtn_Click(object sender, EventArgs e)
        {
            //Try-catch for error handling
            try
            {
                //Take max cid in order to set a new one guaranteed to be unique
                string sqlQuery1 = "Select max(cID) as maxCID from Customer";
                SqlConnection sqlConnect1 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                SqlCommand sqlCommand1 = new SqlCommand();
                sqlCommand1.Connection = sqlConnect1;
                sqlCommand1.CommandType = CommandType.Text;
                sqlCommand1.CommandText = sqlQuery1;
                sqlConnect1.Open();
                SqlDataReader queryResults1 = sqlCommand1.ExecuteReader();
                int currentCID = 0;
                while (queryResults1.Read())
                {
                    currentCID = queryResults1.GetInt32(0);
                }
                currentCID = currentCID + 1;
                queryResults1.Close();
                sqlConnect1.Close();
                //now do the same for loginID
                string sqlQuery2 = "Select max(loginID) as maxLID from Login";
                SqlConnection sqlConnect2 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString);
                SqlCommand sqlCommand2 = new SqlCommand();
                sqlCommand2.Connection = sqlConnect2;
                sqlCommand2.CommandType = CommandType.Text;
                sqlCommand2.CommandText = sqlQuery2;
                sqlConnect2.Open();
                SqlDataReader queryResults2 = sqlCommand2.ExecuteReader();
                int currentLID = 0;
                while (queryResults2.Read())
                {
                    currentLID = queryResults2.GetInt32(0);
                }
                currentLID = currentLID + 1;
                queryResults2.Close();
                sqlConnect2.Close();
                string addPhoneType = ddlPhoneType.SelectedValue.ToString();
                //Insert into customer based on values in text fields
                string sqlQuery3 = "INSERT INTO Customer (cID, cFName, cLName, cAddress, cPhone, cPhoneType, cDesc, cEmail, cInitialContactType) Values (@cID, @FirstName, @LastName, @Address, @Phone, @PhoneType, @Desc, @Email, '" + "Customer Portal" + "')";
                SqlConnection sqlConnect3 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                SqlCommand insertCommand = new SqlCommand(sqlQuery3, sqlConnect3);
                insertCommand.Connection = sqlConnect3;
                insertCommand.Parameters.AddWithValue("@cID", currentCID);
                insertCommand.Parameters.AddWithValue("@FirstName", txtFName.Text);
                insertCommand.Parameters.AddWithValue("@LastName", txtLName.Text);
                insertCommand.Parameters.AddWithValue("@Email", txtEmail.Text);
                insertCommand.Parameters.AddWithValue("@Address", txtAddress.Text);
                insertCommand.Parameters.AddWithValue("@Phone", txtPhone.Text);
                insertCommand.Parameters.AddWithValue("@PhoneType", addPhoneType);
                insertCommand.Parameters.AddWithValue("@Desc", txtDesc.Text);
                sqlConnect3.Open();
                SqlDataReader queryResults3 = insertCommand.ExecuteReader();
                queryResults3.Close();
                sqlConnect3.Close();
                //Create a hashed login in the auth database
                string sqlQuery4 = "INSERT INTO Login (loginID, cUserName, cPassword) Values (" + currentLID + ", @Email, @Password)";
                SqlConnection sqlConnect4 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString);
                SqlCommand insertCommand1 = new SqlCommand(sqlQuery4, sqlConnect4);
                insertCommand1.Connection = sqlConnect4;
                insertCommand1.Parameters.AddWithValue("@Email", txtEmail.Text);
                insertCommand1.Parameters.AddWithValue("@Password", PasswordHash.HashPassword(txtPW.Text));
                sqlConnect4.Open();
                SqlDataReader queryResults4 = insertCommand1.ExecuteReader();
                queryResults4.Close();
                sqlConnect4.Close();
                saveStatus.ForeColor = Color.Green;
                saveStatus.Text = "Account Created!";
            }
            //Catches sql Exceptions
            catch (SqlException)
            {
                saveStatus.ForeColor = Color.Red;
                saveStatus.Text = "Account could not be created. Please use a new Email and ensure data is correct.";
            }

        }
        //Return to Login Screen
        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
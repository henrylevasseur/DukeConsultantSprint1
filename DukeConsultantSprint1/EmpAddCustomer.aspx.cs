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
    public partial class EmpAddCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void populateBtn_Click(object sender, EventArgs e)
        {
            txtFName.Text = "Jon";
            txtLName.Text = "Jones";
            txtAddress.Text = "123 Cherry Ln";
            txtPhone.Text = "4447891234";
            txtDesc.Text = "Referral";
            txtEmail.Text = "jonbonesjones@ufc.net";
        }
        //Dictates actions on save button click
        protected void saveBtn_Click(object sender, EventArgs e)
        {
            //Try-catch catches exceptions in sql and displays a message that the record could not be added.
            try
            {
                //SQL Query established a connection, Finds the maximum customer, and sets a variable to the integer of that customer +1 so that new customers will have a unique Identifier.
                string sqlQuery1 = "Select max(cID) as maxCID from Customer";
                SqlConnection sqlConnect1 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
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
                //Establishes Variables based on Items in UI fields.
                string addFName = txtFName.Text;
                string addLName = txtLName.Text;
                string addAddress = txtAddress.Text;
                string addPhone = txtPhone.Text;
                string addPhoneType = ddlPhoneType.SelectedValue.ToString();
                string addDesc = txtDesc.Text;
                string addEmail = txtEmail.Text;
                string addCType = "";
                string chosenType = ddlContactType.SelectedValue.ToString();
                //Sets the Type of contact to either the selected item in the Drop Down List or the text box that appears when 'Other' is selected.
                if (chosenType.Equals("Other"))
                {
                    if (txtOtherDesc.Text != null)
                    {
                        addCType = txtOtherDesc.Text;
                    }

                }
                else
                {
                    addCType = chosenType;
                }
                //Establishes a new query and connection that is passed into the Lab3 database. Because of the unique constaint for customer name, a SqlException can be thrown here if the name already exists. Exceptions can also be thrown for incorrect data types.
                //Uses parameters
                string sqlQuery = "Insert into Customer(cID, cFName, cLName, cAddress, cPhone, cPhoneType, cDesc, cEmail, cInitialContactType) " +
                    "VALUES(@cID, @FirstName, @LastName, @Address, @Phone, @PhoneType, @Desc, @Email, @ContactType)";
                SqlConnection sqlConnect = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                SqlCommand insertCommand = new SqlCommand(sqlQuery, sqlConnect);
                insertCommand.Connection = sqlConnect;
                insertCommand.Parameters.AddWithValue("@cID", currentCID);
                insertCommand.Parameters.AddWithValue("@FirstName", txtFName.Text);
                insertCommand.Parameters.AddWithValue("@LastName", txtLName.Text);
                insertCommand.Parameters.AddWithValue("@Email", txtEmail.Text);
                insertCommand.Parameters.AddWithValue("@Address", txtAddress.Text);
                insertCommand.Parameters.AddWithValue("@Phone", txtPhone.Text);
                insertCommand.Parameters.AddWithValue("@PhoneType", ddlPhoneType.SelectedValue.ToString());
                insertCommand.Parameters.AddWithValue("@Desc", txtDesc.Text);
                insertCommand.Parameters.AddWithValue("@ContactType", addCType);
                sqlConnect.Open();
                SqlDataReader queryResults = insertCommand.ExecuteReader();
                queryResults.Close();
                sqlConnect.Close();
                //If code is executed without Error, Displays a successful Save message to the user.
                saveStatus.Text = "Last Save Executed Successfully!";
            }
            //Catches all SqlExceptions and displays a common error message.
            catch (SqlException)
            {
                saveStatus.Text = "Save Could Not be Executed. Please Ensure the Customer Name is Unique and all Fields are Filled in.";
            }
        }
        //Clears out data fields
        protected void clearBtn_Click(object sender, EventArgs e)
        {
            txtFName.Text = null;
            txtLName.Text = null;
            txtAddress.Text = null;
            txtDesc.Text = null;
            txtEmail.Text = null;
            txtPhone.Text = null;
            txtOtherDesc.Text = null;
        }
        //Depending on initial contact type, this will prompt user to enter a value which will be inserted as opposed to 'Other'
        protected void ddlContactType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string chosenItem = ddlContactType.SelectedValue.ToString();
            if (chosenItem.Equals("Other"))
            {
                lblOtherDesc.Visible = true;
                txtOtherDesc.Visible = true;
                otherValidator.Visible = true;
            }
            else
            {
                lblOtherDesc.Visible = false;
                txtOtherDesc.Visible = false;
                otherValidator.Visible = false;
            }
        }
    }
}
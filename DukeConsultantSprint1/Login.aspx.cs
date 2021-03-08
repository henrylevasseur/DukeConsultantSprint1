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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblStatus.ForeColor = Color.Red;
            if (Session["InvalidUsage"] != null)
            {
                lblStatus.Text = Session["InvalidUsage"].ToString();
            }
            if (Session["LoggedOut"] != null)
            {
                lblStatus.Text = Session["LoggedOut"].ToString();
            }
            if (Request.QueryString.Get("loggedout") == "true")
            {
                lblStatus.ForeColor = Color.Green;
                lblStatus.Text = "User Successfully Logged Out!";
            }
        }
        // Allow user to attempt to login.
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //Try-Catch for error handling
            try
            {
                SqlConnection sqlConnect = new SqlConnection
                                (WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString);
                SqlCommand loginCommand = new SqlCommand();
                loginCommand.Connection = sqlConnect;
                loginCommand.CommandType = CommandType.StoredProcedure;
                //Use stored procedure
                loginCommand.CommandText = "JeremyEzellLab3";
                loginCommand.Parameters.Add(new SqlParameter("@UserName", txtUsername.Text));
                sqlConnect.Open();
                SqlDataReader reader = loginCommand.ExecuteReader();
                //Check and compare to items in db, proceed if user matches.
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        string storedHash = reader["cPassword"].ToString();
                        if (PasswordHash.ValidatePassword(txtPassword.Text, storedHash))
                        {
                            Session["UserName"] = txtUsername.Text;
                            Response.Redirect("CustomerHomepage.aspx");
                        }
                    }
                }
                //If username is incorrect, display a general message stating the login information is incorrect.
                else
                {
                    lblStatus.ForeColor = Color.Red;
                    lblStatus.Text = "Incorrect Login Information, Please try Again!";
                }
                sqlConnect.Close();
                reader.Close();
            }
            // Catch certain mistakes and errors.
            catch (SqlException)
            {
                lblStatus.ForeColor = Color.Red;
                lblStatus.Text = "Incorrect Login Information, Please try Again!";
            }
        }
        //If user chooses to create an account, Redirect them to the CreateAccount.aspx page
        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateAccount.aspx");
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginType.aspx");
        }
    }
}
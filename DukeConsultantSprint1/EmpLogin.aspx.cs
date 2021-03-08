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
    public partial class EmpLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnect = new SqlConnection
                                (WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString);
            SqlCommand loginCommand = new SqlCommand();
            loginCommand.Connection = sqlConnect;
            loginCommand.CommandText = "SELECT empPassword FROM EmpLogin WHERE empUsername = @Username";
            loginCommand.Parameters.Add(new SqlParameter("@UserName", txtUsername.Text));
            sqlConnect.Open();
            SqlDataReader reader = loginCommand.ExecuteReader();
            //If else compares hashed passwords with usernames common to those in the db, sets session variable and redirects to homepage if successful.
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    string storedHash = reader["empPassword"].ToString();
                    if (PasswordHash.ValidatePassword(txtPassword.Text, storedHash))
                    {
                        Session["UserName"] = txtUsername.Text;
                        Response.Redirect("EmpHomepage.aspx");
                    }
                }
            }
            else
            {
                lblStatus.ForeColor = Color.Red;
                lblStatus.Text = "Incorrect Login Information, Please try Again!";
            }
            sqlConnect.Close();
            reader.Close();
        }
        //Method to return to home on return button click.
        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginType.aspx");
        }
    }
}
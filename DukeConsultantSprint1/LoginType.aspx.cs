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
    public partial class LoginType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Check how page was accessed and display message if the user tried to access the system incorrectly
            //Also display a message if a user has logged out.
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
        //Option to sign in as employee takes user to the employee login form.
        protected void BtnEmployee_Click(object sender, EventArgs e)
        {
            Session["ChosenType"] = "E";
            Response.Redirect("EmpLogin.aspx");
        }
        //Option to sign in as customer takes user to the customer login form.
        protected void BtnCustomer_Click(object sender, EventArgs e)
        {
            Session["ChosenType"] = "C";
            Response.Redirect("Login.aspx");
        }
    }
}
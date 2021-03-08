using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DukeConsultantSprint1
{
    public partial class EmployeeMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Session["InvalidUsage"] = "You must first Log In Successfully!";
                Response.Redirect("LoginType.aspx");
            }
        }
        // Abandon session if user chooses to log out
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("LoginType.aspx?loggedout=true");
        }
        //Put go to homepage button in the masterpage so that the user can direct to homepage from anywhere in the portal
        protected void btnGoToHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmpHomepage.aspx");
        }
    }
}
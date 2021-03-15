using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DukeConsultantSprint1
{
    public partial class CustomerMaster : System.Web.UI.MasterPage
    { 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Session["InvalidUsage"] = "You must first Log In Successfully!";
                Response.Redirect("LoginType.aspx");
            }
            else
            {
                lblUser.Text = "User " + Session["Username"].ToString() + " signed in successfully!";
            }
        }
        //If user opts to log out, Close the session and redirect back to login screen.
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("LoginType.aspx?loggedout=true");
        }

        protected void btnHomepage_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerHomepage.aspx");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
namespace DukeConsultantSprint1
{
    public partial class CustomerHomepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {
            string selected = ddlCustItems.Text;
            if (selected.Equals("Create Service Request"))
            {
                Response.Redirect("ServiceRequest.aspx");
            }
            else if (selected.Equals("Moving Information"))
            {
                Response.Redirect("House Form.aspx");
            }
            else if (selected.Equals("Add Items to Service"))
            {
                Response.Redirect("CustomerAddItems.aspx");
            }
        }
    }
}
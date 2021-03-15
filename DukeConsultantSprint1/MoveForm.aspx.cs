using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;
using System.Web.Configuration;




namespace DukeConsultantSprint1
{
    public partial class MoveForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString.ToString());
                sc.Open();

                System.Data.SqlClient.SqlCommand createMoveForm = new System.Data.SqlClient.SqlCommand();
                createMoveForm.Connection = sc;

                createMoveForm.CommandText = "INSERT INTO [dbo].[House] (hStories, hLoadingNote, hDriveway, hDistanceFromHouse) VALUES (@Stories, @LoadingNote, @Driveway, @DistanceFromHouse)";
                createMoveForm.Parameters.Add(new SqlParameter("@Stories", txtStories.Text));
                createMoveForm.Parameters.Add(new SqlParameter("@LoadingNote", txtLoadingConditions.Text));
                createMoveForm.Parameters.Add(new SqlParameter("@Driveway", txtDrivewayAccessibility.Text));
                createMoveForm.Parameters.Add(new SqlParameter("@DistanceFromHouse", txtTruckDistance.Text));
                createMoveForm.ExecuteNonQuery();

                sc.Close();
                if (CBBasement.Checked)
                {
                    Session["Basement"] = CBBasement.Checked;
                }
                else
                {
                    //do nothing
                }
                lblStatus.ForeColor = Color.Green;
                lblStatus.Text = "You had Submit Your House Form";
                Session["Floor"] = txtStories.Text;
                Response.Redirect("RoomForm.aspx");

            }
            catch
            {
                lblStatus.ForeColor = Color.Red;
                lblStatus.Text = "Something wrong with the system. Please try again later!";
            }
        }
    }
}
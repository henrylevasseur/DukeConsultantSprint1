using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;

namespace DukeConsultantSprint1
{
    public partial class RoomForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnAddRoom_Click(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["Floor"] != null)
                {
                    int floor = Int32.Parse(Session["Floor"].ToString());
                    for (int i = floor; i > 0; i--)
                    {
                        int counter = 1;
                        ListItem listItem = new ListItem(i.ToString(), i.ToString());
                        DDLFloor.Items.Insert(counter - 1, listItem);
                        counter++;
                    }
                }
                if (Session["Basement"] != null)
                {
                    ListItem ddlBasement = new ListItem("Basement", "Basement");
                    DDLFloor.Items.Insert(Int32.Parse(Session["Floor"].ToString()) + 1, ddlBasement);

                }
            }
        }

        protected void BtnAddRoom_Click1(object sender, EventArgs e)
        {
            try
            {
                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString.ToString());
                sc.Open();

                System.Data.SqlClient.SqlCommand AddRoomForm = new System.Data.SqlClient.SqlCommand();
                AddRoomForm.Connection = sc;

                AddRoomForm.CommandText = "INSERT INTO [dbo].[Room] (rType, rFloor, rEntrance, rBlankets, rLargeBox, rMediumBox, rSmallBox, rNote, rWardrobeBox, rArtBox, rExtraBox, hID) VALUES " +
                    "(@Type, @Floor, @Entrance, @Blankets, @Large, @Medium, @Small, @Note, @Wardrobe, @Art, @Extra, (select max(hID) from House))";
                AddRoomForm.Parameters.Add(new SqlParameter("@Type", txtRoomType.Text));
                AddRoomForm.Parameters.Add(new SqlParameter("@Floor", DDLFloor.SelectedValue.ToString()));
                AddRoomForm.Parameters.Add(new SqlParameter("@Entrance", txtEntranceType.Text));
                AddRoomForm.Parameters.Add(new SqlParameter("@Blankets", txtBlankets.Text));
                AddRoomForm.Parameters.Add(new SqlParameter("@Large", txtLargeBox.Text));
                AddRoomForm.Parameters.Add(new SqlParameter("@Medium", txtMediumBox.Text));
                AddRoomForm.Parameters.Add(new SqlParameter("@Small", txtSmallBox.Text));
                AddRoomForm.Parameters.Add(new SqlParameter("@Note", txtAdditionalNote.Text));
                AddRoomForm.Parameters.Add(new SqlParameter("@Wardrobe", txtWardrobe.Text));
                AddRoomForm.Parameters.Add(new SqlParameter("@Art", txtArt.Text));
                AddRoomForm.Parameters.Add(new SqlParameter("@Extra", txtOther.Text));
                AddRoomForm.ExecuteNonQuery();
                sc.Close();

                lblStatus.ForeColor = Color.Green;
                lblStatus.Text = "You had been Successfully Added a Room!";
                txtRoomType.Text = String.Empty;
                txtEntranceType.Text = String.Empty;
                txtBlankets.Text = String.Empty;
                txtSmallBox.Text = "0";
                txtMediumBox.Text = "0";
                txtLargeBox.Text = "0";
                txtWardrobe.Text = "0";
                txtArt.Text = "0";
            }
            catch
            {
                lblStatus.ForeColor = Color.Red;
                lblStatus.Text = "Something Wrong With the System, Please Try Again Later!";
            }
        }
    }
}
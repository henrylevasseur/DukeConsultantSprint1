using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace DukeConsultantSprint1
{
    public partial class RoomForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnAddRoom_Click(object sender, EventArgs e)
        {
            if(txtRoomType.Text != "" && txtEntranceType.Text != "" && txtPackingBoxes.Text != "" && txtBoxesType.Text != "" 
                && txtBoxesNumber.Text != "" && txtBlankets.Text != "")
            {
                lstbxAddedRoom.Items.Add(new ListItem(txtRoomType.Text));
                txtRoomType.Text = String.Empty;
                txtEntranceType.Text = String.Empty;
                txtPackingBoxes.Text = String.Empty;
                txtBoxesType.Text = String.Empty;
                txtBoxesNumber.Text = String.Empty;
                txtBlankets.Text = String.Empty;
                lblStatus.ForeColor = Color.Green;
                lblStatus.Text = "You had been Successfully Added a Room!";
            }
            else
            {
                lblStatus.ForeColor = Color.Red;
                lblStatus.Text = "Please Fill up all the field";
            }
        }
    }
}
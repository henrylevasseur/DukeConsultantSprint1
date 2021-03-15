using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace DukeConsultantSprint1
{
    public partial class EmpEditTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ClearBtn_Click(object sender, EventArgs e)
        {
            txtNoteTitle.Text = null;
            txtNote.Text = null;
            txtthDate.Text = null;
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                //Assign variables based on UI elements
                string thEmployee = DDLEmployee.SelectedValue.ToString();
                string thNoteTitle = txtNoteTitle.Text;
                string thNote = txtNote.Text;
                string thDate = txtthDate.Text;
                string thStatus = DDLthStatus.SelectedValue.ToString();
                string thService = ListBoxSerivce.SelectedItem.ToString();
                string separator = "--";
                int dashIndex = thService.IndexOf(separator);
                //Get stID based on concatenation selected
                string stTemp = "";
                int stID = 0;
                if (dashIndex > 0)
                {
                    stTemp = thService.Substring(0, dashIndex);
                    stID = int.Parse(stTemp);
                }
                //Create query and connection that provides a unique tickethistoryID for new record
                string sqlQuery1 = "Select max(thID) as maxthID from TicketHistory";
                SqlConnection sqlConnect1 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                SqlCommand sqlCommand1 = new SqlCommand();
                sqlCommand1.Connection = sqlConnect1;
                sqlCommand1.CommandType = CommandType.Text;
                sqlCommand1.CommandText = sqlQuery1;
                sqlConnect1.Open();
                SqlDataReader queryResults1 = sqlCommand1.ExecuteReader();
                int currentthID = 0;
                while (queryResults1.Read())
                {
                    currentthID = queryResults1.GetInt32(0);
                }
                currentthID = currentthID + 1;
                queryResults1.Close();
                sqlConnect1.Close();
                //Find employee ID based on Employee Name
                string sqlQuery = "Select eID from Employee WHERE eName = @EmpName";
                SqlConnection sqlConnect = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                SqlCommand selectCommand = new SqlCommand(sqlQuery, sqlConnect);
                selectCommand.Connection = sqlConnect;
                selectCommand.Parameters.AddWithValue("@EmpName", thEmployee);
                sqlConnect.Open();
                SqlDataReader queryResults = selectCommand.ExecuteReader();
                int thCurrentEID = 0;
                while (queryResults.Read())
                {
                    thCurrentEID = queryResults.GetInt32(0);
                }
                queryResults.Close();
                sqlConnect.Close();
                //Add record to TicketHistory using parameters
                string sqlQuery4 = "Insert into TicketHistory(thID, thDate ,thNoteTitle, thNote, stID, eID, stStatus) " +
                       "VALUES (@thID, @Date, @Title, @Note, @stID, @eID, @Status)";
                SqlConnection sqlConnect4 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                SqlCommand insertCommand = new SqlCommand(sqlQuery4, sqlConnect4);
                insertCommand.Connection = sqlConnect4;
                insertCommand.Parameters.AddWithValue("@thID", currentthID);
                insertCommand.Parameters.AddWithValue("@Date", txtthDate.Text);
                insertCommand.Parameters.AddWithValue("@Title", txtNoteTitle.Text);
                insertCommand.Parameters.AddWithValue("@Note", txtNote.Text);
                insertCommand.Parameters.AddWithValue("@stID", stID);
                insertCommand.Parameters.AddWithValue("@eID", thCurrentEID);
                insertCommand.Parameters.AddWithValue("@Status", DDLthStatus.SelectedValue.ToString());
                sqlConnect4.Open();
                SqlDataReader queryResults4 = insertCommand.ExecuteReader();
                queryResults4.Close();
                sqlConnect4.Close();
                lblTHSaveStatus.Text = "Workflow added Successfully!";
            }
            //Catches SqlExceptions and displays message to user.
            catch (SqlException)
            {
                lblTHSaveStatus.Text = "Workflow unable to be added. No Apostrophes!";
            }
        }
    }
}
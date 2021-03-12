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

                string sqlQuery10 = "Select max(aoID) as maxaoID from AddOnService";
                SqlConnection sqlConnect10 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                SqlCommand sqlCommand10 = new SqlCommand();
                sqlCommand10.Connection = sqlConnect10;
                sqlCommand10.CommandType = CommandType.Text;
                sqlCommand10.CommandText = sqlQuery10;
                sqlConnect10.Open();
                SqlDataReader queryResults10 = sqlCommand10.ExecuteReader();
                int currentaoID = 0;
                while (queryResults10.Read())
                {
                    currentaoID = queryResults10.GetInt32(0);
                }
                queryResults10.Close();
                sqlConnect10.Close();

                if (chkCleaning.Checked)
                {
                    currentaoID = currentaoID + 1;
                    string sqlQuery12 = "INSERT INTO AddOnService(aoID, aoType, stID, aoCost) " +
                    "VALUES(@aoID, @aoType, @stID, @aoCost)"; ;
                    SqlConnection sqlConnect12 = new SqlConnection
                        (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                    SqlCommand insertCommand12 = new SqlCommand(sqlQuery12, sqlConnect12);
                    insertCommand12.Connection = sqlConnect12;
                    insertCommand12.Parameters.AddWithValue("@aoID", currentaoID);
                    insertCommand12.Parameters.AddWithValue("@aoType", "Cleaning");
                    insertCommand12.Parameters.AddWithValue("@stID", stID);
                    insertCommand12.Parameters.AddWithValue("@aoCost", "100.00");
                    sqlConnect12.Open();
                    SqlDataReader queryResults12 = insertCommand12.ExecuteReader();
                    queryResults12.Close();
                    sqlConnect12.Close();
                }
                if (chkStorage.Checked)
                {
                    currentaoID = currentaoID + 1;
                    string sqlQuery13 = "INSERT INTO AddOnService(aoID, aoType, stID, aoCost) " +
                    "VALUES(@aoID, @aoType, @stID, @aoCost)"; ;
                    SqlConnection sqlConnect13 = new SqlConnection
                        (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                    SqlCommand insertCommand13 = new SqlCommand(sqlQuery13, sqlConnect13);
                    insertCommand13.Connection = sqlConnect13;
                    insertCommand13.Parameters.AddWithValue("@aoID", currentaoID);
                    insertCommand13.Parameters.AddWithValue("@aoType", "Storage");
                    insertCommand13.Parameters.AddWithValue("@stID", stID);
                    insertCommand13.Parameters.AddWithValue("@aoCost", "100.00");
                    sqlConnect13.Open();
                    SqlDataReader queryResults13 = insertCommand13.ExecuteReader();
                    queryResults13.Close();
                    sqlConnect13.Close();
                }
                if (chkStorage.Checked)
                {
                    currentaoID = currentaoID + 1;
                    string sqlQuery14 = "INSERT INTO AddOnService(aoID, aoType, stID, aoCost) " +
                    "VALUES(@aoID, @aoType, @stID, @aoCost)"; ;
                    SqlConnection sqlConnect14 = new SqlConnection
                        (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                    SqlCommand insertCommand14 = new SqlCommand(sqlQuery14, sqlConnect14);
                    insertCommand14.Connection = sqlConnect14;
                    insertCommand14.Parameters.AddWithValue("@aoID", currentaoID);
                    insertCommand14.Parameters.AddWithValue("@aoType", "Trash Removal");
                    insertCommand14.Parameters.AddWithValue("@stID", stID);
                    insertCommand14.Parameters.AddWithValue("@aoCost", "100.00");
                    sqlConnect14.Open();
                    SqlDataReader queryResults14 = insertCommand14.ExecuteReader();
                    queryResults14.Close();
                    sqlConnect14.Close();

                    lblTHSaveStatus.ForeColor = Color.Green;
                    lblTHSaveStatus.Text = "Workflow added Successfully!";
                }
            }
            //Catches SqlExceptions and displays message to user.
            catch (SqlException)
            {
                lblTHSaveStatus.Text = "Workflow unable to be added. No Apostrophes!";
            }
        }
    }
}
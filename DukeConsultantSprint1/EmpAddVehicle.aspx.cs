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
    public partial class EmpAddVehicle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            //Try-catch for error handling.
            try
            {
                //Creates variables from Data in UI
                string chosenVName = VehicleDropdown.SelectedValue.ToString();
                string serviceDesc = LBService.SelectedValue.ToString();
                string stTemp = "";
                int stID = 0;
                string separator = "--";
                int dashIndex = serviceDesc.IndexOf(separator);
                //Takes stID from the concatenation statement to know which ticket the vehicle is being added to
                if (dashIndex > 0)
                {
                    stTemp = serviceDesc.Substring(0, dashIndex);
                    stID = int.Parse(stTemp);
                }
                //Query and connection established to find vehicle ID based on the selected Name, uses parameters.
                string sqlQuery1 = "Select vID from Vehicle WHERE vName = @vName";
                SqlConnection sqlConnect1 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                SqlCommand selectCommand = new SqlCommand(sqlQuery1, sqlConnect1);
                selectCommand.Connection = sqlConnect1;
                selectCommand.Parameters.AddWithValue("@vName", chosenVName);
                sqlConnect1.Open();
                SqlDataReader queryResults1 = selectCommand.ExecuteReader();
                int currentVID = 0;
                while (queryResults1.Read())
                {
                    currentVID = queryResults1.GetInt32(0);
                }
                queryResults1.Close();
                sqlConnect1.Close();
                //Adds row to bridge table based on information in UI.
                string sqlQuery2 = "Insert into SerVehc(stID, vID) VALUES (@stID, @vID)";
                SqlConnection sqlConnect2 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                SqlCommand insertCommand = new SqlCommand(sqlQuery2, sqlConnect2);
                insertCommand.Connection = sqlConnect2;
                insertCommand.Parameters.AddWithValue("@stID", stID);
                insertCommand.Parameters.AddWithValue("@vID", currentVID);
                sqlConnect2.Open();
                SqlDataReader queryResults2 = insertCommand.ExecuteReader();
                queryResults2.Close();
                sqlConnect2.Close();
                //Displays message to user indicating that the association was successfully added.
                vStatus.ForeColor = Color.Green;
                vStatus.Text = "Vehicle Added to Service!";
            }
            //Catches sql Exceptions and displays a message to the user indicating that the association could not be added.
            catch (SqlException)
            {
                vStatus.ForeColor = Color.Red;
                vStatus.Text = "Could not add Vehicle to Service. Please make sure this vehicle is not already assigned and a service is selected.";
            }
        }
    }
}
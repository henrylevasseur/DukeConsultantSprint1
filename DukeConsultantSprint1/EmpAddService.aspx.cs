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
    public partial class EmpAddService : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["activeSR"] != null))
            {
                string sqlQuery7 = "SELECT ServiceRequest.sType, Concat(Customer.cFName, ' ', Customer.cLName), FORMAT(ServiceRequest.sDate, 'yyyy-MM-dd'), ServiceRequest.originAddress, ServiceRequest.delAdd From ServiceRequest INNER Join Customer on Customer.cID = serviceRequest.cID Where ServiceRequest.srID = " + Session["activeSR"];
                SqlConnection sqlConnect7 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                SqlCommand sqlCommand7 = new SqlCommand();
                sqlCommand7.Connection = sqlConnect7;
                sqlCommand7.CommandType = CommandType.Text;
                sqlCommand7.CommandText = sqlQuery7;
                sqlConnect7.Open();
                SqlDataReader queryResults7 = sqlCommand7.ExecuteReader();
                //Depending on Service Type, Populate certain fields. Set DateTime format to one accepted by SQL.
                while (queryResults7.Read())
                {
                    txtOpenDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                    if (queryResults7.GetString(0).Equals("Auction"))
                    {
                        lblOriginAddress.Visible = false;
                        txtOrigin.Visible = false;
                        origValidator.Visible = false;
                        DrpDwnServType.SelectedValue = queryResults7.GetString(0);
                        LBCustServ.SelectedValue = queryResults7.GetString(1);
                        txtServDate.Text = queryResults7.GetString(2);
                        txtDelivAdd.Text = queryResults7.GetString(4);
                    }
                    else
                    {
                        lblOriginAddress.Visible = true;
                        txtOrigin.Visible = true;
                        origValidator.Visible = true;
                        DrpDwnServType.SelectedValue = queryResults7.GetString(0);
                        LBCustServ.SelectedValue = queryResults7.GetString(1);
                        txtServDate.Text = queryResults7.GetString(2);
                        txtOrigin.Text = queryResults7.GetString(3);
                        txtDelivAdd.Text = queryResults7.GetString(4);
                    }
                }
                queryResults7.Close();
                sqlConnect7.Close();
            }
            else
            {
                //Make sure that the ticket opening date is the current date on all pageloads.
                txtOpenDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }
        //Populate with sample data
        protected void btnPopulate_Click(object sender, EventArgs e)
        {
            txtOpenDate.Text = null;
            txtServDate.Text = null;
            txtServCost.Text = "220.00";
            txtDelivAdd.Text = "111 Address Ln";
            txtComDate.Text = null;
        }
        //Save button saves Service, ServiceTicket, and TicketHistory records.
        protected void btnSave_Click(object sender, EventArgs e)
        {
            //Uses try-catch for error handling.
            try
            {
                //Create variables based on values in UI fields.
                string sAddType = DrpDwnServType.SelectedValue.ToString();
                string stAddCust = LBCustServ.SelectedValue.ToString();
                DateTime stOpenDate = DateTime.Parse(txtOpenDate.Text);
                DateTime sSDate = DateTime.Parse(txtServDate.Text);
                float sCost = float.Parse(txtServCost.Text);
                string sFromAdd = "";
                //Assigns fromaddress as null automatically if the service is an auction
                if (sAddType.Equals("Move"))
                {
                    sFromAdd = txtOrigin.Text;
                }
                else
                {
                    sFromAdd = null;
                }
                string sDelAdd = txtDelivAdd.Text;
                DateTime sCDate = DateTime.Parse(txtComDate.Text);
                string stSelectedEmp = ddlEmployees.SelectedValue.ToString();
                //Establishes query string and connaction to get the employee ID based on the name selected by the system user.
                string sqlQuery = "Select eID from Employee WHERE eName = @EmpName";
                SqlConnection sqlConnect = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                SqlCommand selectCommand = new SqlCommand(sqlQuery, sqlConnect);
                selectCommand.Connection = sqlConnect;
                selectCommand.Parameters.AddWithValue("@EmpName", stSelectedEmp);
                sqlConnect.Open();
                SqlDataReader queryResults = selectCommand.ExecuteReader();
                int stCurrentEID = 0;
                while (queryResults.Read())
                {
                    stCurrentEID = queryResults.GetInt32(0);
                }
                queryResults.Close();
                sqlConnect.Close();
                //Establishes a unique serviceID for the service being added.
                string sqlQuery1 = "Select max(sID) as maxSID from Service";
                SqlConnection sqlConnect1 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                SqlCommand sqlCommand1 = new SqlCommand();
                sqlCommand1.Connection = sqlConnect1;
                sqlCommand1.CommandType = CommandType.Text;
                sqlCommand1.CommandText = sqlQuery1;
                sqlConnect1.Open();
                SqlDataReader queryResults1 = sqlCommand1.ExecuteReader();
                int currentSID = 0;
                while (queryResults1.Read())
                {
                    currentSID = queryResults1.GetInt32(0);
                }
                currentSID = currentSID + 1;
                queryResults1.Close();
                sqlConnect1.Close();
                //Establishes a unique service ticket ID for the Ticket being added
                string sqlQuery2 = "Select max(stID) as maxstID from ServiceTicket";
                SqlConnection sqlConnect2 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                SqlCommand sqlCommand2 = new SqlCommand();
                sqlCommand2.Connection = sqlConnect2;
                sqlCommand2.CommandType = CommandType.Text;
                sqlCommand2.CommandText = sqlQuery2;
                sqlConnect2.Open();
                SqlDataReader queryResults2 = sqlCommand2.ExecuteReader();
                int currentstID = 0;
                while (queryResults2.Read())
                {
                    currentstID = queryResults2.GetInt32(0);
                }
                currentstID = currentstID + 1;
                queryResults2.Close();
                sqlConnect2.Close();
                //Finds customer ID based on chosen customer name
                string sqlQuery5 = "Select cID from Customer WHERE CONCAT(cFName, ' ', cLName) = @Customer";
                SqlConnection sqlConnect5 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                SqlCommand selectCommand5 = new SqlCommand(sqlQuery5, sqlConnect5);
                selectCommand5.Connection = sqlConnect5;
                selectCommand5.Parameters.AddWithValue("@Customer", stAddCust);
                sqlConnect5.Open();
                SqlDataReader queryResults5 = selectCommand5.ExecuteReader();
                int stCurrentCID = 0;
                while (queryResults5.Read())
                {
                    stCurrentCID = queryResults5.GetInt32(0);
                }
                queryResults5.Close();
                sqlConnect5.Close();
                //sets a boolean to be set as false if the dates chosen are overlapping for a customer.
                Boolean acceptable = true;
                string sqlQuery6 = ("select Service.SID, ServiceTicket.cID, Service.sDate, Service.sCompDate from " +
                    "ServiceTicket inner join Service on Service.sID = ServiceTicket.sID " +
                    "Where Service.sDate BETWEEN @sDate and @cDate or Service.sCompDate BETWEEN @sDate and @cDate or @sDate BETWEEN Service.sDate and Service.sCompDate or  @cDate BETWEEN Service.sDate and Service.sCompDate");
                SqlConnection sqlConnect6 = new SqlConnection
                    (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                SqlCommand selectCommand6 = new SqlCommand(sqlQuery6, sqlConnect6);
                selectCommand6.Connection = sqlConnect1;
                selectCommand6.Parameters.AddWithValue("@sDate", sSDate);
                selectCommand6.Parameters.AddWithValue("@cDate", sCDate);
                sqlConnect1.Open();
                SqlDataReader queryResults6 = selectCommand6.ExecuteReader();
                while (queryResults6.Read())
                {
                    if (stCurrentCID.ToString() == queryResults6["cID"].ToString())
                    {
                        acceptable = false;
                        serviceSaveStatus.Text = "Unable to Save Record. Please Enter a Date That Does Not Interfere";
                    }
                }
                queryResults2.Close();
                sqlConnect2.Close();
                //If the date ranges are ok, and the code has executed to this point, A service is added as well as a service ticket based on the Information in the UI.
                if (acceptable)
                {
                    string sqlQuery3 = "Insert into Service(sID, sType, sDate, sCost, sFromAdd, sDelAdd, sCompDate) " +
                    "VALUES(@sID, @sType, @sDate, @sCost, @fromAddress, @delAddress, @CompDate)";
                    SqlConnection sqlConnect3 = new SqlConnection
                        (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                    SqlCommand insertCommand = new SqlCommand(sqlQuery3, sqlConnect3);
                    insertCommand.Connection = sqlConnect3;
                    insertCommand.Parameters.AddWithValue("@sID", currentSID);
                    insertCommand.Parameters.AddWithValue("@sType", DrpDwnServType.SelectedValue.ToString());
                    insertCommand.Parameters.AddWithValue("@sDate", txtServDate.Text);
                    insertCommand.Parameters.AddWithValue("@sCost", txtServCost.Text);
                    insertCommand.Parameters.AddWithValue("@fromAddress", txtOrigin.Text);
                    insertCommand.Parameters.AddWithValue("@delAddress", txtDelivAdd.Text);
                    insertCommand.Parameters.AddWithValue("@CompDate", txtComDate.Text);
                    sqlConnect3.Open();
                    SqlDataReader queryResults3 = insertCommand.ExecuteReader();
                    queryResults3.Close();
                    sqlConnect3.Close();
                    //Add Service Ticket Once the Service is added
                    string sqlQuery4 = "Insert into ServiceTicket(stID, stODate, cID, sID, ieID) " +
                        "VALUES(@stID, @stOpenDate, @cID, @sID, @eID)";
                    SqlConnection sqlConnect4 = new SqlConnection
                        (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                    SqlCommand insertCommand2 = new SqlCommand(sqlQuery4, sqlConnect4);
                    insertCommand2.Connection = sqlConnect4;
                    insertCommand2.Parameters.AddWithValue("@stID", currentstID);
                    insertCommand2.Parameters.AddWithValue("@stOpenDate", txtOpenDate.Text);
                    insertCommand2.Parameters.AddWithValue("@cID", stCurrentCID);
                    insertCommand2.Parameters.AddWithValue("@sID", currentSID);
                    insertCommand2.Parameters.AddWithValue("@eID", stCurrentEID);
                    sqlConnect4.Open();
                    SqlDataReader queryResults4 = insertCommand2.ExecuteReader();
                    queryResults4.Close();
                    sqlConnect4.Close();
                    //Now we add a tickethistory record by finding the next available thID.
                    string sqlQuery8 = "Select max(thID) as maxthID from TicketHistory";
                    SqlConnection sqlConnect8 = new SqlConnection
                        (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                    SqlCommand sqlCommand8 = new SqlCommand();
                    sqlCommand8.Connection = sqlConnect8;
                    sqlCommand8.CommandType = CommandType.Text;
                    sqlCommand8.CommandText = sqlQuery8;
                    sqlConnect8.Open();
                    SqlDataReader queryResults8 = sqlCommand8.ExecuteReader();
                    int currentthID = 0;
                    while (queryResults8.Read())
                    {
                        currentthID = queryResults8.GetInt32(0);
                    }
                    currentthID = currentthID + 1;
                    queryResults8.Close();
                    sqlConnect8.Close();
                    //This is where the rows are inserted in tickethistory. Status will be initialized
                    string sqlQuery9 = "Insert into TicketHistory(thID, thDate, thNoteTitle, thNote, stID, eID, stStatus) " +
                        "VALUES(@thID, @thOpenDate, @thNoteTitle, @thNote, @stID, @eID ,'Preparation')";
                    SqlConnection sqlConnect9 = new SqlConnection
                        (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                    SqlCommand insertCommand3 = new SqlCommand(sqlQuery9, sqlConnect9);
                    insertCommand3.Connection = sqlConnect9;
                    insertCommand3.Parameters.AddWithValue("@thID", currentthID);
                    insertCommand3.Parameters.AddWithValue("@thOpenDate", txtOpenDate.Text);
                    insertCommand3.Parameters.AddWithValue("@thNoteTitle", "Open " + DrpDwnServType.SelectedValue.ToString());
                    insertCommand3.Parameters.AddWithValue("@thNote", "Customer " + LBCustServ.SelectedValue.ToString() + " wishes to " + DrpDwnServType.SelectedValue.ToString() + " with us.");
                    insertCommand3.Parameters.AddWithValue("@stID", currentstID);
                    insertCommand3.Parameters.AddWithValue("@eID", stCurrentEID);
                    sqlConnect9.Open();
                    SqlDataReader queryResults9 = insertCommand3.ExecuteReader();
                    sqlConnect9.Close();
                    //Only executes if form rendered from a service request, so that the status of the request can be changed.
                    if (Session["activeSR"] != null)
                    {
                        string sqlQuery11 = "UPDATE ServiceRequest SET status = 'Accepted' WHERE srID = " + Session["activeSR"];
                        SqlConnection sqlConnect11 = new SqlConnection
                            (WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
                        SqlCommand sqlCommand11 = new SqlCommand();
                        sqlCommand11.Connection = sqlConnect11;
                        sqlCommand11.CommandType = CommandType.Text;
                        sqlCommand11.CommandText = sqlQuery11;
                        sqlConnect11.Open();
                        SqlDataReader queryResults11 = sqlCommand11.ExecuteReader();
                        queryResults11.Close();
                        sqlConnect11.Close();
                        Session["activeSR"] = null;
                    }

                    //If no errors and the service was saved, a message is printed indicating thhat the service was added to the database.
                    serviceSaveStatus.Text = "Successfully Saved Record!";

                }
            }
            //Catches sqlExceptions thrown in try block and displays a message to user
            catch (SqlException)
            {
                serviceSaveStatus.Text = "Save Could Not be Executed. Please Ensure the Data is correct.";
            }
        }
        //Clears out UI fields.
        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtComDate.Text = null;
            txtDelivAdd.Text = null;
            txtOpenDate.Text = null;
            txtServCost.Text = null;
            txtServDate.Text = null;
        }
        //Changes visibility modifiers based on selection in type menu.
        protected void DrpDwnServType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string chosenType = DrpDwnServType.SelectedValue.ToString();
            if (chosenType.Equals("Move"))
            {
                lblOriginAddress.Visible = true;
                txtOrigin.Visible = true;
                origValidator.Visible = true;
            }
            else
            {
                lblOriginAddress.Visible = false;
                txtOrigin.Visible = false;
                origValidator.Visible = false;
            }
        }
    }
}
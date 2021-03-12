<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="EmpHomepage.aspx.cs" Inherits="DukeConsultantSprint1.EmpHomepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="Content/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
        <%-- Henry LeVasseur and Patrick Sullivan --%>
        <body>
            <div>
                <br />
                <fieldset>
                    <asp:Label ID="loginHeader" runat="server" Text="Welcome to the System! Please Select an Action from the Dropdown Menu." Font-Bold Font-Size ="15" Font-Name="Open Sans"></asp:Label>
                    <br />
                    <asp:DropDownList ID="homepageDropdown" runat="server">
                        <asp:ListItem Selected ="True" Value ="Add Customer"></asp:ListItem>
                        <asp:ListItem Value ="Add Service"></asp:ListItem>
                        <asp:ListItem Value ="Add Item"></asp:ListItem>
                        <asp:ListItem Value ="Add Vehicle to Service"></asp:ListItem>
                        <asp:ListItem Value ="Edit Service Ticket"></asp:ListItem>
                        <asp:ListItem Value ="View Service History"></asp:ListItem>
                        <asp:ListItem Value ="Assign Auction Items"></asp:ListItem>
                        <asp:ListItem Value ="Search for Customer"></asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Button ID="btnProceed" runat="server" Text="Proceed" OnClick="btnProceed_Click1" class="btn btn-primary" type="submit"/>
                </fieldset>
                <br />
                <%-- Create Label, Dropdown List with titles of other pages, and Button to take user there. --%>
                <fieldset>
                    <asp:Label ID="lblServiceRequests" runat="server" Text="Active Service Requests" Font-Bold Font-Size ="20"></asp:Label>
                    <br />
                    <asp:ListBox ID="lbRequests" runat="server" DataSourceID="srData" DataTextField="SReq"></asp:ListBox>
                    <br />
                    <asp:Button ID="btnViewRequest" runat="server" Text="View Request" OnClick="btnViewRequest_Click" class="btn btn-primary" type="submit"/>
                    <%-- Data source fills ListBox with Necessary Information --%>
                    <asp:SqlDataSource
                        ID="srData"
                        runat="server"
                        ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
                        SelectCommand="SELECT Concat(ServiceRequest.srID, '--', Customer.cFName, ' ', Customer.cLName, ' ', ServiceRequest.srType) AS SReq FROM ServiceRequest inner join Customer on ServiceRequest.cID = Customer.cID WHERE ServiceRequest.status = 'Active'">
                    </asp:SqlDataSource>
                </fieldset>
                <br />      
            </div>
        <script src="Scripts/jquery-3.5.1.slim.js"></script>
        <script src="Scripts/popper.min.js"></script>
        </body>
    </html>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="CustomerHomepage.aspx.cs" Inherits="DukeConsultantSprint1.CustomerHomepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
        <%-- Henry LeVasseur and Patrick Sullivan --%>
        <body>
            <div>
                <br />
                <%-- Create Label, Button to Fill out a service request --%>
                <asp:Label ID="loginHeader" runat="server" Text="Welcome to the System! Please Select an Action from the Dropdown Menu." Font-Bold Font-Size ="15" Font-Name="Open Sans"></asp:Label>
                <br /> 
                <asp:Button ID="btnSR" runat="server" Text="Apply Service Request" OnClick="btnSR_Click" class="btn btn-primary" type="submit" />
            </div>
    <script src="Scripts/jquery-3.5.1.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
        </body>
    </html>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="CustomerHomepage.aspx.cs" Inherits="DukeConsultantSprint1.CustomerHomepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
        <%-- Henry LeVasseur and Patrick Sullivan --%>
        <body>
            <div>
                <br />
                <%-- Create Label, Button to Fill out a service request --%>
                <asp:Label ID="loginHeader" runat="server" Text="Welcome to the System! Please Select an Action from the Dropdown Menu." Font-Bold Font-Size ="20"></asp:Label>
                <br /> 
                <asp:Button ID="btnSR" runat="server" Text="Apply Service Request" OnClick="btnSR_Click" />
            </div>
        </body>
    </html>
</asp:Content>

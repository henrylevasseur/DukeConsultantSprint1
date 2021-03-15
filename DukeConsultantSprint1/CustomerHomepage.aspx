<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="CustomerHomepage.aspx.cs" Inherits="DukeConsultantSprint1.CustomerHomepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html>
        <%-- Henry LeVasseur and Patrick Sullivan --%>
        <body>
            <div>
                <br />
                <%-- Create Label, Button to Fill out a service request --%>
                <asp:Label ID="loginHeader" runat="server" Text="Welcome to the System! Please Select an Action from the Dropdown Menu." Font-Bold Font-Size ="15"></asp:Label>
                <br />
                <asp:DropDownList ID="ddlCustItems" runat="server">
                    <asp:ListItem Selected ="True" Value ="Create Service Request"></asp:ListItem>
                    <asp:ListItem Value ="Add Items to Service"></asp:ListItem>
                    <asp:ListItem Value ="Moving Information"></asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:Button ID="btnProceed" runat="server" Text="Proceed" OnClick="btnProceed_Click" class="btn btn-primary" type="submit"/>
                <br />
            </div>
            <script src="Scripts/jquery-3.5.1.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
        </body>
    </html>
</asp:Content>

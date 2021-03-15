﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DukeConsultantSprint1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" >
        <div>
             <%-- Create a simple login form with a username box, and password box with text in password mode --%>
            <asp:Button ID="btnReturn" runat="server" Text="Return" OnClick="btnReturn_Click" class="btn btn-primary" type="submit"/>
            <br />
            <asp:Image ID="Image1" runat="server" ImageUrl ="/image/GVA_MLogo__BW.jpg" ControlStyle-Width="300px" ShowHeader="False" />
            <br />
            <asp:Label ID="itemHeader" runat="server" Text="Please Enter Login Information Below" Font-Bold Font-Size ="20"></asp:Label>
            <br />
            <asp:Table ID="tableLogin" runat="server" class="table-warning">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID ="lblUsername" runat="server" Text="Username: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtUsername" runat="server" type="Username " class="form-control" placeholder="Username "></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblPassword" runat="server" Text="Password: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" type="Password " class="form-control" placeholder="Password "></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnCreateAccount" runat="server" Text="Create Account" OnClick="btnCreateAccount_Click" class="btn btn-primary" type="submit"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick ="btnLogin_Click" class="btn btn-primary" type="submit"/>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblStatus" runat="server" Text="" BackColor="#FFE384"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
    <script src="Scripts/jquery-3.5.1.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
</body>
</html>

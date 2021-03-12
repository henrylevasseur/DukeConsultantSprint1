<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DukeConsultantSprint1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <%-- Create a simple login form with a username box, and password box with text in password mode --%>
            <asp:Button ID="btnReturn" runat="server" Text="Return" OnClick="btnReturn_Click" />
            <br />
            <asp:Label ID="itemHeader" runat="server" Text="Please Enter Login Information Below" Font-Bold Font-Size ="15" Font-Name="Open Sans"></asp:Label>
            <br />
            <asp:Table ID="tableLogin" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID ="lblUsername" runat="server" Text="Username: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblPassword" runat="server" Text="Password: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnCreateAccount" runat="server" Text="Create Account" OnClick="btnCreateAccount_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick ="btnLogin_Click" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>

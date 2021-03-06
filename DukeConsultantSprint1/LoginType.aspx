<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginType.aspx.cs" Inherits="DukeConsultantSprint1.LoginType" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblTitle" runat="server" Text="Please Select How You Would Like to Login" Font-Bold Font-Size="20"></asp:Label>
            <asp:Table ID="Table1" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="BtnEmployee" runat="server" Text="Employee" OnClick="BtnEmployee_Click" />
                    </asp:TableCell>
                 </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="BtnCustomer" runat="server" Text="Customer" OnClick="BtnCustomer_Click" />
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

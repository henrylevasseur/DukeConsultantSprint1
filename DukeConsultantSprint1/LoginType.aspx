<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginType.aspx.cs" Inherits="DukeConsultantSprint1.LoginType" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Image ID="Image1" runat="server" ImageUrl ="/image/GVA_MLogo__BW.jpg" ControlStyle-Width="300px" ShowHeader="False" />
            <br />
            <asp:Label ID="lblTitle" runat="server" Text="Please Select How You Would Like to Login" Font-Bold Font-Size="20"></asp:Label>
            <asp:Table ID="Table1" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="BtnEmployee" runat="server" Text="Employee" OnClick="BtnEmployee_Click" class="btn btn-primary" type="submit"/>
                    </asp:TableCell>
                 </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="BtnCustomer" runat="server" Text="Customer" OnClick="BtnCustomer_Click" class="btn btn-primary" type="submit"/>
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

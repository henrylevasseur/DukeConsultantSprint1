<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="EmpSearchCustomer.aspx.cs" Inherits="DukeConsultantSprint1.EmpSearchCustomer" %>
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
                    <asp:Label ID="searchHeader" runat="server" Text="Search Customer by First or Last Name" Font-Bold Font-Size ="20"></asp:Label>
                    <br />
                    <asp:Table ID ="searchTable" runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblSearch" runat="server" Text="Customer First or Last Name: " Font-Bold></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="searchStatus" runat="server" Text=""></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <asp:Button ID="btnSearch" runat="server" Text="Search Users" OnClick="btnSearch_Click"  class="btn btn-primary" type="submit" />
                </fieldset>
                <%-- Create Gridviews --%>
                <fieldset>
                    <legend>Customer Information: </legend>
                    <asp:GridView 
                        ID="grdShowCustomers"
                        runat="server" 
                        AutoGenerateSelectButton="true"
                        SelectedIndex="1" 
                        OnSelectedIndexChanged="grdShowCustomers_SelectedIndexChanged">
                    </asp:GridView>
                    <asp:Label ID="lblNote" runat="server" BackColor="#FFE384"></asp:Label>
                </fieldset>
                <fieldset>
                    <legend>Customer Services: </legend>
                    <asp:GridView 
                        ID="grdShowServiceTickets" 
                        runat="server" 
                        AutoGenerateSelectButton="true" 
                        SelectedIndex ="1" 
                        OnSelectedIndexChanged="grdShowServiceTickets_SelectedIndexChanged"></asp:GridView>
                </fieldset>
                <fieldset>
                    <legend>Ticket History: </legend>
                    <asp:GridView 
                        ID="grdShowTH" 
                        runat="server" ></asp:GridView>
                </fieldset>
            </div>
        <script src="Scripts/jquery-3.5.1.slim.js"></script>
        <script src="Scripts/popper.min.js"></script>
        </body>
    </html>
</asp:Content>

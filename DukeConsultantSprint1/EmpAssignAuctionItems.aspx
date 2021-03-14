<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="EmpAssignAuctionItems.aspx.cs" Inherits="DukeConsultantSprint1.EmpAssignAuctionItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
        <%-- Henry LeVasseur and Patrick Sullivan --%>
        <body>
            <div>
                <br />
                <fieldset>
                    <asp:Table ID="Table1" runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblCName" runat="server" Text="Enter Customer Name: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtCName" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblSearch" runat="server" Text=""></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button ID="btnSearch" runat="server" Text="Search Customers" OnClick="btnSearch_Click" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblCSelect" runat="server" Text="Select Customer From Dropdown: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="ddlCustomers" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlCustomers_SelectedIndexChanged"></asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblAuctionBTN" runat="server" Text=""></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button ID="btnViewAuctions" runat="server" Text="View Auctions" OnClick="btnViewAuctions_Click" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblService" runat="server" Text="Auction:"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="ddlService" runat="server"></asp:DropDownList>
                            </asp:TableCell>                       
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button ID="btnViewItems" runat="server" Text="View Items" OnClick="btnViewItems_Click" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblSelectItem" runat="server" Text="Select Item:"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:ListBox ID="lbItems" runat="server"></asp:ListBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblAuction" runat="server" Text="Auction:"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="ddlAuction" runat="server" DataSourceID="auctionData" DataTextField="AuctionInfo"></asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <asp:Button ID="btnAssign" runat="server" Text="Assign Items" OnClick="btnAssign_Click" />
                    <br />
                    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                <%-- Sql Data sources fill menus with data to choose from --%>
                <%--<asp:SqlDataSource
                    ID="serviceData"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
                    SelectCommand="select CONCAT(ServiceTicket.stID, '-- ', Customer.cFName, ' ', Customer.cLName, ' ', Service.sType, ' ', Service.sDate) AS Service from Customer right join ServiceTicket on ServiceTicket.CID = Customer.CID right join Service on Service.sID = ServiceTicket.sID WHERE sType = 'Auction'">--%>
                <%--</asp:SqlDataSource>--%>
                    <asp:SqlDataSource
                    ID="auctionData"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
                    SelectCommand="select concat(Auction.auctionID, '--', Auction.AuctionDate, ' ', Auction.AuctionDesc) AS AuctionInfo FROM Auction" >
                </asp:SqlDataSource>
                </fieldset>            
                <br />      
            </div>
        </body>
    </html>
</asp:Content>

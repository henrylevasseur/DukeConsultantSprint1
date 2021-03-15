<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="EmpAssignAuctionItems.aspx.cs" Inherits="DukeConsultantSprint1.EmpAssignAuctionItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html>
        <%-- Henry LeVasseur and Patrick Sullivan --%>
        <body>
            <div>
                <br />
                <fieldset>
                    <asp:Table ID="Table1" runat="server" class="table-warning">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblCName" runat="server" Text="Enter Customer Name: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtCName" runat="server" type=" Customer Name " class="form-control" placeholder=" Customer Name"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblSearch" runat="server" Text=""></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button ID="btnSearch" runat="server" Text="Search Customers" OnClick="btnSearch_Click" class="btn btn-primary" type="submit"/>
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
                                <asp:Button ID="btnViewAuctions" runat="server" Text="View Auctions" OnClick="btnViewAuctions_Click" class="btn btn-primary" type="submit" />
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
                                <asp:Button ID="btnViewItems" runat="server" Text="View Items" OnClick="btnViewItems_Click" class="btn btn-primary" type="submit" />
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
                    <asp:Button ID="btnAssign" runat="server" Text="Assign Items" OnClick="btnAssign_Click" class="btn btn-primary" type="submit" />
                    <br />
                    <asp:Label ID="lblStatus" runat="server" Text="" BackColor="#FFE384"></asp:Label>
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
             <script src="Scripts/jquery-3.5.1.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
        </body>
    </html>
</asp:Content>

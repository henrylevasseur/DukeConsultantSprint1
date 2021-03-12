<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="EmpAssignAuctionItems.aspx.cs" Inherits="DukeConsultantSprint1.EmpAssignAuctionItems" %>
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
                    <asp:Table ID="Table1" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblService" runat="server" Text="Service:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlService" runat="server" DataSourceID ="serviceData" DataTextField="Service"></asp:DropDownList>
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
                <asp:SqlDataSource
                    ID="serviceData"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
                    SelectCommand="select CONCAT(ServiceTicket.stID, '-- ', Customer.cFName, ' ', Customer.cLName, ' ', Service.sType, ' ', Service.sDate) AS Service from Customer right join ServiceTicket on ServiceTicket.CID = Customer.CID right join Service on Service.sID = ServiceTicket.sID WHERE sType = 'Auction'">
                </asp:SqlDataSource>
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

<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="EmpAddVehicle.aspx.cs" Inherits="DukeConsultantSprint1.EmpAddVehicle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
        <%-- Henry LeVasseur and Patrick Sullivan --%>
        <body>
            <div>
            <br />
            <fieldset>
                <%-- Creates Header and Table to display UI --%>
                <asp:Label ID="lblTitle" runat="server" Text="Add Vehicles to Services" Font-Bold Font-Size="20"></asp:Label>
                <asp:Table ID="Table1" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                             <asp:Label ID="lblService" runat="server" Text="Choose Service: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                             <asp:ListBox ID="LBService" DataSourceID="serviceData" DataTextField="Service" runat="server"></asp:ListBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblVehicle" runat="server" Text="Choose Equipment: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                             <asp:DropDownList ID="VehicleDropdown" DataSourceID="VehicleData" DataTextField="vName" runat="server"></asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>   
                <asp:Button ID="SaveBtn" runat="server" ValidationGroup="vSaveValidation" Text="Save" OnClick ="SaveBtn_Click"/>
                <br />
                <asp:Label ID="vStatus" runat="server" Text="" ForeColor="Red"></asp:Label>
                <%-- Data Sources populate boxes with concatenated Identifying service information and vehicle names --%>
                <asp:SqlDataSource
                    ID="serviceData"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Lab3 %>"
                    SelectCommand="select CONCAT(ServiceTicket.stID, '-- ', Customer.cFName, ' ', Customer.cLName, ' ', Service.sType, ' ', Service.sDate) AS Service from Customer right join ServiceTicket on ServiceTicket.CID = Customer.CID right join Service on Service.sID = ServiceTicket.sID">
                </asp:SqlDataSource>
                <asp:SqlDataSource
                    ID="vehicleData"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Lab3 %>"
                    SelectCommand="select vName from Vehicle" >
                </asp:SqlDataSource>
            </fieldset>
        </div>
    </body>
</html>
</asp:Content>

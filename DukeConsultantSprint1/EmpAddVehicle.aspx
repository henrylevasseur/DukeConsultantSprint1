<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="EmpAddVehicle.aspx.cs" Inherits="DukeConsultantSprint1.EmpAddVehicle" %>
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
                <%-- Creates Header and Table to display UI --%>
                <asp:Label ID="lblTitle" runat="server" Text="Add Vehicles to Services" Font-Bold Font-Size ="15" Font-Name="Open Sans"></asp:Label>
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
                <asp:Button ID="SaveBtn" runat="server" ValidationGroup="vSaveValidation" Text="Save" OnClick ="SaveBtn_Click" class="btn btn-primary" type="submit"/>
                <br />
                <asp:Label ID="vStatus" runat="server" Text="" ForeColor="Red" BackColor="#FFE384"></asp:Label>
                <%-- Data Sources populate boxes with concatenated Identifying service information and vehicle names --%>
                <asp:SqlDataSource
                    ID="serviceData"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
                    SelectCommand="select CONCAT(ServiceTicket.stID, '-- ', Customer.cFName, ' ', Customer.cLName, ' ', Service.sType, ' ', Service.sDate) AS Service from Customer right join ServiceTicket on ServiceTicket.CID = Customer.CID right join Service on Service.sID = ServiceTicket.sID">
                </asp:SqlDataSource>
                <asp:SqlDataSource
                    ID="vehicleData"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
                    SelectCommand="select vName from Vehicle" >
                </asp:SqlDataSource>
            </fieldset>
        </div>
             <script src="Scripts/jquery-3.5.1.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
    </body>
</html>
</asp:Content>

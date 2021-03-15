<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="EmpAddItem.aspx.cs" Inherits="DukeConsultantSprint1.EmpAddItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
        <%-- Henry LeVasseur and Patrick Sullivan --%>
        <body>
        <div>
            <br />
            <fieldset>
                <%--Create Header, followed by Table With Each Necessary Field--%>
             <asp:Label ID="itemHeader" runat="server" Text="Please Add Items to a Service Below" Font-Bold Font-Size ="20"></asp:Label>
            <br />
            <asp:Table ID="tableItem" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblService" runat="server" Text="Choose Service: " Font-Bold></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="serviceList" DataSourceID="serviceData" DataTextField="Service" runat="server"></asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblItemName" runat="server" Text="Item Name: " Font-Bold></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtItemName" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="rfINameValidation" ControlToValidate="txtItemName" runat="server" ValidationGroup="iSaveValidation" ErrorMessage="Please Enter an Item Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblEstValue" runat="server" Text="Est. Value: " Font-Bold></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtEstValue" runat="server" TextMode="Number"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="rfIValueValidation" ControlToValidate="txtItemName" runat="server" ValidationGroup="iSaveValidation" ErrorMessage="Please Enter an Item Value" ForeColor ="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>                
            </asp:Table>
            <asp:Button ID="PopulateBtn" runat="server" Text="Populate" />
            &nbsp;
            <asp:Button ID="SaveBtn" runat="server" ValidationGroup="iSaveValidation" Text="Save" OnClick="SaveBtn_Click"/>
            &nbsp;
            <asp:Button ID="ClearBtn" runat="server" Text="Clear" OnClick="ClearBtn_Click"/>
                <%--Establishes a data source that can be used in the above code to populate existing data in UI controls--%>
            <asp:SqlDataSource
                ID="serviceData"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
                SelectCommand="select CONCAT(ServiceTicket.stID, '-- ', Customer.cFName, ' ', Customer.cLName, ' ', Service.sType, ' ', Service.sDate) AS Service from Customer right join ServiceTicket on ServiceTicket.CID = Customer.CID right join Service on Service.sID = ServiceTicket.sID">
            </asp:SqlDataSource>
            <asp:Label ID="lblSaveStatus" runat="server" Text=""></asp:Label>
        </fieldset>
        </div>
    </body>
</html>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="EmpViewTicket.aspx.cs" Inherits="DukeConsultantSprint1.EmpViewTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Henry LeVasseur and Patrick Sullivan--%>
    <html>
        <body>
        <div>
            <%-- Add Fieldsets and Items for the UI, with some being hidden, to show the necessary Information. --%>
            <fieldset>
                <asp:Label ID="viewServiceHeader" runat="server" Text="Please Select a Service from the Dropdown Menu." Font-Bold Font-Size ="20"></asp:Label>
                <br />
                <asp:DropDownList ID="viewDropDown" AutoPostBack="true" DataSourceID="servList" DataTextField="Service" runat="server"></asp:DropDownList>
                <br />
                <asp:Button ID="viewItemsBtn" runat="server" Text="View History" OnClick="viewItemsBtn_Click"/>  
            </fieldset>
            <br />
            <fieldset>
                <legend>History for Selected Service: </legend>
                <asp:GridView runat="server" ID="grdShowItems" AlternatingRowStyle-BackColor="#eaaaff" EmptyDataText="NoCustomerSelected!"></asp:GridView>
                <asp:Label ID="lblNote" runat="server"></asp:Label>
            </fieldset>
            <fieldset>
                <asp:Table ID="Table1" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:ListBox ID="lbNoteTitles" runat="server" AutoPostBack="true" Visible="false" OnSelectedIndexChanged="lbNoteTitles_SelectedIndexChanged"></asp:ListBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:TextBox ID="txtNoteBody" Rows ="10" Columns ="50" runat="server" Visible ="false" TextMode="MultiLine"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>    
            </fieldset>
            <br />
        </div>
            <%-- Data Source gets our concatenated list of services --%>
            <asp:SqlDataSource
                    ID="servList"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Lab3 %>"
                    SelectCommand="select CONCAT(ServiceTicket.stID, '-- ', Customer.cFName, ' ', Customer.cLName, ' ', Service.sType, ' ', Service.sDate) AS Service from Customer right join ServiceTicket on ServiceTicket.CID = Customer.CID right join Service on Service.sID = ServiceTicket.sID">      
            </asp:SqlDataSource>
     
        </body>
</html>
</asp:Content>

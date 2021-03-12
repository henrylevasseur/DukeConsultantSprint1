<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="EmpEditTicket.aspx.cs" Inherits="DukeConsultantSprint1.EmpEditTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
         <%-- Henry LeVasseur and Patrick Sullivan --%>
    <body>
        <div>
            <fieldset>
                <%-- Creates Header and Table for UI to display necessary information and include necessary validators --%>
                <asp:Label ID="lblTitle" runat="server" Text="Add Employee to service ticket history" Font-Bold Font-Size="20"></asp:Label>
                <asp:Table ID="Table1" runat="server">
                    <asp:TableRow>
                        <asp:TableCell> 
                            <asp:Label ID="lblService" runat="server" Text="Choose Service: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:ListBox ID="ListBoxSerivce" DataSourceID="serviceData" DataTextField= "Service" runat="server">
                            </asp:ListBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="rfService" ControlToValidate="ListBoxSerivce" ValidationGroup="iSaveValidation" runat="server" ErrorMessage="Please Select a Service" ForeColor ="Red"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                             <asp:Label ID="lblEmployee" runat="server" Text="Choose Employee: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="DDLEmployee" DataSourceID ="emplist" DataTextField="eName" runat="server">
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblthDate" runat="server" Text="Date: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtthDate" runat="server" TextMode ="Date"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="rfDateValidator" ControlToValidate="txtthDate" ValidationGroup="iSaveValidation" runat="server" ErrorMessage="Please Enter a Date" ForeColor="Red"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblNoteTitle" runat="server" Text="Note Title:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtNoteTitle" runat="server"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="rfTitleValidator" ControlToValidate="txtNoteTitle" ValidationGroup ="iSaveValidation" runat="server" ErrorMessage="Please Enter a Title" ForeColor="Red"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblthStatus" runat="server" Text="Service Status: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="DDLthStatus" runat="server">
                                <asp:ListItem Value="Processed"></asp:ListItem>
                                <asp:ListItem Value="Ready for start date"></asp:ListItem>
                                <asp:ListItem Value="Service complete"></asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblNote" runat="server" Text="Note: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                             <asp:TextBox ID="txtNote" runat="server" Rows ="10" Columns="50" TextMode="MultiLine"></asp:TextBox>
                        </asp:TableCell>
                         <asp:TableCell>
                             <asp:RequiredFieldValidator ID="rfBodyValidator" runat="server" ControlToValidate="txtNote" ValidationGroup="iSaveValidation" ErrorMessage="Please Enter a Note" ForeColor ="Red"></asp:RequiredFieldValidator>
                         </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblStatus" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblAddOn" runat="server" Text=" Add Additional Services" Font-Bold Font-Size="14"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" Text="Cleaning:"  ></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="chkCleaning" runat="server" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" Text="Storage:"  ></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="chkStorage" runat="server" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" Text="Trash Removal:"  ></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="chkTrashRemoval" runat="server" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblTHSaveStatus" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>             
                <asp:Button ID="SaveBtn" runat="server" ValidationGroup="iSaveValidation" Text="Save" OnClick="SaveBtn_Click"/>
                &nbsp;
                <asp:Button ID="ClearBtn" runat="server" Text="Clear" OnClick="ClearBtn_Click" />
                <%-- Data sources provide an employee list and a list of services from which to draw service tickets --%>
                 <asp:SqlDataSource
                    ID="empList"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
                    SelectCommand="Select eName from Employee">
                </asp:SqlDataSource>
                <asp:SqlDataSource
                    ID="serviceData"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
                    SelectCommand="select CONCAT(ServiceTicket.stID, '-- ', Customer.cFName, ' ', Customer.cLName, ' ', Service.sType, ' ', Service.sDate) AS Service from Customer right join ServiceTicket on ServiceTicket.CID = Customer.CID right join Service on Service.sID = ServiceTicket.sID">
                </asp:SqlDataSource>

            </fieldset>
        </div> 
    </body>
</html>
</asp:Content>

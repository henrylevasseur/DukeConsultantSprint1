<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="EmpAddService.aspx.cs" Inherits="DukeConsultantSprint1.EmpAddService" %>
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
                <%-- Create Header followed by table with all necessary fields, validators, and data sources. --%>
                <asp:Label ID="ServiceHeader" runat="server" Text="Please Enter Service Information Below" Font-Bold Font-Size ="15" Font-Name="Open Sans"></asp:Label>
                <br />
                <asp:Table ID="tableService" runat="server" class="table-warning">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblServType" runat="server" Text="Service Type:  "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="DrpDwnServType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DrpDwnServType_SelectedIndexChanged">
                                <asp:ListItem Value ="Move"></asp:ListItem>
                                 <asp:ListItem Value ="Auction"></asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="LblCustServ" runat="server" Text="Customer:  "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:ListBox ID="LBCustServ" runat="server" DataSourceID="custList" DataTextField="cName"></asp:ListBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="custValidator" ControlToValidate="LBCustServ" ValidationGroup ="sSaveValidation" runat="server" ErrorMessage="Please Select A Customer" ForeColor ="Red"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" Text="Date Ticket Opened: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtOpenDate" runat="server" TextMode="Date" type="Date " class="form-control" placeholder="Date"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="oDateValidator" runat="server" ControlToValidate="txtOpenDate" ValidationGroup="sSaveValidation" ErrorMessage="Please Enter an Opening Date" ForeColor ="Red"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblServDate" runat="server" Text="Service Date:  " ></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtServDate" runat="server" TextMode="Date" type="Date " class="form-control" placeholder="Date"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="srfServiceDateValidator" ControlToValidate="txtServDate" ValidationGroup="sSaveValidation" runat="server" ErrorMessage="Please Choose a Service Date" ForeColor="Red"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblServCost" runat="server" Text="Service Cost: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtServCost" runat="server" type="Service Cost " class="form-control" placeholder="Service Cost"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="srfValueValidator" ControlToValidate="txtServCost" ValidationGroup="sSaveValidation" runat="server" ErrorMessage="Please Enter a Service Cost" ForeColor="Red"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblOriginAddress" runat="server" Text="Origin Address: " Visible="true"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtOrigin" runat="server" Visible ="true" type="Origin Address " class="form-control" placeholder="Origin Address"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="origValidator" ControlToValidate="txtOrigin" ValidationGroup="sSaveValidation" runat="server" ErrorMessage="Enter Origin Address" ForeColor="Red" Visible="true"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblDelivAdd" runat="server" Text="Delivery Address:"></asp:Label>
                        </asp:TableCell>
                         <asp:TableCell>
                             <asp:TextBox ID="txtDelivAdd" runat="server" type="Delivery Address " class="form-control" placeholder="Delivery Address"></asp:TextBox>
                         </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="destValidator" ControlToValidate="txtDelivAdd" ValidationGroup="sSaveValidation" runat="server" ErrorMessage="Enter Destination Address" ForeColor="Red"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblComDate" runat="server" Text="Completion Date:  "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtComDate" runat="server" TextMode ="Date" type="Completion Date " class="form-control" placeholder="Completion Date"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="rfCompletionValidation" ControlToValidate ="txtComDate" ValidationGroup="sSaveValidation" runat="server" ErrorMessage="Please Choose a Completion Date" ForeColor="Red"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblIE" runat="server" Text="Initiating Employee: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlEmployees" DataSourceID="empList" DataTextField="eName" runat="server"></asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblAddOn" runat="server" Text="Add-On Services" Font-Bold Font-Size="14"></asp:Label>
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
                </asp:Table>
                <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click" class="btn btn-primary" type="submit"/>
                &nbsp;
                <asp:Button ID="btnSave" runat="server" ValidationGroup="sSaveValidation" Text="Save" OnClick="btnSave_Click" class="btn btn-primary" type="submit"/>
                &nbsp;
                <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" type="button" class="btn btn-outline-primary"/>
                <br />
                <br />
                <asp:Label ID="serviceSaveStatus" runat="server" Text=""  BackColor="#FFE384"></asp:Label>
                <%-- Data sources populate customer and employee boxes --%>
                <asp:SqlDataSource
                    ID="custList"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
                    SelectCommand="Select Concat(Customer.cFName, ' ', Customer.cLName) AS cName From Customer">
                </asp:SqlDataSource>
                <asp:SqlDataSource
                    ID="empList"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
                    SelectCommand="Select eName from Employee">
                </asp:SqlDataSource>
            </fieldset>
        </div>
            <script src="Scripts/jquery-3.5.1.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
    </body>
</html>
</asp:Content>

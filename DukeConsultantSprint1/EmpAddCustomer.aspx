<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="EmpAddCustomer.aspx.cs" Inherits="DukeConsultantSprint1.EmpAddCustomer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
        <%-- Henry LeVasseur and Patrick Sullivan --%>
        <body>
            <div>
                <br />
                <%--Create Header, followed by Table With Each Necessary Field--%>
                <asp:Label ID="loginHeader" runat="server" Text="Please Enter Customer Information Below" Font-Bold Font-Size ="15"></asp:Label>
                <br />
                <asp:Table ID="tableCustomer" runat="server" class="table-warning">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblName" runat="server" Text="First Name: " Font-Bold></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtFName" runat="server" type="First Name" class="form-control" placeholder="First Name"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="rfNameValidator" ControlToValidate ="txtFName" ValidationGroup="saveValidation" runat="server" ErrorMessage="Please Enter a Name" ForeColor="Red"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblLName" runat="server" Text="Last Name: " Font-Bold></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtLName" runat="server" type="Last Name" class="form-control" placeholder="Last Name"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="rfLNameValidator" ControlToValidate ="txtLName" ValidationGroup="saveValidation" runat="server" ErrorMessage="Please Enter a Name" ForeColor="Red"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblAddress" runat="server" Text="Address: " Font-Bold></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtAddress" runat="server" type="Address" class="form-control" placeholder="Address"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="rfAddressValidator" ControlToValidate="txtAddress" ValidationGroup="saveValidation" runat="server" ErrorMessage="Please Enter an Address" ForeColor="Red"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblPhone" runat="server" Text="Phone Number: "  Font-Bold></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtPhone" runat="server" type="Phone" class="form-control" placeholder="Phone"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="rfPhoneValidator" ControlToValidate="txtPhone" ValidationGroup="saveValidation" runat="server" ErrorMessage="Please Enter a Phone Number" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rePhoneValidator" ControlToValidate="txtPhone" ValidationGroup="saveValidation" runat="server"  ValidationExpression="\d{10}" ErrorMessage="Please Enter a 10 Digit Phone Number" ForeColor = "Red"></asp:RegularExpressionValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" Text="Phone Type: " Font-Bold></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlPhoneType" runat="server" class="form-control">
                                <asp:ListItem Selected="True" Value="Cell"></asp:ListItem>
                                <asp:ListItem Value="Business"></asp:ListItem>
                                <asp:ListItem Value="Home"></asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" Text="How did You Initially Hear About us?" Font-Bold></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtDesc" runat="server" type="Initial Method" class="form-control" placeholder="Initial Method"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="descValidator" ControlToValidate="txtDesc" ValidationGroup="saveValidation" runat="server" ErrorMessage="Please Enter a Description" ForeColor="Red"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblEmail" runat="server" Text="Email: " Font-Bold></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode ="Email" type="Email" class="form-control" placeholder="Email"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="rfEmailValidator" ControlToValidate="txtEmail" ValidationGroup="saveValidation" runat="server" ErrorMessage="Please Enter an E-mail Address" ForeColor="Red"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblICT" runat="server" Text="Initial Contact Type" Font-Bold></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlContactType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlContactType_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Value="In Person"></asp:ListItem>
                            <asp:ListItem Value="By Phone"></asp:ListItem>
                            <asp:ListItem Value="By Email"></asp:ListItem>
                            <asp:ListItem Value="By Text"></asp:ListItem>
                            <asp:ListItem Value="Other"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblOtherDesc" runat="server" Text="Initial Contact Type:" Font-Bold Visible="false"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtOtherDesc" runat="server" Visible ="false"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="otherValidator" ControlToValidate="txtOtherDesc" ValidationGroup="saveValidation" runat="server" ErrorMessage="Please Enter a Description" ForeColor="Red" Visible="false"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                </asp:Table>
            <%-- Add Buttons with OnClick Events --%>
                <asp:Button ID="populateBtn" runat="server" Text="Populate" OnClick="populateBtn_Click" class="btn btn-primary" type="submit"/>
                &nbsp;
                <asp:Button ID="saveBtn" runat="server" ValidationGroup="saveValidation" Text="Save" OnClick="saveBtn_Click" class="btn btn-primary" type="submit"/>
                &nbsp;
                <asp:Button ID="clearBtn" runat="server" Text="Clear" OnClick="clearBtn_Click" type="button" class="btn btn-outline-primary"/>
                <br />
                <br />
                <%-- Display Status Message, which will be Empty until the save button is clicked. --%>
                <asp:Label ID="saveStatus" runat="server" Text="" BackColor="#FFE384"></asp:Label>
            </div>
        <script src="Scripts/jquery-3.5.1.slim.js"></script>
        <script src="Scripts/popper.min.js"></script>
        </body>
    </html>
</asp:Content>

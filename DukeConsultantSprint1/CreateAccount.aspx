<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="DukeConsultantSprint1.CreateAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <br />
                <%--Create Header, followed by Table With Each Necessary Field--%>
            <asp:Image ID="Image1" runat="server" ImageUrl ="/image/GVA_MLogo__BW.jpg" ControlStyle-Width="300px" ShowHeader="False" />
            <br />
                <asp:Label ID="loginHeader" runat="server" Text="Please Enter Customer Information Below" Font-Bold Font-Size ="15" Font-Name="Open Sans"></asp:Label>
                <br />
                <asp:Table ID="tableCustomer" runat="server" class="table-warning">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblFName" runat="server" Text="First Name: " Font-Bold></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtFName" runat="server" type="First Name" class="form-control" placeholder="First Name"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="rfFNameValidator" ControlToValidate ="txtFName" ValidationGroup="saveValidation" runat="server" ErrorMessage="Please Enter a First Name" ForeColor="Red"></asp:RequiredFieldValidator>
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
                            <asp:RequiredFieldValidator ID="rfLNameValidator" ControlToValidate="txtLName" ValidationGroup="saveValidation" runat="server" ErrorMessage="Please Enter a Last Name" ForeColor="Red"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblEmail" runat="server" Text="Email(Username): "  Font-Bold></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" type="Email" class="form-control" placeholder="Email"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="rfEmailValidator" ControlToValidate="txtEmail" ValidationGroup="saveValidation" runat="server" ErrorMessage="Please Enter an Email Address" ForeColor="Red"></asp:RequiredFieldValidator>                          
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblPW" runat="server" Font-Bold Text="Password: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtPW" runat="server" TextMode="Password" type="Password" class="form-control" placeholder="Password"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="rfPW" runat="server" ControlToValidate="txtPW" ValidationGroup ="saveValidation" ErrorMessage="Choose a Password" ForeColor="Red"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblPW2" runat="server" Font-Bold Text=" Confirm Password: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtPW2" runat="server" TextMode="Password"  type="Confirm Password" class="form-control" placeholder="Confirm Password"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:CompareValidator ID="cPW" runat="server" ValidationGroup="saveValidation" ControlToValidate="txtPW2" ControlToCompare="txtPW" Operator="Equal" ErrorMessage="Passwords Must Match" ForeColor="Red"></asp:CompareValidator>
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
                            <asp:Label ID="lblPhone" runat="server" Text="Phone Number:" Font-Bold></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtPhone" runat="server" type="Phone Number" class="form-control" placeholder="Phone Number"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="PhoneValidator" ControlToValidate="txtPhone" ValidationGroup="saveValidation" runat="server" ErrorMessage="Please Enter a Phone Number" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rePhoneValidator" ControlToValidate="txtPhone" ValidationGroup="saveValidation" runat="server"  ValidationExpression="\d{10}" ErrorMessage="Please Enter a 10 Digit Phone Number" ForeColor = "Red"></asp:RegularExpressionValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" Text="Phone Type: " Font-Bold></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlPhoneType" runat="server">
                                <asp:ListItem Selected="True" Value="Cell"></asp:ListItem>
                                    <asp:ListItem Value="Business"></asp:ListItem>
                                    <asp:ListItem Value="Home"></asp:ListItem>
                                </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblDesc" runat="server" Text="How Did you Initially Hear About us? " Font-Bold></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtDesc" runat="server" type="Initial Method" class="form-control" placeholder="Initial Method" ></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="rfDescValidator" runat="server" ControlToValidate="txtDesc" ValidationGroup="saveValidation" ErrorMessage="Please Enter Text Here" ForeColor ="Red"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            <%-- Add Buttons with OnClick Events --%>
                <asp:Button ID="saveBtn" runat="server" ValidationGroup="saveValidation" Text="Save" OnClick ="saveBtn_Click" class="btn btn-primary" type="submit"/>
                &nbsp;
                <asp:Button ID="clearBtn" runat="server" Text="Clear" OnClick ="clearBtn_Click" type="button" class="btn btn-outline-primary"/>
                &nbsp;
                <asp:Button ID="cancelBtn" runat="server" Text="Return to Home" OnClick="cancelBtn_Click" type="button" class="btn btn-outline-primary"/>
                <br />
                <br />
                <%-- Display Status Message, which will be Empty until the save button is clicked. --%>
                <asp:Label ID="saveStatus" runat="server" Text="" BackColor="#FFE384"></asp:Label>
        
        </div>
    </form>
    <script src="Scripts/jquery-3.5.1.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
</body>
</html>

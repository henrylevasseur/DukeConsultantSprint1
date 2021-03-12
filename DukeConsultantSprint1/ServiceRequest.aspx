<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="ServiceRequest.aspx.cs" Inherits="DukeConsultantSprint1.ServiceRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="Content/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
        <asp:Table ID="tableService" runat="server" class="table-warning">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblServType" runat="server" Text="Service Type:  "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="DrpDwnServType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DrpDwnServType_SelectedIndexChanged" >
                        <asp:ListItem Value ="Move"></asp:ListItem>
                            <asp:ListItem Value ="Auction"></asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblServDate" runat="server" Text="Service Date:  " ></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtServDate" runat="server" TextMode="Date" type="Service Date" class="form-control" placeholder="Service Date"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="srfServiceDateValidator" ControlToValidate="txtServDate" ValidationGroup="saveValidation" runat="server" ErrorMessage="Please Choose a Service Date" ForeColor="Red"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                    <asp:TableCell>
                    <asp:Label ID="lblOriginAddress" runat="server" Text="Origin Address: " Visible="true"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtOrigin" runat="server" Visible="true" type="Origin Address" class="form-control" placeholder="Origin Address"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="rfOrigValidator" runat="server" ControlToValidate="txtOrigin" ValidationGroup="saveValidation" ErrorMessage="Please Enter Origin Address" ForeColor="Red" Visible="true"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDelivAdd" runat="server" Text="Delivery Address:"></asp:Label>
                </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDelivAdd" runat="server" type="Delivery Address" class="form-control" placeholder="Delivery Address"></asp:TextBox>
                    </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="rfAddValidator" runat="server" ControlToValidate ="txtDelivAdd" ValidationGroup="saveValidation" ErrorMessage="Please Enter an Address for Auction, or Both Addresses for Move" ForeColor="Red" Font-Size="10"></asp:RequiredFieldValidator>
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
                            <asp:CheckBox ID="chkCleaning" runat="server" class="form-check-input" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" Text="Storage:"  ></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="chkStorage" runat="server" class="form-check-input" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" Text="Trash Removal:"  ></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="chkTrashRemoval" runat="server" class="form-check-input"/>
                        </asp:TableCell>
                    </asp:TableRow>
            </asp:Table>
        <asp:Button ID="saveBtn" runat="server" ValidationGroup="saveValidation" Text="Save" OnClick="saveBtn_Click" class="btn btn-primary" type="submit"/>
        &nbsp;
        <asp:Button ID="clearBtn" runat="server" Text="Clear" OnClick="clearBtn_Click" type="button" class="btn btn-outline-primary"/>
        &nbsp;
        <asp:Button ID="cancelBtn" runat="server" Text="Return to Home" OnClick="cancelBtn_Click" type="button" class="btn btn-outline-primary"/>
        <br />
    <asp:Label ID="lblSaveStatus" runat="server" Text="" BackColor="#FFE384"></asp:Label>
    <script src="Scripts/jquery-3.5.1.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
</asp:Content>

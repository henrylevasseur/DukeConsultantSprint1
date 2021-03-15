<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="RoomForm.aspx.cs" Inherits="DukeConsultantSprint1.RoomForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblTitle" runat="server" Text="Room Form" Font-Bold="true" Font-Size="X-Large"></asp:Label>
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblRoomType" runat="server" Text="Room Type: " Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtRoomType" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="AddRoom" ControlToValidate="txtRoomType" ForeColor="Red" Text="Please Enter the Room Type" ></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblFloor" runat="server" Text="Floor: " Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="DDLFloor" runat="server" AutoPostBack="true">
                    <asp:ListItem Value="Other" Text="Other"></asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblEntraceType" runat="server" Text="Entrance Type: " Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtEntranceType" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="AddRoom" ControlToValidate="txtEntranceType" ForeColor="Red" Text="Please Enter the Entrance Type" ></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblBlankets" runat="server" Text="Blankets: " Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtBlankets" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="AddRoom" ControlToValidate="txtBlankets" ForeColor="Red" Text="Please Enter the Blankets" ></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:Table ID="Table2" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblBoxesType" runat="server" Text="Box: " Font-Bold="true" Font-Size="Large"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <!-- For Align -->
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblSmallBox" runat="server" Text="Small Box: " Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtSmallBox" runat="server" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="AddRoom" ControlToValidate="txtSmallBox" ForeColor="Red" Text="Please Enter the Amount of Small Box" ></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <!-- For Align -->
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblMediumBox" runat="server" Text="Medium Box: " Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtMediumBox" runat="server" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="AddRoom" ControlToValidate="txtMediumBox" ForeColor="Red" Text="Please Enter the Amount of Medium Box"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <!-- For Align -->
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblLargeBox" runat="server" Text="Large Box: " Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtLargeBox" runat="server" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="AddRoom" ControlToValidate="txtLargeBox" ForeColor="Red" Text="Please Enter the Amount of Large Box"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <!-- For Align -->
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblWardrobe" runat="server" Text="Wardrobe Box: " Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtWardrobe" runat="server" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="AddRoom" ControlToValidate="txtWardrobe" ForeColor="Red" Text="Please Enter the Amount of Wardrobe Box"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <!-- For Align -->
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblArt" runat="server" Text="Art Box: " Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtArt" runat="server" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="AddRoom" ControlToValidate="txtArt" ForeColor="Red" Text="Please Enter the Amount of Art Box"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <!-- For Align -->
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lbOther" runat="server" Text="Other Box: " Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtOther" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:Table ID="Table3" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAdditionalNote" runat="server" Text="Additional Note: " Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtAdditionalNote" runat="server" Rows="5" Columns="30" TextMode="MultiLine"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:Table ID="Table4" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPhotoUpload" runat="server" Text="Room Photos: " Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:FileUpload ID="PhotoFileUpload" runat="server" AllowMultiple="true" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="PhotoFileUpload" Text="Please Upload Photos for The Room" ForeColor="Red" ValidationGroup="AddRoom"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    

    <asp:Table ID="Table5" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="BtnAddRoom" runat="server" Text="Add Room" OnClick="BtnAddRoom_Click" ValidationGroup="AddRoom" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>

  
</asp:Content>

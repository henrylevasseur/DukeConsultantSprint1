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
                <asp:Label ID="lblPackingBoxes" runat="server" Text="Packing Boxes: " Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtPackingBoxes" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="AddRoom" ControlToValidate="txtPackingBoxes" ForeColor="Red" Text="Please Enter the Packing Boxes" ></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblBoxesType" runat="server" Text="Type of Boxes: " Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtBoxesType" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="AddRoom" ControlToValidate="txtBoxesType" ForeColor="Red" Text="Please Enter the Box Type" ></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblBoxesNumber" runat="server" Text="Number of Boxes: " Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtBoxesNumber" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="AddRoom" ControlToValidate="txtBoxesNumber" ForeColor="Red" Text="Please Enter the Number of Boxes" ></asp:RequiredFieldValidator>
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
                <asp:Label ID="lblPhotoUpload" runat="server" Text="Room Photos: " Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:FileUpload ID="PhotoFileUpload" runat="server" AllowMultiple="true" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="PhotoFileUpload" Text="Please Upload Photos for The Room" ForeColor="Red" ValidationGroup="AddRoom"></asp:RequiredFieldValidator>

    <asp:Table ID="Table3" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="BtnAddRoom" runat="server" Text="Add Room" OnClick="BtnAddRoom_Click" ValidationGroup="AddRoom" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>

    <asp:Table ID="Table4" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAddedRoom" runat="server" Text="Added Room" Font-Bold="true" Font-Size="X-Large"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:ListBox ID="lstbxAddedRoom" runat="server"></asp:ListBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>

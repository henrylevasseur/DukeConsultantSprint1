<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="EmpViewRequest.aspx.cs" Inherits="DukeConsultantSprint1.EmpViewRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="Content/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <legend>Request Information: </legend>
        <asp:GridView runat="server" ID="grdShowRequest" AlternatingRowStyle-BackColor="#eaaaff" EmptyDataText="NoCustomerSelected!"></asp:GridView>
        <asp:Label ID="lblNote" runat="server" BackColor="#FFE384"></asp:Label>
        <asp:Button ID="fillRequest" runat="server" Text="Complete" OnClick="fillRequest_Click" class="btn btn-primary" type="submit"/>
        &nbsp
        <asp:Button ID="denyRequest" runat="server" Text="Deny" OnClick="denyRequest_Click" class="btn btn-primary" type="submit"/>
    </fieldset>
    <script src="Scripts/jquery-3.5.1.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
</asp:Content>

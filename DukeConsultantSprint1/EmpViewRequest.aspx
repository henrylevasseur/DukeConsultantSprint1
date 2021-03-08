<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="EmpViewRequest.aspx.cs" Inherits="DukeConsultantSprint1.EmpViewRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <legend>Request Information: </legend>
        <asp:GridView runat="server" ID="grdShowRequest" AlternatingRowStyle-BackColor="#eaaaff" EmptyDataText="NoCustomerSelected!"></asp:GridView>
        <asp:Label ID="lblNote" runat="server"></asp:Label>
        <asp:Button ID="fillRequest" runat="server" Text="Complete" OnClick="fillRequest_Click" />
        &nbsp
        <asp:Button ID="denyRequest" runat="server" Text="Deny" OnClick="denyRequest_Click" />
    </fieldset>
</asp:Content>

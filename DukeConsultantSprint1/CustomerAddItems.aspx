<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="CustomerAddItems.aspx.cs" Inherits="DukeConsultantSprint1.CustomerAddItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html>
        <%-- Henry LeVasseur and Patrick Sullivan --%>
        <body>
        <div>
            <br />           
                <%--Create Header, followed by Table With Each Necessary Field--%>
                <asp:Label ID="itemHeader" runat="server" Text="Please Add Items to a Service Below" Font-Bold Font-Size ="15" Font-Name="Open Sans"></asp:Label>
                <br />
                <asp:Table ID="tableItem" runat="server" class="table-warning">                    
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblService" runat="server" Text="Choose Service: " Font-Bold></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="serviceList" runat="server"></asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblItemName" runat="server" Text="Item Name: " Font-Bold></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtItemName" runat="server" type="Item Name" class="form-control" placeholder="Item Name"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="rfINameValidation" ControlToValidate="txtItemName" runat="server" ValidationGroup="iSaveValidation" ErrorMessage="Please Enter an Item Name" ForeColor="Red"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblItemDesc" runat="server" Text="Item Description:" Font-Bold></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtItemDesc" runat="server" TextMode="MultiLine" type="Item Description" class="form-control" placeholder="Item Description"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="rfDescValidator" ControlToValidate="txtItemDesc" ValidationGroup="iSaveValidation" runat="server" ErrorMessage="Please Enter a Description" ForeColor="Red"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblEstValue" runat="server" Text="Est. Value: " Font-Bold></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtEstValue" runat="server" TextMode="Number" type="Est. Value" class="form-control" placeholder="Est. Value" ></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="rfIValueValidation" ControlToValidate="txtItemName" runat="server" ValidationGroup="iSaveValidation" ErrorMessage="Please Enter an Item Value" ForeColor ="Red"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>                     
                </asp:Table>
                <asp:Button ID="SaveBtn" runat="server" ValidationGroup="iSaveValidation" Text="Save" OnClick="SaveBtn_Click" class="btn btn-primary" type="submit"/>
                &nbsp;
                <asp:Button ID="ClearBtn" runat="server" Text="Clear" OnClick="ClearBtn_Click" type="button" class="btn btn-outline-primary"/>
                    <%--Establishes a data source that can be used in the above code to populate existing data in UI controls--%>
                <br />
                <asp:Label ID="lblSaveStatus" runat="server" Text=""></asp:Label>
                <br />                
        </div>
    <script src="Scripts/jquery-3.5.1.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
    </body>
</html>
</asp:Content>

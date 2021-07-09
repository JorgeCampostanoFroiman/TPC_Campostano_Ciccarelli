<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarMarca.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.ModificarMarca" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="nombre">
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ErrorMessage="Required" ControlToValidate="TxtMarca"></asp:RequiredFieldValidator>
    <asp:Label runat="server" ID="labelNombre"> Nuevo nombre de la marca:  </asp:Label>
    <asp:TextBox runat="server" ID="TxtMarca" ></asp:TextBox>
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ValidationExpression="[a-zA-Z -]+" ControlToValidate="TxtMarca" ErrorMessage="Solo letras"></asp:RegularExpressionValidator>
    </div>
    <asp:Button runat="server" ID="btnMarca" OnClick="btnMarca_Click"/>

    
</asp:Content>

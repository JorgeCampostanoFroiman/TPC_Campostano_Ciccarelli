<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModifProveedor.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.ModifProveedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="Razon Social">
        <asp:Label runat="server" > Razon Social</asp:Label>
        <asp:RequiredFieldValidator runat="server" ID="RFV1" ErrorMessage="Required" ControlToValidate="textoRazonSocial" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" ID="textoRazonSocial" MaxLength="80" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
        <asp:Label runat="server" ID="labelioRazonSocial"> Razon social </asp:Label>
        <asp:RegularExpressionValidator runat="server" ID="ValidarCodigo" ValidationExpression="[a-zA-Z0-9]+" ControlToValidate="textoRazonSocial" ErrorMessage="Solo letras y números"></asp:RegularExpressionValidator>
        </div>
        
        <div id="Cuit">
        <asp:Label runat="server" > Cuit</asp:Label>
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ErrorMessage="Required" ControlToValidate="textoCuit" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" ID="textoCuit" MaxLength="12" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
        <asp:Label runat="server" ID="labelioCuit"> Cuit </asp:Label>
        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ValidationExpression="[0-9]+" ControlToValidate="textoCuit" ErrorMessage="Solo números"></asp:RegularExpressionValidator>
        </div>
        
        <div id="domicilio">
        <asp:Label runat="server" > Domicilio</asp:Label>
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ErrorMessage="Required" ControlToValidate="textoDomicilio" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" ID="textoDomicilio" MaxLength="80" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
        <asp:Label runat="server" ID="labelioDomicilio"> Domicilio </asp:Label>
        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ValidationExpression="[a-zA-Z0-9]+" ControlToValidate="textoDomicilio" ErrorMessage="Solo letras y números"></asp:RegularExpressionValidator>
        </div>

        <div id="telefono">
        <asp:Label runat="server" > Telefonol</asp:Label>
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ErrorMessage="Required" ControlToValidate="textoTelefono" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" ID="textoTelefono" MaxLength="12" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
        <asp:Label runat="server" ID="labelioTelefono"> Telefono </asp:Label>
        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ValidationExpression="[0-9]+" ControlToValidate="textoTelefono" ErrorMessage="Solo números"></asp:RegularExpressionValidator>
        </div>
       
        <div id="Email">
        <asp:Label runat="server" > Email</asp:Label>
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ErrorMessage="Required" ControlToValidate="textoEmail" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" ID="textoEmail" MaxLength="120" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
        <asp:Label runat="server" ID="labelioEmail"> Email </asp:Label>
        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator4" ControlToValidate="textoEmail" ValidationExpression="[a-zA-Z0-9]+" ErrorMessage="Solo números"></asp:RegularExpressionValidator>
        </div>
        

        <asp:Button runat="server" ID="btnModifProv" OnClick="btnModifProv_Click" Text="Modificar Proveedor"/>
</asp:Content>

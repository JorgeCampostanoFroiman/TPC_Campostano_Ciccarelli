<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarProducto.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.RegistrarProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
   
    
    <h1 style="margin-top:50px"> Producto a agregar:  </h1>

    <div id="codigo">
    <asp:RequiredFieldValidator runat="server" ID="RFV1" ErrorMessage="Required" ControlToValidate="textCodigo" ForeColor="#CC3300" ></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" ID="textCodigo" MaxLength="8" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
    <asp:Label runat="server" ID="labelCodigo"> Código: </asp:Label>
    <asp:RegularExpressionValidator runat="server" ID="ValidarCodigo" ValidationExpression="[a-zA-Z0-9]+" ControlToValidate="textCodigo" ErrorMessage="Solo letras y números"></asp:RegularExpressionValidator>
    
    </div>

    <div id="nombre">
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ErrorMessage="Required" ControlToValidate="textNombre"></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" ID="textNombre" MaxLength="80" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
    <asp:Label runat="server" ID="labelNombre"> Nombre: </asp:Label>
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ValidationExpression="[a-zA-Z -]+" ControlToValidate="textNombre" ErrorMessage="Solo letras"></asp:RegularExpressionValidator>
    </div>

    <div id="precioCompra">
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ErrorMessage="Required" ControlToValidate="textPrecioCompra"></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" ID="textPrecioCompra" MaxLength="8" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
    <asp:Label runat="server" ID="label1"> Precio de compra: </asp:Label>
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ValidationExpression="[0-9]+|\.|\," ControlToValidate="textPrecioCompra" ErrorMessage="Solo numeros, '.' y ','"></asp:RegularExpressionValidator>
    
    </div>

    <div id="stock">
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ErrorMessage="Required" ControlToValidate="textStock"></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" ID="textStock" MaxLength="8" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
    <asp:Label runat="server" ID="label2"> Stock:</asp:Label>
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ValidationExpression="[0-9]+" ControlToValidate="textPrecioCompra" ErrorMessage="Solo numeros"></asp:RegularExpressionValidator>
    
    </div>

    <div id="ganancia">
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ErrorMessage="Required" ControlToValidate="textGanancia"></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" ID="textGanancia" MaxLength="3" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
    <asp:Label runat="server" ID="label3"> Ganancia(%):</asp:Label>
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator4" ValidationExpression="[0-9]+" ControlToValidate="textGanancia" ErrorMessage="Solo numeros"></asp:RegularExpressionValidator>
    
    </div>

    <div id="desc">
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ErrorMessage="Required" ControlToValidate="textDesc"></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" ID="textDesc" MaxLength="3" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
    <asp:Label runat="server" ID="label4"> Descripción:</asp:Label>
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator5" ValidationExpression="[^a-zA-Z -]|(.)|" ControlToValidate="textDesc" ErrorMessage="Solo numeros"></asp:RegularExpressionValidator>
    
    </div>

    <div id="marca">
    <asp:DropDownList runat="server" ID="DDLMarca"></asp:DropDownList>
    </div>

    <div id="tipo">
    <asp:DropDownList runat="server" ID="DDLTipo"></asp:DropDownList>
    </div>

    <div id="proveedor">
    <asp:DropDownList runat="server" ID="DDLProveedor"></asp:DropDownList>
    </div>

    <div>
        <asp:Button runat="server" ID="BotonAceptar" Text="Aceptar" OnClick="BotonAceptar_Click"/>
    </div>

    <asp:Label ID="lblOutput" runat="server"></asp:Label>    
    

</asp:Content>

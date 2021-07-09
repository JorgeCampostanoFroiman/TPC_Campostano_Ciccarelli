<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarProducto.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.RegistrarProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
   
    
    <h1 style="margin-top:50px"> Producto a agregar:  </h1>

    <div id="codigo">
    <asp:RequiredFieldValidator runat="server" ID="RFV1" ErrorMessage="Required" ControlToValidate="tCodigo" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" ID="tCodigo" MaxLength="8" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
    <asp:Label runat="server" ID="labelCodigo"> Código: </asp:Label>
    <asp:RegularExpressionValidator runat="server" ID="ValidarCodigo" ValidationExpression="[a-zA-Z0-9]+" ControlToValidate="tCodigo" ErrorMessage="Solo letras y números"></asp:RegularExpressionValidator>
    
    </div>

    <div id="nombre">
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ErrorMessage="Required" ControlToValidate="tNombre"></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" ID="tNombre" MaxLength="80" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
    <asp:Label runat="server" ID="labelNombre"> Nombre: </asp:Label>
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ValidationExpression="[a-zA-Z -]+" ControlToValidate="tNombre" ErrorMessage="Solo letras"></asp:RegularExpressionValidator>
    </div>

    <div id="precioCompra">
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ErrorMessage="Required" ControlToValidate="tPrecioCompra"></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" ID="tPrecioCompra" MaxLength="8" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
    <asp:Label runat="server" ID="label1"> Precio de compra: </asp:Label>
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ValidationExpression="[0-9]+|\.|\," ControlToValidate="tPrecioCompra" ErrorMessage="Solo numeros, '.' y ','"></asp:RegularExpressionValidator>
    
    </div>

    <div id="stock">
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ErrorMessage="Required" ControlToValidate="tStock"></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" ID="tStock" MaxLength="8" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
    <asp:Label runat="server" ID="label2"> Stock:</asp:Label>
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ValidationExpression="[0-9]+" ControlToValidate="tStock" ErrorMessage="Solo numeros"></asp:RegularExpressionValidator>
    
    </div>

    <div id="ganancia">
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ErrorMessage="Required" ControlToValidate="tGanancia"></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" ID="tGanancia" MaxLength="3" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
    <asp:Label runat="server" ID="label3"> Ganancia(%):</asp:Label>
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator4" ValidationExpression="[0-9]+" ControlToValidate="tGanancia" ErrorMessage="Solo numeros"></asp:RegularExpressionValidator>
    
    </div>

    <div id="precioventa">
    <asp:TextBox runat="server" ID="tPrecioVenta" MaxLength="3" EnableViewState="True" AutoPostBack="False" Enabled="False"></asp:TextBox>
    <asp:Label runat="server" ID="label5"> Precio Venta:</asp:Label>
    
    </div>

    <div id="desc">
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ErrorMessage="Required" ControlToValidate="tDesc"></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" ID="tDesc" MaxLength="400" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
    <asp:Label runat="server" ID="label4"> Descripción:</asp:Label>
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator5" ValidationExpression="[a-zA-Z0-9 -]+" ControlToValidate="tDesc"></asp:RegularExpressionValidator>
    
    </div>

    <asp:ScriptManager runat="server" ID="scriptManager1"></asp:ScriptManager>
    <div id="marca">
    <asp:UpdatePanel runat="server">
    <ContentTemplate>
    <asp:DropDownList runat="server" ID="DDLMarca" OnSelectedIndexChanged="DDLMarca_SelectedIndexChanged" AutoPostBack="False"></asp:DropDownList>
    </ContentTemplate>
    </asp:UpdatePanel>
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

    

    


</asp:Content>

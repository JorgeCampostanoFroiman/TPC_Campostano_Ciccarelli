﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarProducto.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.ModificarProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1 style="margin-top:50px"> Producto a modificar:  </h1>

    <div id="codigo">
    <asp:Label runat="server" ID="label1"> Código: </asp:Label>
    <asp:RequiredFieldValidator runat="server" ID="RFV1" ErrorMessage="Required" ControlToValidate="textCodigo" ForeColor="#CC3300" ></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" ID="textCodigo" MaxLength="8" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
    <asp:Label runat="server" ID="labelCodigo"> Código: </asp:Label>
    <asp:RegularExpressionValidator runat="server" ID="ValidarCodigo" ValidationExpression="[a-zA-Z0-9]+" ControlToValidate="textCodigo" ErrorMessage="Solo letras y números"></asp:RegularExpressionValidator>
    
    </div>

    <div id="nombre">
    <asp:Label runat="server" ID="label2"> Nombre: </asp:Label>
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ErrorMessage="Required" ControlToValidate="textNombre"></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" ID="textNombre" MaxLength="80" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
    <asp:Label runat="server" ID="labelNombre"> Nombre: </asp:Label>
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ValidationExpression="[a-zA-Z -]+" ControlToValidate="textNombre" ErrorMessage="Solo letras"></asp:RegularExpressionValidator>
    </div>

    <div id="precioCompra">
    <asp:Label runat="server" ID="label3"> Precio Compra: </asp:Label>
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ErrorMessage="Required" ControlToValidate="textPrecioCompra"></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" ID="textPrecioCompra" MaxLength="8" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
    <asp:Label runat="server" ID="labelPrecioCompra"> Precio de compra: </asp:Label>
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ValidationExpression="[0-9]+|\.|\," ControlToValidate="textPrecioCompra" ErrorMessage="Solo numeros, '.' y ','"></asp:RegularExpressionValidator>
    
    </div>

    <div id="stock">
    <asp:Label runat="server" ID="label4"> Stock: </asp:Label>
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ErrorMessage="Required" ControlToValidate="textStock"></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" ID="textStock" MaxLength="8" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
    <asp:Label runat="server" ID="labelStock"> Stock:</asp:Label>
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ValidationExpression="[0-9]+" ControlToValidate="textPrecioCompra" ErrorMessage="Solo numeros"></asp:RegularExpressionValidator> 
    
    </div>

    <div id="ganancia">
    <asp:Label runat="server" ID="label5"> Ganancia: </asp:Label>
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ErrorMessage="Required" ControlToValidate="textGanancia"></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" ID="textGanancia" MaxLength="3" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
    <asp:Label runat="server" ID="labelGanancia"> Ganancia(%):</asp:Label>
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator4" ValidationExpression="[0-9]+" ControlToValidate="textGanancia" ErrorMessage="Solo numeros"></asp:RegularExpressionValidator> 
    
    </div>

    <div id="precioventa">
    <asp:Label runat="server" ID="label7"> Precio de venta: </asp:Label>
    <asp:TextBox runat="server" ID="textPrecioVenta" MaxLength="3" EnableViewState="True" AutoPostBack="False" Enabled="False"></asp:TextBox>
    <asp:Label runat="server" ID="labelPrecioVenta"> Precio Venta:</asp:Label>
    
    </div>

    <div id="desc">
    <asp:Label runat="server" ID="label8"> Desc: </asp:Label>
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ErrorMessage="Required" ControlToValidate="textDesc"></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" ID="textDesc" MaxLength="400" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
    <asp:Label runat="server" ID="labelDesc"> Descripción:</asp:Label>
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator5" ValidationExpression="[a-zA-Z0-9 -]+" ControlToValidate="textDesc"></asp:RegularExpressionValidator>
    
    </div>

    <div id="marca">
    <asp:Label runat="server" ID="label9"> Marca: </asp:Label>
    <asp:DropDownList runat="server" ID="DDLMarca"></asp:DropDownList>
    <asp:Label runat="server" ID="labelMarca"></asp:Label>
    </div>

    <div id="tipo">
    <asp:Label runat="server" ID="label10"> Tipo: </asp:Label>
    <asp:DropDownList runat="server" ID="DDLTipo"></asp:DropDownList>
    <asp:Label runat="server" ID="labelTipo"></asp:Label>
    </div>

    <div id="proveedor">
    <asp:Label runat="server" ID="label11"> Proveedor: </asp:Label>
    <asp:DropDownList runat="server" ID="DDLProveedor"></asp:DropDownList>
    <asp:Label runat="server" ID="labelProveedor"></asp:Label>
    </div>

    <div>
        <asp:Button runat="server" ID="BotonAceptar" OnClick="BotonAceptar_Click" Text="Aceptar" />
    </div>

</asp:Content>

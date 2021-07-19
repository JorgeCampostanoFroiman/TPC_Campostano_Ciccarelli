<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarProducto.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.ModificarProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<link href="Estilos/login.css" rel="stylesheet" type="text/css" />

<body class="main-bg">
        <div class="login-container text-c animated flipInX">
                                  
                <asp:Label runat="server" ID="tituloProducto"></asp:Label>
                    
                <div class="container-content">
                    <form class="margin-t">
                        <div class="form-group" style="text-align:center">
                            
                            <asp:RequiredFieldValidator runat="server" ID="RFV1" ErrorMessage="Required" ControlToValidate="textCodigo" ></asp:RequiredFieldValidator>
    <asp:TextBox class="form-control" runat="server" ID="textCodigo" MaxLength="8" EnableViewState="True" AutoPostBack="False" placeholder="Codigo"></asp:TextBox>

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ErrorMessage="Required" ControlToValidate="textNombre"></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" class="form-control" ID="textNombre" MaxLength="80" EnableViewState="True" AutoPostBack="False" placeholder="Nombre"></asp:TextBox>
                       
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ErrorMessage="Required" ControlToValidate="textPrecioCompra"></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" class="form-control" ID="textPrecioCompra" MaxLength="8" EnableViewState="True" AutoPostBack="False" placeholder="Precio de compra"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ErrorMessage="Required" ControlToValidate="textStock"></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" class="form-control" ID="textStock" MaxLength="8" EnableViewState="True" AutoPostBack="False" placeholder="Stock"></asp:TextBox>

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ErrorMessage="Required" ControlToValidate="textGanancia"></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" class="form-control" ID="textGanancia" MaxLength="3" EnableViewState="True" AutoPostBack="False" placeholder="Ganancia"></asp:TextBox>

<asp:TextBox runat="server" class="form-control" ID="textPrecioVenta" MaxLength="3" EnableViewState="True" AutoPostBack="False"  placeholder="Precio de venta"></asp:TextBox>

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ErrorMessage="Required" ControlToValidate="textDesc"></asp:RequiredFieldValidator>
    <asp:TextBox runat="server" class="form-control" ID="textDesc" MaxLength="400" EnableViewState="True" AutoPostBack="False" placeholder="Descripcion"></asp:TextBox>

                            <asp:DropDownList style="color:white" runat="server" class="form-control"  ID="DDLMarca"></asp:DropDownList>

                            <asp:DropDownList style="color:white" runat="server" class="form-control" ID="DDLTipo"></asp:DropDownList>

                            <asp:DropDownList style="color:white" runat="server" class="form-control" ID="DDLProveedor" ></asp:DropDownList>

                        </div>
                        <asp:Button runat="server" ID="BotonAceptar" OnClick="BotonAceptar_Click" class="btn btn-dark btn-sm" Text="Aceptar" />
                    </form>
                    <p class="margin-t text-whitesmoke"><small> Comercio Equis &copy; 2021</small> </p>
                </div>
            </div>
    </body>




    <div style="text-align:center">

    <div id="codigo">
    
    <asp:RegularExpressionValidator runat="server" ID="ValidarCodigo" ValidationExpression="[a-zA-Z0-9]+" ControlToValidate="textCodigo" ErrorMessage="El codigo solo puede contener letras y nÃºmeros"></asp:RegularExpressionValidator>
    
    </div>

    <div id="nombre">
    
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ValidationExpression="[a-zA-Z -]+" ControlToValidate="textNombre" ErrorMessage="El nombre Solo puede contener letras"></asp:RegularExpressionValidator>
    </div>

    <div id="precioCompra">
    
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ValidationExpression="[0-9]+|\.|\," ControlToValidate="textPrecioCompra" ErrorMessage="El precio solo puede contener numeros, '.' y ','"></asp:RegularExpressionValidator>
    
    </div>

    <div id="stock">
    
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ValidationExpression="[0-9]+" ControlToValidate="textStock" ErrorMessage="El stock Solo puede contener umeros"></asp:RegularExpressionValidator> 
    
    </div>

    <div id="ganancia">
    
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator4" ValidationExpression="[0-9]+" ControlToValidate="textGanancia" ErrorMessage="La ganancia Solo puede contener numeros"></asp:RegularExpressionValidator> 
    
    </div>

    <div id="precioventa">
    
    
    </div>

    <div id="desc">
    
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator5" ValidationExpression="[a-zA-Z0-9 -]+" ControlToValidate="textDesc"></asp:RegularExpressionValidator>
    
    </div>

   </div>

</asp:Content>

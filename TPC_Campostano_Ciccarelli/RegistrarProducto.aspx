<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarProducto.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.RegistrarProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
   <link href="Estilos/login.css" rel="stylesheet" type="text/css" />
    
    <body class="main-bg">
        <div class="login-container text-c animated flipInX">
                                  
                    <p class="text-black">Ingreso de Productos</p>
                <div class="container-content">
                    <form class="margin-t">
                        <div class="form-group" style="text-align:center;align-items:center">

                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ErrorMessage="Required" ControlToValidate="tCodigo" Display="Static"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" class="form-control" placeholder="Codigo" ID="tCodigo" MaxLength="8" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
                            
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" ErrorMessage="Required" ControlToValidate="tNombre" Display="Static"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" class="form-control" placeholder="Nombre" ID="tNombre" MaxLength="80" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
                            
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ErrorMessage="Required" ControlToValidate="tDesc"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" class="form-control" placeholder="Nombre" ID="tDesc" MaxLength="400" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
                            
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator8" ErrorMessage="Required" ControlToValidate="tPrecioCompra"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" class="form-control" placeholder="Precio de compra" ID="tPrecioCompra" MaxLength="8" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
                           
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator9" ErrorMessage="Required" ControlToValidate="tStock"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" class="form-control" placeholder="Stock" ID="tStock" MaxLength="8" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
                           
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator10" ErrorMessage="Required" ControlToValidate="tGanancia"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" class="form-control" placeholder="Ganancia" ID="tGanancia" MaxLength="3" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
                            
                           
                            

                            <asp:DropDownList class="form-control" style="color:white" runat="server" ID="DDLMarca" OnSelectedIndexChanged="DDLMarca_SelectedIndexChanged" AutoPostBack="False"></asp:DropDownList> 
                            
                            <asp:DropDownList class="form-control" style="color:white" runat="server" ID="DDLTipo"></asp:DropDownList>
                            
                            <asp:DropDownList runat="server" style="color:white" class="form-control" ID="DDLProveedor"></asp:DropDownList>
                            
                            </div>
                         
                          <asp:Button runat="server" ID="BotonAceptar" class="btn btn-dark btn-sm" Text="Aceptar" OnClick="BotonAceptar_Click"/>
                         <a href="NuestrosProductos.aspx" class="btn btn-dark btn-sm">Volver a Productos</a>
    
        
                       
                    </form>
                    <p class="margin-t text-whitesmoke"><small> Comercio Equis &copy; 2021</small> </p>
                </div>
            </div>
        <div style="text-align:center">
            <asp:Label runat="server" Text="Precio de venta"></asp:Label>
         <asp:TextBox runat="server" class="form-control" ID="tPrecioVenta" MaxLength="3" EnableViewState="True" Enabled="false" AutoPostBack="False"></asp:TextBox>
            </div>
        <div style="text-align:center">
            <div><asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator6" ValidationExpression="[a-zA-Z0-9]+" ControlToValidate="tCodigo" ErrorMessage="El codigo solo puede contener letras y numeros"></asp:RegularExpressionValidator></div>
            <div><asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator7" ValidationExpression="[a-zA-Z -]+" ControlToValidate="tNombre" ErrorMessage="El nombre solo puede tener letras" ></asp:RegularExpressionValidator></div>
            <div><asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ValidationExpression="[a-zA-Z0-9 -]+" ControlToValidate="tDesc" ErrorMessage="La descripcion solo puede contener letras y numeros" ></asp:RegularExpressionValidator></div>
            <div> <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator8" ValidationExpression="[0-9]+|\.|\," ControlToValidate="tPrecioCompra" ErrorMessage="El precio de compra solo puede ser un numero con decimales"></asp:RegularExpressionValidator></div>
            <div> <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator9" ValidationExpression="[0-9]+" ControlToValidate="tStock" ErrorMessage="El stock solo puede tener numeros"></asp:RegularExpressionValidator></div>
            <div><asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator10" ValidationExpression="[0-9]+" ControlToValidate="tGanancia" ErrorMessage="La ganancia solo puede ser representada por numeros(%)"></asp:RegularExpressionValidator></div>
            
        </div>

</body>


</asp:Content>

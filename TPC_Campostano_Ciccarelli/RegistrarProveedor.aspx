<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarProveedor.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.RegistrarProveedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     
    
    
    <link href="Estilos/login.css" rel="stylesheet" type="text/css" />

<body class="main-bg">
        <div class="login-container text-c animated flipInX">
                                  
                    <p class="text-black">Ingreso de Proveedor</p>
                <div class="container-content">
                    <form class="margin-t">
                        <div class="form-group" style="text-align:center">
                            <asp:RequiredFieldValidator runat="server" ID="RFV1" ErrorMessage="Required" ControlToValidate="txtRazonSocial" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
                            <asp:TextBox class="form-control" runat="server" style="color:white" ID="txtRazonSocial" MaxLength="80" EnableViewState="True" Text="Razon Social" AutoPostBack="False"></asp:TextBox>
                            
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ErrorMessage="Required" ControlToValidate="txtCuit" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
                         <asp:TextBox class="form-control" style="color:white" Text=Cuit runat="server" ID="txtCuit" MaxLength="12" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
                          
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ErrorMessage="Required" ControlToValidate="txtDomicilio" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" Text="Domicilio" class="form-control" style="color:white" ID="txtDomicilio" MaxLength="80" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
                        
                           <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ErrorMessage="Required" ControlToValidate="txtTelefono" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" Text="Telefono" Class="form-control" style="color:white" ID="txtTelefono" MaxLength="12" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
                             
                          <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ErrorMessage="Required" ControlToValidate="txtEmail" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" Class="form-control" Text="Email" ID="txtEmail" style="color:white" MaxLength="120" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
                        
                        </div>
                        
                        <asp:Button type="submit" ID="btnRegistrarProveedor" class="btn btn-dark btn-sm" OnClick="btnRegistrarProveedor_Click" runat="server" Text="Ingresar"/>
                        <a href="AgregarProveedor.aspx" class="btn btn-dark btn-sm">Volver a Proveedores</a>
                       
                    </form>
                    <p class="margin-t text-whitesmoke"><small> Comercio Equis &copy; 2021</small> </p>
                </div>
            </div>

            <div style="text-align:center">
                <div><asp:RegularExpressionValidator runat="server" ID="ValidarCodigo" ValidationExpression="[a-zA-Z0-9- ]+" ControlToValidate="txtRazonSocial" ErrorMessage="*La razón Social solo puede tener Letras/números"></asp:RegularExpressionValidator></div>
                <div><asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ValidationExpression="[0-9]+" ControlToValidate="txtCuit" ErrorMessage="´*El Cuit Solo puede contener números"></asp:RegularExpressionValidator> </div>
                <div><asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ValidationExpression="[a-zA-Z0-9- ]+" ControlToValidate="txtDomicilio" ErrorMessage="*El domicilio solo puede tener Letras/números"></asp:RegularExpressionValidator></div>
                <div><asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ValidationExpression="[0-9]+" ControlToValidate="txtTelefono" ErrorMessage="*El telefono Solo puede tener números"></asp:RegularExpressionValidator></div>
                <div><asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator4" ControlToValidate="txtEmail" ValidationExpression="[a-zA-Z0-9]+" ErrorMessage="*Direccion de email no valida"></asp:RegularExpressionValidator></div>
                
                 
                 
                
                

            </div>


</body>



        
</asp:Content>

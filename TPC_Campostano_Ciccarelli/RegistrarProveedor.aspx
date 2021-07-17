<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarProveedor.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.RegistrarProveedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="Estilos/login.css" rel="stylesheet" type="text/css" />
    <body class="main-bg">
        <div class="login-container text-c animated flipInX">
                                  
                    <p class="text-black">Ingreso de usuarios</p>
                <div class="container-content">
                    <form class="margin-t">
                        <div class="form-group">
                            <asp:TextBox runat="server" ID="textRazonSocial" MaxLength="80" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
        <asp:Label runat="server" ID="label4"> Razon social </asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox runat="server" ID="txtCuit" MaxLength="12" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
        <asp:Label runat="server" ID="label5"> Cuit </asp:Label>
                        </div>
                        <button type="submit" class="form-button button-l margin-b">Ingresar</button>
        
                        <a class="text-darkyellow" href="#"><small>¿Olvidaste tu contraseña?</small></a>
                        <p class="text-whitesmoke text-center"><small>¿No tenés una cuenta?</small></p>
                        <a class="text-darkyellow" href="Registrarse.aspx""><small>Registrarse!</small></a>
                    </form>
                    <p class="margin-t text-whitesmoke"><small> Comercio Equis &copy; 2021</small> </p>
                </div>
            </div>
</body>








<%--
    <hr class="py-1" />
     <h1 class=" text-center">Registrar un nuevo proveedor</h1>
    <div style="border: medium double #008080; background-color:darkgrey;text-align:center;align-items:center">

   
        <div class="form-row">

           
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ErrorMessage="Required" ControlToValidate="textRazonSocial" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
    
        <asp:TextBox runat="server" ID="textRazonSocial" MaxLength="80" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
        <asp:Label runat="server" ID="label4"> Razon social </asp:Label>
       
        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator5" ValidationExpression="[a-zA-Z0-9]+" ControlToValidate="textRazonSocial" ErrorMessage="Solo letras y números"></asp:RegularExpressionValidator> 
           
        </div>

        <div class="form-row" >
            
               <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ErrorMessage="Required" ControlToValidate="txtCuit" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" ID="txtCuit" MaxLength="12" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
        <asp:Label runat="server" ID="label5"> Cuit </asp:Label>
        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator6" ValidationExpression="[0-9]+" ControlToValidate="txtCuit" ErrorMessage="Solo números"></asp:RegularExpressionValidator>
            

        </div>


        <div class="form-row" >
           
               <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" ErrorMessage="Required" ControlToValidate="txtDomicilio" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" ID="txtDomicilio" MaxLength="80" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
        <asp:Label runat="server" ID="label6"> Domicilio </asp:Label>
        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator7" ValidationExpression="[a-zA-Z0-9]+" ControlToValidate="txtDomicilio" ErrorMessage="Solo letras y números"></asp:RegularExpressionValidator>
            

        </div>
        <div class="form-row" >
           
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator8" ErrorMessage="Required" ControlToValidate="txtTelefono" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" ID="txtTelefono" MaxLength="12" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
        <asp:Label runat="server" ID="label7"> Telefono </asp:Label>
        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator8" ValidationExpression="[0-9]+" ControlToValidate="txtTelefono" ErrorMessage="Solo números"></asp:RegularExpressionValidator>
           
        </div>

        <div class="form-row" >
            
               <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator9" ErrorMessage="Required" ControlToValidate="txtEmail" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" ID="txtEmail" MaxLength="120" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
        <asp:Label runat="server" ID="label8"> Email </asp:Label>
        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator9" ControlToValidate="txtEmail" ValidationExpression="[a-zA-Z0-9]+" ErrorMessage="Solo números"></asp:RegularExpressionValidator>
            
            </div>
        

       <asp:Button runat="server" ID="btnAgregarProv" OnClick="btnAgregarProv_Click" Text="Agregar Proveedor"/>

    
    
    </div>--%>















        
</asp:Content>

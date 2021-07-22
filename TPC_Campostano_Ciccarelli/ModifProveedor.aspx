<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModifProveedor.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.ModifProveedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
     <link href="Estilos/login.css" rel="stylesheet" type="text/css" />

<body class="main-bg">
        <div class="login-container text-c animated flipInX">
                                  
                <asp:Label runat="server" ID="tituloProveedor"></asp:Label>
                    
                <div class="container-content">
                    <form class="margin-t">
                        <div class="form-group">

                       
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ErrorMessage="Requerido" ControlToValidate="textoRazonSocial" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
        <asp:TextBox class="form-control" placeholder="Razon Social" runat="server" ID="textoRazonSocial" MaxLength="80" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
        
                     
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ErrorMessage="Requerido" ControlToValidate="textoCuit" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" class="form-control"  placeholder="Cuit" ID="textoCuit" MaxLength="12" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
       
                   
             <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" ErrorMessage="Requerido" ControlToValidate="textoDomicilio" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" class="form-control"  placeholder="Domicilio" ID="textoDomicilio" MaxLength="80" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
       
                   
             <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator8" ErrorMessage="Requerido" ControlToValidate="textoTelefono" ForeColor="#CC3300" Enabled="false" Display="Static"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" class="form-control"  placeholder="Telefono"  ID="textoTelefono" MaxLength="12" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
        
              
              <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator9" ErrorMessage="Requerido" ControlToValidate="textoEmail" ForeColor="#CC3300" Enabled="false" Display="Static"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" class="form-control"  placeholder="Email" ID="textoEmail" MaxLength="120" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
       
                 
                       <asp:Button runat="server" ID="btnModifProv"  class="btn btn-dark btn-sm" OnClick="btnModifProv_Click" Text="Modificar Proveedor"/>
                       
                    </form>
                    <p class="margin-t text-whitesmoke"><small> Comercio Equis &copy; 2021</small> </p>
                </div>
            </div>

    <div style="text-align:center">
        <div><asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator5" ValidationExpression="[a-zA-Z0-9- ]+" ControlToValidate="textoRazonSocial" ErrorMessage="La razon social solo puede contener letras y numeros"></asp:RegularExpressionValidator>     </div>
        <div><asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator6" ValidationExpression="[0-9]+" ControlToValidate="textoCuit" ErrorMessage="El cuit solo puede contener numeros"></asp:RegularExpressionValidator></div>
        <div> <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator7" ValidationExpression="[a-zA-Z0-9- ]+" ControlToValidate="textoDomicilio" ErrorMessage="El domicilio solo puede tener letras y numeros"></asp:RegularExpressionValidator></div>
        <div><asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator8" ValidationExpression="[0-9]+" ControlToValidate="textoTelefono" ErrorMessage="El telefono solo puede contener numeros" ></asp:RegularExpressionValidator></div>
        <div> <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator9" ControlToValidate="textoEmail" ValidationExpression="[a-zA-Z0-9]+" ErrorMessage="El mail no es valido"></asp:RegularExpressionValidator></div>



    </div>
    



    </body>
    
    
    
    
    
        
</asp:Content>

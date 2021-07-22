<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarMarca.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.ModificarMarca" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <link href="Estilos/login.css" rel="stylesheet" type="text/css" />

<body class="main-bg">
        <div class="login-container text-c animated flipInX">
                                  
                <asp:Label runat="server" ID="tituloMarca"></asp:Label>
                    
                <div class="container-content">
                    <form class="margin-t">
                        <div class="form-group" style="text-align:justify">
                            
                            
                         <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ErrorMessage="Required" ControlToValidate="TxtMarca"></asp:RequiredFieldValidator>
                         <asp:TextBox runat="server" class="form-control" ID="TxtMarca" placeholder="Nombre nuevo"></asp:TextBox>
                         <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ValidationExpression="[a-zA-Z -]+" ControlToValidate="TxtMarca" ErrorMessage="Solo letras"></asp:RegularExpressionValidator>
                         </div>
                    
                        
                        <asp:Button runat="server" Text="Aceptar" class="btn btn-dark btn-sm" ID="btnMarca" OnClick="btnMarca_Click"/>
                       <a href="AgregarMarca.aspx" class="btn btn-dark btn-sm">Regresar a Marcas</a>
                    </form>
                    <p class="margin-t text-whitesmoke"><small> Comercio Equis &copy; 2021</small> </p>
                </div>
            </div>
    <div style="text-align:center">
        <asp:Label runat="server" id="marcaAgregada"></asp:Label>
    </div>
        
    </body>
    
    
    
    

    
</asp:Content>

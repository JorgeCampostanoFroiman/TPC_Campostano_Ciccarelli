<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecuperarContraseña.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.RecuperarContraseña" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
     <link href="Estilos/login.css" rel="stylesheet" type="text/css" />

    <body class="main-bg">
        <div class="login-container text-c animated flipInX">
                                  
                    <p class="text-black">Ingrese el email de la cuenta que desea recuperar</p>
                <div class="container-content">
                    <form class="margin-t">
                        <div class="form-group" style="text-align:center">
                        
                        <asp:TextBox runat="server" placeholder="E-mail" ID="textMail" class="form-control"></asp:TextBox>

                        </div>
                        <asp:Button runat="server" class="btn btn-dark btn-sm" id="btnRecuperar" OnClick="btnIngreso_Click" Text="Aceptar"/>
        
                        <a class="btn btn-dark btn-sm" href="Ingreso.aspx"">Volver a login</a>
                        <a class="btn btn-dark btn-sm" href="Registrarse.aspx"">Registrar nueva cuenta</a>
                    </form>
                    <p class="margin-t text-whitesmoke"><small> Comercio Equis &copy; 2021</small> </p>
                </div>
            </div>
</body>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ingreso.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.Ingreso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Estilos/login.css" rel="stylesheet" type="text/css" />

<body class="main-bg">
        <div class="login-container text-c animated flipInX">
                                  
                    <p class="text-black">Ingreso de usuarios</p>
                <div class="container-content">
                    <form class="margin-t">
                        <div class="form-group" style="text-align:center">
                            
                        <asp:TextBox runat="server" placeholder="E-mail" ID="textMail" class="form-control"></asp:TextBox>
                        
                        <asp:TextBox runat="server" placeholder="*****" ID="textContraseña" class="form-control"></asp:TextBox>
             
                        </div>
                        <asp:Button runat="server" class="btn btn-dark btn-sm" id="btnIngreso" OnClick="btnIngreso_Click" Text="Ingresar"/>
        
                        <a class="btn btn-dark btn-sm" href="#">¿Olvidaste tu contraseña?</a>
                        <a class="btn btn-dark btn-sm" href="Registrarse.aspx"">Registrarse!</a>
                    </form>
                    <p class="margin-t text-whitesmoke"><small> Comercio Equis &copy; 2021</small> </p>
                </div>
            </div>
</body>



</asp:Content>

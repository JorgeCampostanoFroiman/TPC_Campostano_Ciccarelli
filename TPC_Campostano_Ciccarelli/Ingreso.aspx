<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ingreso.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.Ingreso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Estilos/login.css" rel="stylesheet" type="text/css" />

<body class="main-bg">
        <div class="login-container text-c animated flipInX">
                                  
                    <p class="text-black">Ingreso de usuarios</p>
                <div class="container-content">
                    <form class="margin-t">
                        <div class="form-group">
                            <input style="text-align:center" type="text" class="form-control"  placeholder="Usuario" required="">
                        </div>
                        <div class="form-group">
                            <input style="text-align:center" type="password" class="form-control" placeholder="*****" required="">
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



</asp:Content>

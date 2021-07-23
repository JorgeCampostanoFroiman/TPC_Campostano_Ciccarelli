<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <link href="Estilos/login.css" rel="stylesheet" type="text/css" />

<body class="main-bg">
        <div class="login-container text-c animated flipInX">
                                  
                    
                <div class="container-content" style="background-color:indianred">
                    <form class="margin-t">
                        <div class="form-group" style="text-align:center">
                                 <p class="form-button"><asp:Label runat="server" ID="labelMensaje" Text="Un error ha ocurrido"></asp:Label></p>
                        </div>
                        
                        <a class="btn btn-dark btn-sm" href="Default.aspx">Ir al home</a>
                        <a class="btn btn-dark btn-sm" href="Ingreso.aspx"">Ir al login!</a>
                    </form>
                    <p class="margin-t text-whitesmoke"><small> Comercio Equis &copy; 2021</small> </p>
                </div>
            </div>


    



</asp:Content>

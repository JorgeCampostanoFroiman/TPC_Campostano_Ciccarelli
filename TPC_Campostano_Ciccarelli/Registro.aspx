<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
    <link href="Estilos/login.css" rel="stylesheet" type="text/css" />

       
        <div class="login-container text-c animated flipInX">
                                  
                   
                <div class="container-content">
                    <form class="margin-t">
                        <div class="form-group">
                            <input style="text-align:center" type="text" class="form-control"  placeholder="Usuario" required="">
                        </div>
                        <div class="form-group">
                            <input style="text-align:center" type="password" class="form-control" placeholder="Password" required="">
                        </div>
                        <button type="submit" class="form-button button-l margin-b">Registrarse</button>
                    </form>
                    <p class="margin-t text-whitesmoke"><small> Comercio Equis &copy; 2021</small> </p>
                </div>
            </div>

        

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleProveedor.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.DetalleProveedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Estilos/login.css" rel="stylesheet" type="text/css" />
    
                        

    <body class="main-bg">
        <div class="login-container text-c animated flipInX">
                                  
                    <p class="text-black">Detalle del Proveedor</p>
                <div class="container-content">
                    <form class="margin-t">
                        <div class="form-group" style="text-align:center">
                       <p class="form-button"><asp:Label runat="server" ID="labelIdProveedor"></asp:Label></p>
                <p class="form-button"><asp:Label runat="server" ID="labelRazonSocial"></asp:Label></p>
                        <p class="form-button"><asp:Label runat="server" ID="labelCuit"></asp:Label></p>
                        <p class="form-button"><asp:Label runat="server" ID="labelEmail"></asp:Label></p>
                          <p class="form-button""><asp:Label runat="server" ID="labelDomicilio"></asp:Label></p>
                          <p class="form-button"><asp:Label runat="server" ID="labelTelefono"></asp:Label></p>
                        </div>
                        <a class="btn btn-dark btn-sm" style="margin-top:10px" href="AgregarProveedor.aspx"">Regresar a Proveedores!</a>
                    </form>
                    <p class="margin-t text-whitesmoke"><small> Comercio Equis &copy; 2021</small> </p>
                </div>
            </div>
</body>



</asp:Content>

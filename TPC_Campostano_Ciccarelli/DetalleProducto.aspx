<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleProducto.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.DetalleProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Estilos/login.css" rel="stylesheet" type="text/css" />
    
    <body class="main-bg">
        <div class="login-container text-c animated flipInX">
                                  
                    <p class="text-black">Detalle del Producto</p>
                <div class="container-content">
                    <form class="margin-t">
                        <div class="form-group" style="text-align:center">
                       <p class="form-button"><asp:Label runat="server" ID="labelIdProducto"></asp:Label></p>
                <p class="form-button"><asp:Label runat="server" ID="labelCodigo"></asp:Label></p>
                        <p class="form-button"><asp:Label runat="server" ID="labelNombreProducto"></asp:Label></p>
                        <p class="form-button"><asp:Label runat="server" ID="labelMarca"></asp:Label></p>
                          <p class="form-button""><asp:Label runat="server" ID="labelTipo"></asp:Label></p>
                          <p class="form-button"><asp:Label runat="server" ID="labelPrecioCompra"></asp:Label></p>
                            <p class="form-button"><asp:Label runat="server" ID="labelStock"></asp:Label></p>
                          <p class="form-button""><asp:Label runat="server" ID="labelGanancia"></asp:Label></p>
                          <p class="form-button"><asp:Label runat="server" ID="labelPrecioVenta"></asp:Label></p>
                            <p class="form-button"><asp:Label runat="server" ID="labelDescripcion"></asp:Label></p>
                          <p class="form-button""><asp:Label runat="server" ID="labelIdProveedor"></asp:Label></p>
                          <p class="form-button"><asp:Label runat="server" ID="LabelEstado"></asp:Label></p>
                        </div>
                        <a class="btn btn-dark btn-sm" style="margin-top:10px" href="NuestrosProductos.aspx"">Regresar a Productos!</a>
                    </form>
                    <p class="margin-t text-whitesmoke"><small> Comercio Equis &copy; 2021</small> </p>
                </div>
            </div>
</body>
    

</asp:Content>

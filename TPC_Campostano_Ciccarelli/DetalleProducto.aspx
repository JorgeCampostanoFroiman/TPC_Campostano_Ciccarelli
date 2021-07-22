<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleProducto.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.DetalleProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin-top: 3rem; align-content: center">
                <div class="card" style="width: 60rem; text-align:center;" >
                    <div class="card-title" style="background-color:thistle">
                    <h2><asp:Label runat="server" Text="Detalle del Producto: "></asp:Label></h2> </div>
                    <div class="card-title" style="background-color:thistle"><h3><asp:Label runat="server" ID="labelIdProducto"></asp:Label></h3> </div>
                   
                    <div class="card-body" style="background-color:thistle">
                        
                        <p class="card-text"><asp:Label runat="server" ID="labelCodigo"></asp:Label></p>
                        <p class="card-text"><asp:Label runat="server" ID="labelNombreProducto"></asp:Label></p>
                        <p class="card-text"><asp:Label runat="server" ID="labelIdMarca"></asp:Label></p>
                        <p class="card-text"><asp:Label runat="server" ID="labelIdTipo"></asp:Label></p>
                          <p class="card-text"><asp:Label runat="server" ID="labelPrecioCompra"></asp:Label></p>
                          <p class="card-text"><asp:Label runat="server" ID="labelStock"></asp:Label></p>
                          <p class="card-text"><asp:Label runat="server" ID="labelGanancia"></asp:Label></p>
                          <p class="card-text"><asp:Label runat="server" ID="labelPrecioVenta"></asp:Label></p>
                          <p class="card-text"><asp:Label runat="server" ID="labelDescripcion"></asp:Label></p>
                          <p class="card-text"><asp:Label runat="server" ID="labelIdProveedor"></asp:Label></p>
                    

                    </div>
                </div>
            </div>

</asp:Content>

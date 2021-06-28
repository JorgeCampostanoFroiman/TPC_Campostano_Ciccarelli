<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuestrosProductos.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.NuestrosProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div style="margin-top:50px;text-align:center">
      <h1>REGISTRO DE COMPRAS</h1> 
      <a class="btn btn-primary btn-lg" href="RegistrarVenta.aspx" role="button">Registrar una venta</a>
      </div>

    <table class="table table-striped mt-5" style="background-color:#b6d1d4 ">
  <thead class="thead-dark">
     
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Codigo</th>
      <th scope="col">Tipo</th>
      <th scope="col">Precio de compra</th>
      <th scope="col">Ganancia</th>
      <th scope="col">Detalle</th>
        

    </tr>
  </thead>
  <tbody>
      <% foreach (dominio.Producto item in lista)
            {%>
      <tr>
      <th scope="row"><% = item.IdProducto %></th>
      <td><% = item.Codigo %></td>  
      <td><% = item.tipo.Nombre %></td>
      <td><% = item.precioCompra %></td>
      <td><a href="DetalleCompra.aspx?id=<% = item.IdProducto%>" class="btn btn-primary">Ver Detalle</a></td>
    </tr>
       <% } %>
      </tbody>
        </table>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuestrosProductos.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.NuestrosProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div style="margin-top:50px;text-align:center">
      <h1>NUESTROS PRODUCTOS      </h1> 
         <a href="RegistrarProducto.aspx" class="btn btn-dark btn-sm">Agregar Producto</a>
      </div>
    <div style="text-align:center;margin-top:25px">
   <asp:TextBox ID="BarraBusqueda" runat="server"></asp:TextBox>
    <asp:Button ID="BotonBusqueda" runat="server" OnClick="BotonBusqueda_Click" class="btn btn-dark btn-sm" Text="Buscar" />
     </div>
    <table class="table table-striped mt-5" style="background-color:#b6d1d4 ">
  <thead class="thead-dark">

    <tr>
      <th scope="col">Número</th>
      <th scope="col">Codigo</th>
      <th scope="col">Nombre</th>
      <th scope="col">Tipo</th>
      <th scope="col">Precio de compra</th>
      <th scope="col">Precio de Venta</th>
      <th scope="col">Stock</th>
      <th scope="col">Modificar</th>
      <th scope="col">Dar de baja</th>
      <th scope="col">Detalle</th>
       
    </tr>
  </thead>
  <tbody>
      <% foreach (dominio.Producto item in lista)
            {%>
      <tr>
      <th scope="row"><% = item.IdProducto %></th>
      <td><% = item.Codigo %></td>  
      <td><% = item.NombreProducto %></td>  
      <td><% = item.tipo.Nombre %></td>
      <td><% = item.precioCompra %></td> 
      <td><% = item.precioVenta %></td>
       <td id="stockItem"><% = item.Stock %></td>
      <td><a href="ModificarProducto.aspx?id=<% = item.IdProducto%>" class="btn btn-dark btn-sm" role="button">Modificar</a></td>
      <td><a href="NuestrosProductos.aspx?id=<% = item.IdProducto%>&c=d" style="background-color:red" class="btn btn-danger btn-sm">Eliminar</a>
      <td><a href="DetalleCompra.aspx?id=<% = item.IdProducto%>" class="btn btn-dark btn-sm">Ver Detalle</a></td>
    </tr>
       <% } %>
      </tbody>
        </table>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuestrosProductos.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.NuestrosProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div style="margin-top:50px;text-align:center">
      <h1>NUESTROS PRODUCTOS      </h1> 
      <a class="btn btn-primary btn-lg" href="RegistrarProducto.aspx" role="button">Agregar un Producto</a>
      <a class="btn btn-primary btn-lg" href="AgregarMarca.aspx" role="button">Agregar una Marca</a>
      <a class="btn btn-primary btn-lg" href="AgregarTipo.aspx" role="button">Agregar un Tipo</a>
      </div>

    <table class="table table-striped mt-5" style="background-color:#b6d1d4 ">
  <thead class="thead-dark">
     
    <tr>
      <th scope="col">Número</th>
      <th scope="col">Codigo</th>
      <th scope="col">Nombre</th>
      <th scope="col">Tipo</th>
      <th scope="col">Precio de compra</th>
      <th scope="col">Detalle</th>
      <th scope="col">Modificar</th>
      <th scope="col">Dar de baja</th>
       
        

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
      <td><a href="DetalleCompra.aspx?id=<% = item.IdProducto%>" class="btn btn-primary">Ver Detalle</a></td>
      <td><a class="btn btn-primary btn-lg" href="RegistrarProducto.aspx" role="button">Modificar</a></td>
      <td><a class="btn btn-primary btn-lg">Elim</a></td>
    </tr>
       <% } %>
      </tbody>
        </table>

</asp:Content>

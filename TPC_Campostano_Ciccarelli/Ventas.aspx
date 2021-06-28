<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.Ventas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-top:50px;text-align:center">
      <h1>REGISTRO DE VENTAS</h1> 
      <a class="btn btn-primary btn-lg" href="RegistrarVenta.aspx" role="button">Registrar una venta</a>
      </div>

    <table class="table table-striped mt-5" style="background-color:#b6d1d4 ">
  <thead class="thead-dark">
     
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Fecha</th>
      <th scope="col">Cliente</th>
      <th scope="col">Metodo de Pago</th>
      <th scope="col">Importe</th>
      <th scope="col">Detalle</th>
        

    </tr>
  </thead>
  <tbody>
      <% foreach (dominio.Venta item in lista)
            {%>
      <tr>
      <th scope="row"><% = item.IdVenta %></th>
      <td><% = item.Fecha.Date.ToString("dd-MM-yyyy") %></td>
      <td><% = item.cliente.RazonSocial %></td>
      <td><% = item.metodoPago.Nombre %></td>
      <td><% = item.Importe %></td>
      <td><a href="DetalleCompra.aspx?id=<% = item.IdVenta%>" class="btn btn-primary">Ver Detalle</a></td>
    </tr>
       <% } %>
      </tbody>
        </table>
     



</asp:Content>

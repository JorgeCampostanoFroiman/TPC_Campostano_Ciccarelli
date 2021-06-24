<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Compras.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.Compras1" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  
    
    <div style="margin-top:50px;text-align:center">
      <h1>REGISTRO DE COMPRAS</h1> 
      <a class="btn btn-primary btn-lg" href="RegistrarCompra.aspx" role="button">Registrar una compra</a>
      </div>

    <table class="table table-striped mt-5" style="background-color:#b6d1d4 ">
  <thead class="thead-dark">
     
    <tr>
      <th scope="col">#</th>
      <th scope="col">Fecha</th>
      <th scope="col">Proveedor</th>
      <th scope="col">Metodo de Pago</th>

    </tr>
  </thead>
  <tbody>
      <% foreach (dominio.Compra item in lista)
            {%>
      <tr>
      <th scope="row"><% = item.IdCompra %></th>
      <td><% = item.Fecha.Date.ToString("dd-MM-yyyy") %></td>
      <td>7</td>
      <td>Cash</td>
    </tr>
       <% } %>
      </tbody>
        </table>



       

</asp:Content>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarMarca.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.AgregarMarca" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Estilos/agregarMarca.css" rel="stylesheet" type="text/css" />
  
    <div style="margin-top:50px;text-align:center">
      <h1>LAS MARCAS    </h1> 
      <asp:TextBox runat="server" ID="txtAgregar"></asp:TextBox>
        <asp:Button runat="server" ID="btnAgregar" OnClick="btnAgregar_Click" Text="Agregar marca"/>
      </div>

    <table class="table table-striped mt-5" style="background-color:#b6d1d4 ">
  <thead class="thead-dark">
     
    <tr>
      <th scope="col">Marca</th>
      <th scope="col">Modificar</th>
      <th scope="col">Eliminar</th>     

    </tr>
  </thead>
  <tbody>
      <% foreach (dominio.Marca item in listaMarcas)
            {%>
      <tr>
      <td><% = item.Nombre %> </td>
      <td><a href="ModificarMarca.aspx?id=<% = item.IdMarca%>" class="btn btn-dark btn-sm">Cambiar nombre</a></td>
      <td><a href="AgregarMarca.aspx?id=<% = item.IdMarca%>&c=d" class="btn btn-danger btn-sm">Eliminar</a>  
      
    </tr>
       <% } %>
      </tbody>
        </table>

</asp:Content>

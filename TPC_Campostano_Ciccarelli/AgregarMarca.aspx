<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarMarca.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.AgregarMarca" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Estilos/agregarMarca.css" rel="stylesheet" type="text/css" />
  
    <div style="margin-top:50px;text-align:center">
      <h1>LAS MARCAS    </h1> 
      <asp:TextBox runat="server" placeholder="Marca:" ID="txtAgregar"></asp:TextBox>
        <asp:Button runat="server" ID="btnAgregar" class="btn btn-dark btn-sm" OnClick="btnAgregar_Click" Text="Agregar marca"/>
      </div>
     <div style="text-align:center;margin-top:25px">
    <asp:TextBox ID="BarraBusqueda" placeholder="Búsqueda" runat="server"></asp:TextBox>
    <asp:Button ID="BotonBusqueda" runat="server" OnClick="BotonBusqueda_Click" class="btn btn-dark btn-sm" Text="Buscar" AutoPostBack="true"/>
   <asp:Button ID="Refrescar" runat="server" OnClick="Refrescar_Click"  class="btn btn-dark btn-sm" Text="Refrescar" AutoPostBack="true"/>
     </div>

    <table class="table table-striped mt-5" style="background-color:#b6d1d4;text-align:center ">
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
    <asp:Label runat="server" ID="marcaTexto"></asp:Label>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarProveedor.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.AgregarProveedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-top:50px;text-align:center">
      <h1>LOS PROVEEDORES   </h1> 
      
      </div>
    <div style="text-align:center"><a href="RegistrarProveedor.aspx" class="btn btn-dark btn-sm">Agregar proveedor</a></div> 

     <div style="text-align:center;margin-top:25px">
    <asp:TextBox ID="BarraBusqueda3" placeholder="Búsqueda" runat="server"></asp:TextBox>
    <asp:Button ID="BotonBusqueda3" runat="server" OnClick="BotonBusqueda3_Click" class="btn btn-dark btn-sm" Text="Buscar" AutoPostBack="true"/>
   <asp:Button ID="Refrescar" runat="server"  OnClick="Refrescar_Click" class="btn btn-dark btn-sm" Text="Refrescar" AutoPostBack="true"/>
     </div>

    <table class="table table-striped mt-5" style="background-color:#b6d1d4;text-align:center  ">
  <thead class="thead-dark">
     
    <tr>
      <th scope="col">Razón social</th>
      <th scope="col">Modificar</th>
      <th scope="col">Eliminar</th>
        <th scope="col">Detalle</th>

    </tr>
  </thead>
  <tbody>
      <% foreach (dominio.Proveedor item in listaProveedores)
            {%>
      <tr>
      <td><% = item.RazonSocialProveedor %> </td>
      <td><a href="ModifProveedor.aspx?id=<% = item.IdProveedor%>" class="btn btn-dark btn-sm">Modificar datos</a></td>
      <td><a href="AgregarProveedor.aspx?id=<% = item.IdProveedor%>&c=d" class="btn btn-danger btn-sm">Eliminar</a>  </td>
     <td><a href="DetalleProveedor.aspx?id=<% = item.IdProveedor%>" class="btn btn-dark btn-sm">Ver Detalle</a>  
      
    </tr>
       <% } %>
      </tbody>
        </table>

    <div>

        
      

    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarMarca.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.AgregarMarca" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Estilos/agregarMarca.css" rel="stylesheet" type="text/css" />
  
    <div style="margin-top:50px;text-align:center">
      <h1>LAS MARCAS    </h1> 
      
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
  
    <asp:Label runat="server" ID="label1">Marcas</asp:Label>
   
    
    
  <div id="vermarcas" width: 480px;>
    <asp:ScriptManager runat="server" ID="scriptManager1"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
    <ContentTemplate>
    <asp:Label runat="server" ID="lbl1"></asp:Label>
    <asp:DropDownList runat="server" ID="DDLMarca" AutoPostBack="True"></asp:DropDownList>
    <asp:Button runat="server"  Text="refrescar" ID="RefreshButton" OnClick="RefreshButton_Click"/>
    
    </ContentTemplate>
    </asp:UpdatePanel>
  </div>

  <div class="modificarMarca";>
    <asp:Button runat="server" ID="btnModificar" Text="Modificar Marca"/>
    <asp:TextBox runat="server" ID="textModificarMarca"></asp:TextBox>
    <asp:Button runat="server" ID="btnEliminar" Text="Bajar Marca"/>
    

    <div id="agregarMarca">
    <asp:Label runat="server" Text="Marca a agregar: "></asp:Label>
    <asp:TextBox runat="server" ID="textAgregarMarca"></asp:TextBox>
    <asp:Button runat="server" ID="btnAgregarMarca" Text="Agregar" OnClick="btnAgregarMarca_Click" />
    </div>
  </div>

    
    
           

 

</asp:Content>

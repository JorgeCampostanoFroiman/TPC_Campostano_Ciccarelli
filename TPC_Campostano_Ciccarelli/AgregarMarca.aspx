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
      <% foreach (dominio.Marca item in lista)
            {%>
      <tr>
      <td><asp:Label runat="server"> <% = item.Nombre %> </asp:Label></td>
      <td><asp:Button runat="server" ID="modificarMarca" OnClick="modificarMarca_Click" style="background-image:url(data:image/png;base64,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)"  /></td>  
      <td><asp:Button runat="server" ID="eliminarMarca" OnClick="eliminarMarca_Click" style="background-color:red" BorderStyle="Solid"/></td>  
      
    </tr>
       <% } %>
      </tbody>
        </table>
  
   
   
    
    
  <

    
    
           

 

</asp:Content>

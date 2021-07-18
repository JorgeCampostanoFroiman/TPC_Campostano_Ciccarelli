<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarTipo.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.AgregarTipo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div style="margin-top:50px;text-align:center">
      <h1>LOS TIPOS   </h1> 
      <asp:TextBox runat="server" ID="txtAgregar"></asp:TextBox>
        <asp:Button runat="server" ID="btnAgregar" class="btn btn-dark btn-sm" OnClick="btnAgregar_Click" Text="Agregar tipo"/>
      </div>

    <table class="table table-striped mt-5" style="background-color:#b6d1d4;text-align:center  ">
  <thead class="thead-dark">
     
    <tr>
      <th scope="col">Tipo</th>
      <th scope="col">Eliminar</th>     

    </tr>
  </thead>
  <tbody>
      <% foreach (dominio.Tipo item in listaTipos)
            {%>
      <tr>
      <td><% = item.Nombre %> </td>
      <td><a href="AgregarTipo.aspx?id=<% = item.IdTipo%>&c=d" class="btn btn-danger btn-sm">Eliminar</a>  
      
    </tr>
       <% } %>
      </tbody>
        </table>


</asp:Content>

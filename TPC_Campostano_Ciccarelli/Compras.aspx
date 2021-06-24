<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Compras.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.Compras1" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  
    <div class="container" style="margin-top: 3rem;">
        <% foreach (dominio.Compra item in lista)
            {%>
                        <h5>ID Compra</h5>
                        <td><% = item.IdCompra %></td>
                        <h5>Fecha</h5>
                        <td><% = item.Fecha %></td>

        <% } %>

            </div>
       

</asp:Content>
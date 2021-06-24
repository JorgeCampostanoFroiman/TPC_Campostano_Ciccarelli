<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Venta.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.Venta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div style="margin-top:50px;text-align:center">
      <h1>REGISTRO DE VENTAS</h1> 
      <a class="btn btn-primary btn-lg" href="RegistrarVenta.aspx" role="button">Registrar una venta</a>
      </div>

    <table class="table table-striped mt-5" style="background-color:#16a085 ">
  <thead class="thead-dark">
     
    <tr>
      <th scope="col">#</th>
      <th scope="col">Fecha</th>
      <th scope="col">Cliente</th>
      <th scope="col">Tipo factura</th>
      <th scope="col">Metodo pago</th>

    </tr>
  </thead>
  <tbody>
      <tr>
      <th scope="row">1</th>
      <td>24/07/2020</td>
      <td>Otto</td>
      <td>Factura A</td>
      <td>Mercado Pago</td>
    </tr>
      <tr>
      <th scope="row">2</th>
      <td>28/07/2020</td>
      <td>Otto</td>
      <td>Factura B</td>
      <td>Transferencia bancaria</td>
    </tr>
      
      </tbody>
        </table>
    <!--  <asp:Repeater runat="server" ID="repetidorventas" >
                    <ItemTemplate>
                        <tr>
                            <th scope="row"><h2>Numero de venta</h2></th>
                            <td><h2>00/00/0000</h2></td>
                            <td><h2>Ene Ene</h2></td>
                            <td><h2>$0,00000</h2><td> 
                            
                       </tr>
                    </ItemTemplate>
                </asp:Repeater> -->


</asp:Content>

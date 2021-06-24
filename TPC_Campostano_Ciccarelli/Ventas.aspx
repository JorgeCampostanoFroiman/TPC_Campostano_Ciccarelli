<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
      <div style="margin-top:50px;text-align:center">
      <h1>REGISTRO DE VENTAS</h1> 
      <a class="btn btn-primary btn-lg" href="RegistrarCompra.aspx" role="button">Registrar una venta</a>
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
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
      <td>Otto</td>
    </tr>
      <tr>
      <th scope="row">2</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
      <td>Otto</td>
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
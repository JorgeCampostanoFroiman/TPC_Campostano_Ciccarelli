<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleVenta.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.DetalleVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="Estilos/login.css" rel="stylesheet" type="text/css" />
    
                        

    <body class="main-bg">
        <div class="login-container text-c animated flipInX">
                                  
                    <p class="text-black">Detalle de la Venta</p>
                <div class="container-content">
                    <form class="margin-t">
                        <div class="form-group" style="text-align:center">
                             <p class="form-button"><asp:Label runat="server" ID="labelIdVenta"></asp:Label></p>
                       <p class="form-button"><asp:Label runat="server" ID="labelIdClienteVenta"></asp:Label></p>
                        <p class="form-button"><asp:Label runat="server" ID="labelTipoFacturaVenta"></asp:Label></p>
                        <p class="form-button"><asp:Label runat="server" ID="labelFechaVenta"></asp:Label></p>
                        <p class="form-button"><asp:Label runat="server" ID="labelImporteVenta"></asp:Label></p>
                        <p class="form-button"><asp:Label runat="server" ID="labelMetodoPagoVenta"></asp:Label></p>
                        <p class="form-button"><asp:Label runat="server" ID="labelIdUsuarioVenta"></asp:Label></p>
                        </div>
                        <a class="btn btn-dark btn-sm" style="margin-top:10px" href="Ventas.aspx">Regresar a Ventas!</a>
                    </form>
                    <p class="margin-t text-whitesmoke"><small> Comercio Equis &copy; 2021</small> </p>


                </div>



            </div>
        
            
            <table class="table table-dark table-striped mt-5" style="text-align:center">
  <thead class="thead-dark">
     <tr>
                   <th style="text-align:center"><h3>Detalle de productos</h3> </th> 
                </tr>
    <tr>
      <th scope="col">Codigo</th>
      <th scope="col">Nombre</th>
      <th scope="col">Cantidad</th>
      <th scope="col">Subtotal</th>

        

    </tr>
  </thead>
             <tbody>

                <asp:Repeater runat="server" ID="repetidor" >
                    <ItemTemplate>
                        <tr>
                            <th scope="row"><%#Eval("ItemArt.Codigo")%></th>
                            <td><%#Eval("ItemArt.NombreProducto")%></td>
                            <td>
                                <%#Eval("Cantidad") %>        
                            </td>
                            <td>
                                $<%#Eval("Subtotal") %>
                            </td>
                       </tr>
                    </ItemTemplate>
                </asp:Repeater>
                        
           </tbody>
        </table>
        
</body>
    

    



</asp:Content>

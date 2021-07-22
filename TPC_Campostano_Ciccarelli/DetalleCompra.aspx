<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleCompra.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.DetalleCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Estilos/login.css" rel="stylesheet" type="text/css" />
    
                        

    <body class="main-bg">
        <div class="login-container text-c animated flipInX">
                                  
                    <p class="text-black">Detalle de la compra</p>
                <div class="container-content">
                    <form class="margin-t">
                        <div class="form-group" style="text-align:center">
                       <p class="form-button"><asp:Label runat="server" ID="labelIdCompra"></asp:Label></p>
                        <p class="form-button"><asp:Label runat="server" ID="labelMetodoPago"></asp:Label></p>
                        <p class="form-button"><asp:Label runat="server" ID="labelProveedor"></asp:Label></p>
                        <p class="form-button"><asp:Label runat="server" ID="labelFecha"></asp:Label></p>
                        <p class="form-button"><asp:Label runat="server" ID="labelImporte"></asp:Label></p>
                        </div>
                        <a class="btn btn-dark btn-sm" style="margin-top:10px" href="AgregarProveedor.aspx"">Regresar a Compras!</a>
                    </form>
                    <p class="margin-t text-whitesmoke"><small> Comercio Equis &copy; 2021</small> </p>
                </div>
            </div>
</body>

    <table class="table table-striped mt-5" style="background-color:#b6d1d4 ">
  <thead class="thead-dark">
     
    <tr>
      <th scope="col">Codigo</th>
      <th scope="col">Nombre</th>
      <th scope="col">Cantidad</th>
      <th scope="col">Precio Unitario</th>
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
                            <td>$<%#Eval("ItemArt.precioCompra")%></td>
                            <td>
                                $<%#Eval("Subtotal") %>
                            </td>
                            </td>
                            
                       </tr>
                    </ItemTemplate>
                </asp:Repeater>
                        
           </tbody>
        </table>



</asp:Content>

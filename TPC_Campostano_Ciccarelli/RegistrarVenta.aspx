<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarVenta.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.RegistrarVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server"><link href="Estilos/login.css" rel="stylesheet" type="text/css" />




    <body class="main-bg">
        <div class="login-container text-c animated flipInX">
                                  
                    <p class="text-black">Este es el formulario para registrar una Venta realizada!!!</p>
            
                <div class="container-content">
                    <form class="margin-t">
                        <div class="form-group" style="text-align:center">

                            <asp:TextBox class="form-control" ID="txtFechaVenta" OnInit="txtFechaVenta_Init" runat="server"  Width="180px" Enabled="false" />
        
                            <asp:Calendar ID="CalendarioVenta" runat="server"  TargetControlID="txtFechaVenta" OnSelectionChanged="CalendarioVenta_SelectionChanged"  Width="360px">
         </asp:Calendar>
         
                            
                       <p class="form-button" style="margin-top:10px"><asp:Label runat="server" Text="Cliente"></asp:Label></p>
                       <asp:DropDownList class="form-control" runat="server" ID="DDLListaCliente" OnInit="DDLListaCliente_Init" ></asp:DropDownList>

                            <p class="form-button" style="margin-top:10px"><asp:Label runat="server" Text="Factura"></asp:Label></p>
                             <asp:DropDownList class="form-control" runat="server" ID="ListaTipoFactura"> </asp:DropDownList>

                            <p class="form-button" style="margin-top:10px"><asp:Label runat="server" Text="Metodo de Pago"></asp:Label></p>
                            <asp:DropDownList class="form-control" runat="server" ID="ListaMetodoVenta" > </asp:DropDownList>

                            <p class="form-button" style="margin-top:10px"><asp:Label runat="server" Text="Productos"></asp:Label></p>
                            <asp:DropDownList class="form-control" runat="server" ID="ListaProductoVenta" > </asp:DropDownList>

                            <p class="form-button" style="margin-top:10px"><asp:Label runat="server" Text="Cantidad"></asp:Label></p>
                            <asp:TextBox class="form-control"  runat="server" ID="CantidadProductoVenta" MaxLength="8" EnableViewState="True"  Text="0"></asp:TextBox>
                            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ValidationExpression="[0-9]+" ControlToValidate="CantidadProductoVenta" ErrorMessage="Solo numeros"></asp:RegularExpressionValidator>
             
                        </div>
                        <asp:Button runat="server" ID="AgregarProductoEnVenta" OnClick="AgregarProductoEnVenta_Click" class="btn btn-dark btn-sm"  Text="Agrega Producto a la venta"/>
        
                        
                    </form>
                    <p class="margin-t text-whitesmoke"><small> Comercio Equis &copy; 2021</small> </p>
                </div>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ErrorMessage="Required" ControlToValidate="CantidadProductoVenta"></asp:RequiredFieldValidator>

            
            </div>
            <div style="text-align:center">
             <table class="table table-striped mt-5" style="background-color:#b6d1d4 ">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Codigo</th>
      <th scope="col">Nombre</th>
      <th scope="col">Cantidad</th>
      <th scope="col">Stock Actual</th>
      <th scope="col">Precio Unitario</th>
      <th scope="col">Subtotal</th>
      <th scope="col">Eliminar</th>
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
                                <%#Eval("ItemArt.Stock") %>        
                            </td>
                            <td>$<%#Eval("ItemArt.precioCompra")%></td>
                            <td>
                                $<%#Eval("Subtotal") %>
                                
                            </td>
                            <td><a href="RegistrarVenta.aspx?id=<%#Eval("ItemArt.IdProducto")%>&c=d" class="btn btn-danger btn-sm">Eliminar</a>
                            </td>
                       </tr>
                    </ItemTemplate>
                </asp:Repeater>   
           </tbody>
        </table></div>
</body>
        <div style="text-align:center">
        <asp:Button runat="server" class="btn btn-dark btn-sm"  ID="GuardarVenta" OnClick="GuardarVenta_Click" Text="Guarda Venta" />
            <asp:Label runat="server" ID="TextoAlerta"></asp:Label>
            </div>
    <asp:Label runat="server" ID="StockAgotado"></asp:Label>
 
       
    
</asp:Content>

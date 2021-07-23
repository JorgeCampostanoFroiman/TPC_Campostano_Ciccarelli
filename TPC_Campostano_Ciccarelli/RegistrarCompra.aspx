<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarCompra.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.RegistrarCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
  <link href="Estilos/login.css" rel="stylesheet" type="text/css" />

<body class="main-bg">
        <div class="login-container text-c animated flipInX" style="text-align:center">
                                  
                    <p class="text-black">Este es el formulario para registrar una compra realizada!!!</p>
                <div class="container-content">
                    <asp:TextBox class="form-control" ID="txtFechaFactura" runat="server"  Width="180px" Enabled="false" OnInit="txtFechaFactura_Init" />
                    
         <asp:Calendar Width="360px" ID="Calendar1" runat="server"  TargetControlID="txtFechaFactura" OnSelectionChanged="Calendar1_SelectionChanged">
         </asp:Calendar>
                    <form class="margin-t">
                        <div class="form-group" style="text-align:center">
                            
                            <p class="form-button" style="margin-top:10px"><asp:Label runat="server" Text="Proveedor"></asp:Label></p>
                            <asp:DropDownList class="form-control" runat="server" ID="ListaProveedor" OnSelectedIndexChanged ="ListaProveedor_SelectedIndexChanged" OnInit="ListaProveedor_Init" AutoPostBack="True"> </asp:DropDownList>

                            <p class="form-button" style="margin-top:10px"><asp:Label runat="server" Text="Metodo de Pago"></asp:Label></p>
                            <asp:DropDownList class="form-control" runat="server" ID="ListaMetodo" OnInit="ListaMetodo_Init"> </asp:DropDownList>

                            <p class="form-button" style="margin-top:10px"><asp:Label runat="server" Text="Productos"></asp:Label></p>
                            <asp:DropDownList class="form-control" runat="server" OnInit="ListaProductoCompra_Init" ID="ListaProductoCompra" > </asp:DropDownList>


                            
    <p class="form-button" style="margin-top:10px"><asp:Label runat="server" Text="Cantidad"></asp:Label></p>
    <asp:TextBox class="form-control" runat="server" ID="CantidadProducto" MaxLength="8" EnableViewState="True"  Text="0"></asp:TextBox>
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ValidationExpression="[0-9]+" ControlToValidate="CantidadProducto" ErrorMessage="Solo numeros"></asp:RegularExpressionValidator>

                        </div>
                        <asp:Button runat="server" ID="AgregarProductoEnCompra" class="btn btn-dark btn-sm" OnClick="AgregarProductoEnCompra_Click" Text="Agrega Producto a la compra"/>

                    </form>
                    <p class="margin-t text-whitesmoke"><small> Comercio Equis &copy; 2021</small> </p>
                </div>
            
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ErrorMessage="Required" ControlToValidate="CantidadProducto"></asp:RequiredFieldValidator>


            
            </div>

    <table class="table table-striped mt-5" style="background-color:#b6d1d4 ">
  <thead class="thead-dark">
     
    <tr>
      <th scope="col">Codigo</th>
      <th scope="col">Nombre</th>
      <th scope="col">Cantidad</th>
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
                            <td>$<%#Eval("ItemArt.precioCompra")%></td>
                            <td>
                                $<%#Eval("Subtotal") %>
                            </td>
                            <td><a href="RegistrarCompra.aspx?id=<%#Eval("ItemArt.IdProducto")%>&c=d" class="btn btn-danger btn-sm">Eliminar</a>
                            </td>
                            
                       </tr>
                    </ItemTemplate>
                </asp:Repeater>
                        
           </tbody>
        </table>
    <div style="text-align:center">
        <asp:Button runat="server"  ID="GuardarCompra" class="btn btn-dark btn-sm" Text="Guarda Compra" OnClick="GuardarCompra_Click" />
        <asp:Label runat="server" ID="textoAlerta"></asp:Label>
    </div>
    
       <asp:TextBox runat="server" ID="VERFECHA" Visible="false"></asp:TextBox>
</body>

</asp:Content>

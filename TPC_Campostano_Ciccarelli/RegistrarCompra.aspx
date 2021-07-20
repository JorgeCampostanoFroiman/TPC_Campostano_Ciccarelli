<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarCompra.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.RegistrarCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
   <div style="text-align:center;align-items:center">
    
    <h1 style="margin-top:50px"> Este es el formulario para registrar una compra realizada!!!  </h1>

    
       <!--  Proveedor           -->
  <div class="form-group row" style="margin-top:40px">
    <label for="inputEmail3" class="col-sm-2 col-form-label">Proveedor</label>
    <div class="col-sm-10">
      <asp:DropDownList runat="server" ID="ListaProveedor" OnSelectedIndexChanged ="ListaProveedor_SelectedIndexChanged" OnInit="ListaProveedor_Init" AutoPostBack="True"> </asp:DropDownList>
        
    </div>
  </div>
        <!--  MetodoPago           -->
        <div class="form-group row" style="margin-top:40px">
    <label for="inputEmail3" class="col-sm-2 col-form-label">MetodoPago</label>
    <div class="col-sm-10">
      <asp:DropDownList runat="server" ID="ListaMetodo" OnInit="ListaMetodo_Init"> </asp:DropDownList>
    </div>
  </div>
        <!--  Fecha -->
        <asp:TextBox ID="txtFechaFactura" runat="server"  Width="180px" Enabled="false" OnInit="txtFechaFactura_Init" />
        <asp:Button runat="server" OnClick="Unnamed_Click" />
         <asp:Calendar ID="Calendar1" runat="server"  TargetControlID="txtFechaFactura" OnSelectionChanged="Calendar1_SelectionChanged"  Visible="false">
         </asp:Calendar>

        <!--  Producto           -->
        <div class="form-group row" style="margin-top:40px">
    <label for="inputEmail3" class="col-sm-2 col-form-label">Productos</label>
    <div class="col-sm-10">
      <asp:DropDownList runat="server" ID="ListaProductoCompra" > </asp:DropDownList>
    </div>
  </div>
       
          <!--  Cantidad           -->
        <div id="cantidad">
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ErrorMessage="Required" ControlToValidate="CantidadProducto"></asp:RequiredFieldValidator>
    <asp:Label runat="server" ID="label2"> Cantidad:</asp:Label>
    <asp:TextBox runat="server" ID="CantidadProducto" MaxLength="8" EnableViewState="True"  Text="0"></asp:TextBox>
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ValidationExpression="[0-9]+" ControlToValidate="CantidadProducto" ErrorMessage="Solo numeros"></asp:RegularExpressionValidator>
    </div>

        

         <div class="form-group row">
    <div class="col-sm-10" style="margin-top:5px">
           <asp:Button runat="server" ID="AgregarProductoEnCompra" class="btn btn-primary" OnClick="AgregarProductoEnCompra_Click" Text="Agrega Producto a la compra"/>

    </div>
  </div>
        <div style="margin-top:50px;text-align:center">
      <h1>Productos de la compra</h1> 
      </div>

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
                            
                       </tr>
                    </ItemTemplate>
                </asp:Repeater>
                        
           </tbody>
        </table>
 <asp:Button runat="server" ID="GuardarCompra" class="btn btn-primary" Text="Guarda Compra" OnClick="GuardarCompra_Click" />
       <asp:TextBox runat="server" ID="VERFECHA"></asp:TextBox>
    </div>

</asp:Content>

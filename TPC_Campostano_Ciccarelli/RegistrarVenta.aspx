<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarVenta.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.RegistrarVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

       
    <div style="text-align:center;align-items:center">
    
    <h1 style="margin-top:50px"> Este es el formulario para registrar una Venta realizada!!!  </h1>

    
  </div>
        <!--  Cliente           -->
        <div class="form-group row" style="margin-top:40px">
            <label for="inputEmail3" class="col-sm-2 col-form-label">Cliente</label>
            <div class="col-sm-10">
                <asp:DropDownList runat="server" ID="DDLListaCliente" OnInit="DDLListaCliente_Init" ></asp:DropDownList>
        </div>
           </div>


        <!--  MetodoPago           -->
        <div class="form-group row" style="margin-top:40px">
    <label for="inputEmail3" class="col-sm-2 col-form-label">MetodoPago</label>
    <div class="col-sm-10">
      <asp:DropDownList runat="server" ID="ListaMetodoVenta" > </asp:DropDownList>
    </div>
  </div>

        <!--  TipoFactura  -->
        <div class="form-group row" style="margin-top:40px">
    <label for="inputEmail3" class="col-sm-2 col-form-label">Tipo Factura</label>
    <div class="col-sm-10">
      <asp:DropDownList runat="server" ID="ListaTipoFactura"> </asp:DropDownList>
    </div>
  </div>

        <!--  Fecha  -->
        <asp:TextBox ID="txtFechaVenta" OnInit="txtFechaVenta_Init" runat="server"  Width="180px" Enabled="false" />
        <asp:Button runat="server" ID="btnCalendarioVenta" OnClick="btnCalendarioVenta_Click"/>
         <asp:Calendar ID="CalendarioVenta" runat="server"  TargetControlID="txtFechaVenta" OnSelectionChanged="CalendarioVenta_SelectionChanged" Visible="false">
         </asp:Calendar>






        <!--  Producto           -->
        <div class="form-group row" style="margin-top:40px">
    <label for="inputEmail3" class="col-sm-2 col-form-label">Productos</label>
    <div class="col-sm-10">
      <asp:DropDownList runat="server" ID="ListaProductoVenta" > </asp:DropDownList>
    </div>
  </div>
        <!--  Cantidad           -->
        <div id="cantidad">
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ErrorMessage="Required" ControlToValidate="CantidadProductoVenta"></asp:RequiredFieldValidator>
    <asp:Label runat="server" ID="label2"> Cantidad:</asp:Label>
    <asp:TextBox runat="server" ID="CantidadProductoVenta" MaxLength="8" EnableViewState="True"  Text="0"></asp:TextBox>
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ValidationExpression="[0-9]+" ControlToValidate="CantidadProductoVenta" ErrorMessage="Solo numeros"></asp:RegularExpressionValidator>
    </div>
    </div>

    <div class="form-group row">
    <div class="col-sm-10" style="margin-top:5px">
           <asp:Button runat="server" ID="AgregarProductoEnVenta" OnClick="AgregarProductoEnVenta_Click" class="btn btn-primary" Text="Agrega Producto a la venta"/>

    </div>
  </div>
        <div style="margin-top:50px;text-align:center">
      <h1>Productos de la venta</h1> 
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
 <asp:Button runat="server" ID="GuardarVenta" class="btn btn-primary" OnClick="GuardarVenta_Click" Text="Guarda Venta" />
       <asp:TextBox runat="server" ID="VERFECHA"></asp:TextBox>
    </div>



</asp:Content>

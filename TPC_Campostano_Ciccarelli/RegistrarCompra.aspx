<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarCompra.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.RegistrarCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div style="text-align:center;align-items:center">
    
    <h1 style="margin-top:50px"> Este es el formulario para registrar una compra realizada!!!  </h1>

    
       <!--  Proveedor           -->
  <div class="form-group row" style="margin-top:40px">
    <label for="inputEmail3" class="col-sm-2 col-form-label">Proveedor</label>
    <div class="col-sm-10">
      <asp:DropDownList runat="server" ID="ListaProveedor" OnSelectedIndexChanged ="ListaProveedor_SelectedIndexChanged" OnInit="ListaProveedor_Init"> </asp:DropDownList>
        <asp:Button runat="server" />
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
      <asp:DropDownList runat="server" ID="ListaProductoCompra"> </asp:DropDownList>
    </div>
  </div>

        <!--
  <div class="form-group row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">Fecha</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Fecha">
    </div>
  </div>
  -->
        <asp:TextBox ID="txt1" runat="server"  Width="180px"  />


         <asp:TextBox ID="txt2" runat="server"  Width="180px" />
    
  
  <div class="form-group row">
    <div class="col-sm-10" style="margin-top:5px">
      <button type="submit" class="btn btn-primary">Realizado!</button>
    </div>
  </div>


    </div>

</asp:Content>

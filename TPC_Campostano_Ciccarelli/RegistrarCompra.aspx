<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarCompra.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.RegistrarCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div style="text-align:center;align-items:center">
    
    <h1 style="margin-top:50px"> Este es el formulario para registrar una compra realizada!!!  </h1>

    <form>
       <!--  Proveedor           -->
  <div class="form-group row" style="margin-top:40px">
    <label for="inputEmail3" class="col-sm-2 col-form-label">Proveedor</label>
    <div class="col-sm-10">
      <asp:DropDownList runat="server" ID="ListaProveedor"> </asp:DropDownList>
    </div>
  </div>
        <!--  MetodoPago           -->
        <div class="form-group row" style="margin-top:40px">
    <label for="inputEmail3" class="col-sm-2 col-form-label">MetodoPago</label>
    <div class="col-sm-10">
      <asp:DropDownList runat="server" ID="ListaMetodo"> </asp:DropDownList>
    </div>
  </div>
        <!--  Fecha -->
        <asp:TextBox ID="txtFechaFactura" runat="server" Width="180px" Enabled="false"  />
        <asp:Button runat="server" OnClick="Unnamed_Click"/>
       

         <asp:Calendar ID="Calendar1" runat="server" TargetControlID="txtFechaFactura" Format="dd/MM/yyyy" OnSelectionChanged="Calendar1_SelectionChanged">
         </asp:Calendar>

  <div class="form-group row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">Fecha</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Fecha">
    </div>
  </div>
  

    
    <div class="custom-file">
    <input type="file" class="custom-file-input" id="customFileLang" lang="es">
    <label class="custom-file-label" for="customFileLang">Seleccionar Producto</label>
    </div>
  <div class="form-group row">
    <div class="col-sm-10" style="margin-top:5px">
      <button type="submit" class="btn btn-primary">Realizado!</button>
    </div>
  </div>
</form>

    </div>

</asp:Content>

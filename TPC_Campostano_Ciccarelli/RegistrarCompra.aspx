<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarCompra.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.RegistrarCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div style="text-align:center;align-items:center">
    
    <h1 style="margin-top:50px"> Este es el formulario para registrar una compra realizada!!!  </h1>

    <form>
  <div class="form-group row" style="margin-top:40px">
    <label for="inputEmail3" class="col-sm-2 col-form-label">Proveedor</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" id="inputEmail3" placeholder="Proveedor">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">Fecha</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Fecha">
    </div>
  </div>
  
        <fieldset class="form-group">
    <div class="row">
      <legend class="col-form-label col-sm-2 pt-0">Método de pago</legend>
      <div class="col-sm-10">
        <div class="form-check">
          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
          <label class="form-check-label" for="gridRadios1">
            Efectivo
          </label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
          <label class="form-check-label" for="gridRadios2">
            Tarjeta
          </label>
        </div>
        <div class="form-check disabled">
          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios3" value="option3" 
          <label class="form-check-label" for="gridRadios3">
            Transferencia
          </label>
        </div>
      </div>
    </div>
  </fieldset>

    
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

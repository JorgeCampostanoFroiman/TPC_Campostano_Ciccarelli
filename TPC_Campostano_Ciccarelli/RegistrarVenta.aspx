<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarVenta.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.RegistrarVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

       
    <div style="text-align:center;align-items:center">
    
    <h1 style="margin-top:50px"> Este es el formulario para registrar una Venta realizada!!!  </h1>

     <!--  Comprador           -->
  <div class="form-group row" style="margin-top:40px">
    <label for="inputEmail3" class="col-sm-2 col-form-label">Cliente</label>
    <div class="col-sm-10">
      <asp:DropDownList runat="server" ID="ListaCliente"> </asp:DropDownList>
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

        <fieldset class="form-group">
    <div class="row">
      <legend class="col-form-label col-sm-2 pt-0">Tipo de factura</legend>
      <div class="col-sm-10">
        <div class="form-check">
          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios4" value="option1" checked>
          <label class="form-check-label" for="gridRadios1">
            Factura A
          </label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios5" value="option2">
          <label class="form-check-label" for="gridRadios2">
            Factura B
          </label>
        </div>
        <div class="form-check disabled">
          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios6" value="option3" 
          <label class="form-check-label" for="gridRadios3">
            Factura C
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

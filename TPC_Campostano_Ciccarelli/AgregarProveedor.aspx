<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarProveedor.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.AgregarProveedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-top:50px;text-align:center">
      <h1>LOS PROVEEDORES   </h1> 
      
      </div>

    <table class="table table-striped mt-5" style="background-color:#b6d1d4;text-align:center  ">
  <thead class="thead-dark">
     
    <tr>
      <th scope="col">Razón social</th>
      <th scope="col">Modificar</th>
      <th scope="col">Eliminar</th>     

    </tr>
  </thead>
  <tbody>
      <% foreach (dominio.Proveedor item in listaProveedores)
            {%>
      <tr>
      <td><% = item.RazonSocialProveedor %> </td>
      <td><a href="ModifProveedor.aspx?id=<% = item.IdProveedor%>" class="btn btn-dark btn-sm">Modificar datos</a></td>
      <td><a href="AgregarProveedor.aspx?id=<% = item.IdProveedor%>&c=d" class="btn btn-danger btn-sm">Eliminar</a>  
      
    </tr>
       <% } %>
      </tbody>
        </table>

    <div>




        <div class="form-group" id="Razon Social">
        <asp:RequiredFieldValidator runat="server" ID="RFV1" ErrorMessage="Required" ControlToValidate="textRazonSocial" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" ID="textRazonSocial" MaxLength="80" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
        <asp:Label runat="server" ID="labelRazonSocial"> Razon social </asp:Label>
        <asp:RegularExpressionValidator runat="server" ID="ValidarCodigo" ValidationExpression="[a-zA-Z0-9]+" ControlToValidate="textRazonSocial" ErrorMessage="Solo letras y números"></asp:RegularExpressionValidator>
        </div>
        
        <div class="form-group" id="Cuit">
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ErrorMessage="Required" ControlToValidate="txtCuit" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" ID="txtCuit" MaxLength="12" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
        <asp:Label runat="server" ID="labelCuit"> Cuit </asp:Label>
        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ValidationExpression="[0-9]+" ControlToValidate="txtCuit" ErrorMessage="Solo números"></asp:RegularExpressionValidator>
        </div>
        
        <div class="form-group"  id="domicilio">
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ErrorMessage="Required" ControlToValidate="txtDomicilio" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" ID="txtDomicilio" MaxLength="80" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
        <asp:Label runat="server" ID="label1"> Domicilio </asp:Label>
        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ValidationExpression="[a-zA-Z0-9]+" ControlToValidate="txtDomicilio" ErrorMessage="Solo letras y números"></asp:RegularExpressionValidator>
        </div>

        <div class="form-group" id="telefono">
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ErrorMessage="Required" ControlToValidate="txtTelefono" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" ID="txtTelefono" MaxLength="12" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
        <asp:Label runat="server" ID="label2"> Telefono </asp:Label>
        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ValidationExpression="[0-9]+" ControlToValidate="txtTelefono" ErrorMessage="Solo números"></asp:RegularExpressionValidator>
        </div>
       
        <div class="form-group" id="Email">
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ErrorMessage="Required" ControlToValidate="txtEmail" ForeColor="#CC3300" Display="Static"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" ID="txtEmail" MaxLength="120" EnableViewState="True" AutoPostBack="False"></asp:TextBox>
        <asp:Label runat="server" ID="label3"> Email </asp:Label>
        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator4" ControlToValidate="txtEmail" ValidationExpression="[a-zA-Z0-9]+" ErrorMessage="Solo números"></asp:RegularExpressionValidator>
        </div>
        

        <asp:Button runat="server" ID="btnAgregarProv" OnClick="btnAgregarProv_Click" Text="Agregar Proveedor"/>

    </div>
</asp:Content>

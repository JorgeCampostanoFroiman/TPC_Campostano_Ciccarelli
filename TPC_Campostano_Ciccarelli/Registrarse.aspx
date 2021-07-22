<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.Registrarse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <link href="Estilos/login.css" rel="stylesheet" type="text/css" />
       <div class="login-container text-c animated flipInX">
                                  
                   
                <div class="container-content">
                    <form class="margin-t">
                        <div class="form-group">
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" ErrorMessage="Required" ControlToValidate="textoDNI" Display="Static"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" style="text-align:center" id="textoDNI" placeholder="DNI" class="form-control" MaxLength="8" /> 
                        </div>
                        <div class="form-group">
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ErrorMessage="Required" ControlToValidate="textoNombre" Display="Static"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" style="text-align:center" id="textoNombre" MaxLength="40" placeholder="Nombre" class="form-control" /> 
                        </div>
                        <div class="form-group">
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ErrorMessage="Required" ControlToValidate="textoApellido" Display="Static"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" style="text-align:center" id="textoApellido" MaxLength="100" placeholder="Apellido" class="form-control" /> 
                        </div>
                        <div class="form-group">
                            <div><asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3"  ControlToValidate="textoTelefono" ErrorMessage="Required" Enabled="false" ></asp:RegularExpressionValidator></div>
                            <asp:TextBox runat="server" style="text-align:center" id="textoTelefono" MaxLength="20" placeholder="Telefono" class="form-control" /> 
                        </div>
                        <div class="form-group">
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ErrorMessage="Required" ControlToValidate="textoEmail" Display="Static"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" style="text-align:center" id="textoEmail" MaxLength="80" placeholder="Email" class="form-control" /> 
                        </div>
                        <div class="form-group">
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ErrorMessage="Required" ControlToValidate="textoContraseña" Display="Static"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" style="text-align:center" id="textoContraseña" placeholder="Contraseña" class="form-control" /> 
                            
                        </div>
                        <asp:Button runat="server" type="submit" class="btn btn-dark btn-sm" Text="Registrarse" OnClick="Unnamed_Click"></asp:Button>
                         <a href="Ingreso.aspx" class="btn btn-dark btn-sm">¿Ya tenes una cuenta? Logueate!</a>
                    </form>
                    <p class="margin-t text-whitesmoke"><small> Comercio Equis &copy; 2021</small> </p>
                </div>
            </div>
    
    <div style="text-align:center">
        <asp:Label runat="server" ID="usuarioAgregado" ></asp:Label>
            <div><asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator6" ValidationExpression="[0-9]+" ControlToValidate="textoTelefono" ErrorMessage="El telefono solo puede contener numeros"></asp:RegularExpressionValidator></div>
            <div><asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator7" ValidationExpression="[a-zA-Z -]+" ControlToValidate="textoNombre" ErrorMessage="El nombre solo puede tener letras" ></asp:RegularExpressionValidator></div>
            <div><asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ValidationExpression="[a-zA-Z -]+" ControlToValidate="textoApellido" ErrorMessage="El apellido solo puede tener letras" ></asp:RegularExpressionValidator></div>
            <div><asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ValidationExpression="[a-zA-Z0-9]+" ControlToValidate="textoContraseña" ErrorMessage="La contraseña debe tener de 8 a 16 dígitos" ></asp:RegularExpressionValidator></div>
            <div> <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator8" ValidationExpression="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" ControlToValidate="textoEmail" ErrorMessage="Mail no válido"></asp:RegularExpressionValidator></div>
            <div> <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator9" ValidationExpression="[0-9]+" ControlToValidate="textoDNI" ErrorMessage="El DNI solo puede tener numeros"></asp:RegularExpressionValidator></div>
           </div>

</asp:Content>

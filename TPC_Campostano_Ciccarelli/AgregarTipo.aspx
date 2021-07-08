<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarTipo.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.AgregarTipo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="verTipos">
    <asp:DropDownList runat="server" ID="DDLTipo"></asp:DropDownList>
        <asp:Button runat="server" ID="btnVerTipos" Text="Refrescar los tipos existentes" />
    </div>

    <div id="modificarTipo">
    <asp:DropDownList runat="server" ID="DDLTipo2"></asp:DropDownList>
        <asp:Button runat="server" ID="btnModificarTipo" OnClick="btnModificarTipo_Click" Text="Modificar el tipo seleccionado"/>
    </div>

    <div id="eliminarTipo">
    <asp:DropDownList runat="server" ID="DDLTipo3"></asp:DropDownList>
        <asp:Button runat="server" ID="btnEliminarTipo" OnClick="btnEliminarTipo_Click" Text="Eliminar el tipo seleccionado"/>
    </div>

    <div id="agregarTipo">
    <asp:TextBox runat="server" ID="textAgregarTipo"></asp:TextBox>
        <asp:Button runat="server" ID="btnAgregarTipo" OnClick="btnAgregarTipo_Click" Text="Agregar un tipo a la lista"/>
    </div>


</asp:Content>

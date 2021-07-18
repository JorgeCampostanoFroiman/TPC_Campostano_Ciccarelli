<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label Text="text" runat="server" ID="labelMensaje"></asp:Label>

    <div class="container" style="margin-top:3rem; width:30rem">
      <div class="card" style="width:26rem">
     <div class="alert alert-danger">
     <strong>Error!</strong> Se encontró un error en la página! Pero lo atrapamos!
    </div>
        </div>
    <div class="card-img"><asp:Image runat="server" ImageUrl="https://gamewith-en.akamaized.net/img/9b0ff46a0c29e3877199605a40ea512d.jpg"/> </div>
        </div>

        

</asp:Content>

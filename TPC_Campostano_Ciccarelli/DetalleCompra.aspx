<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleCompra.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.DetalleCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

       <div class="container" style="margin-top: 3rem; align-content: center">
                <div class="card" style="width: 60rem; text-align:center;" >
                    <div class="card-title" style="background-color:thistle">
                    <h2><asp:Label runat="server" Text="Detalle de la compra: "></asp:Label></h2> </div>
                    <div class="card-title" style="background-color:thistle"><h3><asp:Label runat="server" ID="labelIdCompra"></asp:Label></h3> </div>
                   
                    <div class="card-body" style="background-color:thistle">
                        
                        <p class="card-text"><asp:Label runat="server" ID="labelMetodoPago"></asp:Label></p>
                        <p class="card-text"><asp:Label runat="server" ID="labelProveedor"></asp:Label></p>
                        <p class="card-text"><asp:Label runat="server" ID="labelFecha"></asp:Label></p>
                        <p class="card-text"><asp:Label runat="server" ID="labelImporte"></asp:Label></p>
                        
                        

                    </div>
                </div>
            </div>
</asp:Content>

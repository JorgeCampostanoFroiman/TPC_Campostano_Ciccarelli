<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="TPC_Campostano_Ciccarelli.Producto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin-top: 3rem;">
        <div class="row">
         <!-- foreach (dominio.Articulo item in lista) -->
            
            <div class="col">
                <div class="card" style="width: 18rem; text-align:center" >
                   <!-- <img src="" class="card-img-top" alt="..." style="height: 18rem;"> -->
                    <div class="card-body" style="background-color:silver">
                        <h5 class="card-title"> NOMBRE</h5>
                        <p class="card-text">Código:  </p>
                        <p class="card-text">Descripción:  </p>
                        <p class="card-text">Precio:   </p>
                        <a href="DetalleArticulo.aspx?id= = " class="btn btn-primary">Ver Detalle</a>
                        </div>
                </div>
            </div>
</div>    </div>

    <!-- NO IRIAN ESTOS QUE SIGUEN, SOLO UNO CON FOREACH -->

    <div class="container" style="margin-top: 3rem;">
        <div class="row">
         <!-- foreach (dominio.Producto item in lista) -->
            
            <div class="col">
                <div class="card" style="width: 18rem; text-align:center" >
                   <!-- <img src="" class="card-img-top" alt="..." style="height: 18rem;"> -->
                    <div class="card-body" style="background-color:silver">
                        <h5 class="card-title"> NOMBRE</h5>
                        <p class="card-text">Código:  </p>
                        <p class="card-text">Descripción:  </p>
                        <p class="card-text">Precio:   </p>
                        <a href="DetalleArticulo.aspx?id= = " class="btn btn-primary">Ver Detalle</a>
                         </div>
                </div>
            </div>
</div>    </div>

    <div class="container" style="margin-top: 3rem;">
        <div class="row">
         <!-- foreach (dominio.Producto item in lista) -->
            
            <div class="col">
                <div class="card" style="width: 18rem; text-align:center" >
                   <!-- <img src="" class="card-img-top" alt="..." style="height: 18rem;"> -->
                    <div class="card-body" style="background-color:silver">
                        <h5 class="card-title"> NOMBRE</h5>
                        <p class="card-text">Código:  </p>
                        <p class="card-text">Descripción:  </p>
                        <p class="card-text">Precio:   </p>
                        <a href="DetalleArticulo.aspx?id= = " class="btn btn-primary">Ver Detalle</a>
                          </div>
                </div>
            </div>
</div>    </div>

</asp:Content>

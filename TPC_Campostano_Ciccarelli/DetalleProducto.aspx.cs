using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace TPC_Campostano_Ciccarelli
{
    public partial class DetalleProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                int id = int.Parse(Request.QueryString["id"]);
                List<Producto> listado = (List<Producto>)Session["ListaProductos"];
                Producto seleccionado = listado.Find(x => x.IdProducto == id);

                labelIdProducto.Text = "Id Producto: " + seleccionado.IdProducto;
                labelCodigo.Text = "Codigo: " + seleccionado.Codigo;
                labelNombreProducto.Text = "Nombre: " + seleccionado.NombreProducto;
                labelIdMarca.Text = "Marca: " + seleccionado.marca.Nombre;
                labelIdTipo.Text = "Tipo: " + seleccionado.tipo.Nombre;
                labelPrecioCompra.Text = "Precio Compra: " + seleccionado.precioCompra;
                labelStock.Text = "Stock: " + seleccionado.Stock;
                labelGanancia.Text = "Ganancia: " + seleccionado.Ganancia;
                labelPrecioVenta.Text = "Precio Venta: " + seleccionado.precioVenta;
                labelDescripcion.Text = "Descripcion: " + seleccionado.Descripcion;
                labelIdProveedor.Text = "Proveedor: " + seleccionado.proveedor.RazonSocialProveedor;
              


            }

            catch (Exception)
            {
                Response.Redirect("Error.aspx");
            }
        }
    }
}
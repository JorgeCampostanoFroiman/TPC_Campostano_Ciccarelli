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
    public partial class DetalleCompra : System.Web.UI.Page
    {
        public string codigoDetalleCompra;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //CodigoDetalle = Request.QueryString["CodigoDetalle"];
                int id = int.Parse(Request.QueryString["id"]);
                List<Compra> listado = (List<Compra>)Session["ListaCompras"];
                Compra seleccionado = listado.Find(x => x.IdCompra == id);

                labelIdCompra.Text = "Id compra: " + seleccionado.IdCompra;
                labelFecha.Text = "Fecha: " + seleccionado.Fecha;
                labelImporte.Text = "Importe: " + seleccionado.Importe;
                labelProveedor.Text = "Proveedor: " + Convert.ToString(seleccionado.proveedor);
                labelMetodoPago.Text = "Metodo de pago: " + Convert.ToString(seleccionado.metodoPago);
                /// labelIdListaProd = "Id Productos: " + Convert.ToString(seleccionado.listaProductos);



            }
            catch (Exception)
            {
                Response.Redirect("Error.aspx");
            }
        }
    }
}
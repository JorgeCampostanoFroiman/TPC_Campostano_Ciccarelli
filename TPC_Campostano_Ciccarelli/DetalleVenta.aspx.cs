using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace TPC_Campostano_Ciccarelli
{
    public partial class DetalleVenta : System.Web.UI.Page
    {
        public string codigoDetalleCompra;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //CodigoDetalle = Request.QueryString["CodigoDetalle"];
                int id = int.Parse(Request.QueryString["id"]);
                List<Venta> listado = (List<Venta>)Session["ListaVentas"];
                Venta seleccionado = listado.Find(x => x.IdVenta == id);

                labelIdVentaVenta.Text = "Id Venta: " + seleccionado.IdVenta;
                labelIdClienteVenta.Text = "Cliente: " + seleccionado.cliente.RazonSocial;
                labelTipoFacturaVenta.Text = "Factura: " + seleccionado.tipofactura.Nombre;
                labelFechaVenta.Text = "Fecha: " + seleccionado.Fecha;
                labelImporteVenta.Text = "Importe: " + seleccionado.Importe;
                labelMetodoPagoVenta.Text = "Metodo de Pago: " + seleccionado.metodoPago.Nombre;
                labelIdUsuarioVenta.Text = "Vendedor: " + seleccionado.usuario.Apellido;

            }
            catch (Exception)
            {
                Response.Redirect("Error.aspx");
            }
        }
    }

}
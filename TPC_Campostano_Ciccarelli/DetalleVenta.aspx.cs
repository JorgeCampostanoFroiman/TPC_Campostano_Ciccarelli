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
        public string codigoDetalleVenta;
        public List<ListaProductos> itemsListaVenta;
        ListaProductosNegocio listaNegocioVenta = new ListaProductosNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //CodigoDetalle = Request.QueryString["CodigoDetalle"];
                int id = int.Parse(Request.QueryString["id"]);
                List<Venta> listado = (List<Venta>)Session["ListaVentas"];
                Venta seleccionado = listado.Find(x => x.IdVenta == id);

                labelIdVenta.Text = "Id Venta: " + seleccionado.IdVenta;
                labelIdClienteVenta.Text = "Cliente: " + seleccionado.cliente.RazonSocial;
                labelTipoFacturaVenta.Text = "Factura: " + seleccionado.tipofactura.Nombre;
                labelFechaVenta.Text = "Fecha: " + seleccionado.Fecha;
                labelImporteVenta.Text = "Importe: " + seleccionado.Importe;
                labelMetodoPagoVenta.Text = "Metodo de Pago: " + seleccionado.metodoPago.Nombre;
                labelIdUsuarioVenta.Text = "Vendedor: " + seleccionado.usuario.Apellido;

                itemsListaVenta = listaNegocioVenta.ListarProductosVenta(seleccionado.IdVenta);

                repetidor.DataSource = itemsListaVenta;
                repetidor.DataBind();

            }
            catch (Exception)
            {
                Session.Add("Error", "Excepcion encontrada, pero la capturamos!");
                Response.Redirect("Error.aspx");
            }
        }
    }

}
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
    public partial class RegistrarVenta : System.Web.UI.Page
    {
        public List<Cliente> listaC;
        public List<MetodoPago> listaMPago;
        public List<Producto> listaProducto;
        public List<ListaProductos> itams;
        ListaProductos itam;
        ProductoNegocio productoNegocio = new ProductoNegocio();
        MetodoPagoNegocio metodoPagoNegocio = new MetodoPagoNegocio();
        TipoFacturaNegocio tipoFacturaNegocio = new TipoFacturaNegocio();
        ClienteNegocio clienteNegocio = new ClienteNegocio();

        public decimal total;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                itams = (List<ListaProductos>)Session["itemsVenta"];
                if (itams == null)
                    itams = new List<ListaProductos>();
                else
                {
                    repetidor.DataSource = itams;
                    repetidor.DataBind();
                }


                if (!IsPostBack)
                {
                    ListaProductoVenta.DataSource = productoNegocio.Listar();
                    ListaProductoVenta.DataTextField = "NombreProducto";
                    ListaProductoVenta.DataValueField = "IdProducto";
                    ListaProductoVenta.DataBind();


                    ListaMetodoVenta.DataSource = metodoPagoNegocio.Listar();
                    ListaMetodoVenta.DataTextField = "Nombre";
                    ListaMetodoVenta.DataValueField = "IdMetodoPago";
                    ListaMetodoVenta.DataBind();

                    ListaTipoFactura.DataSource = tipoFacturaNegocio.Listar();
                    ListaTipoFactura.DataTextField = "Nombre";
                    ListaTipoFactura.DataValueField = "IdTipoFactura";
                    ListaTipoFactura.DataBind();

                }

                itam = new ListaProductos();
            }
            catch (Exception)
            {
                Response.Redirect("Error.aspx");
            }
        }

        protected void CalendarioVenta_SelectionChanged(object sender, EventArgs e)
        {
            txtFechaVenta.Text = CalendarioVenta.SelectedDate.ToShortDateString();

            DateTime FechaCalendario = Convert.ToDateTime(txtFechaVenta.Text);
            String FechaCalendarioString = FechaCalendario.ToString("dd-MM-yyyy");
            txtFechaVenta.Text = FechaCalendarioString;
        }

        protected void btnCalendarioVenta_Click(object sender, EventArgs e)
        {
            try
            {
                if (CalendarioVenta.Visible == true)
                {
                    CalendarioVenta.Visible = false;
                }
                else
                {
                    CalendarioVenta.Visible = true;
                }
            }
            catch (Exception)
            {
                Response.Redirect("Error.aspx");
            }
        }

        protected void txtFechaVenta_Init(object sender, EventArgs e)
        {
            txtFechaVenta.Text = DateTime.Now.ToString("dd-MM-yyyy");
        }

        protected void DDLListaCliente_Init(object sender, EventArgs e) 
        {
                try
                {
                    ClienteNegocio clienteNegocio = new ClienteNegocio();
                    listaC = clienteNegocio.Listar();

                    ListItem i;
                    foreach (Cliente item in listaC)
                    {
                        i = new ListItem(item.RazonSocial.ToString(), item.IdCliente.ToString());
                        DDLListaCliente.Items.Add(i);
                    }
                }
                catch (Exception)
                {
                    Response.Redirect("Error.aspx");
                }
            }

        protected void AgregarProductoEnVenta_Click(object sender, EventArgs e)
        {
            DDLListaCliente.Enabled = false;
            ProductoNegocio negocio = new ProductoNegocio();
            List<Producto> listaActual = negocio.Listar();

            if (itams.Find(x => x.ItemArt.IdProducto.ToString() == ListaProductoVenta.SelectedItem.Value) != null)
            {
                ListaProductos elim = itams.Find(x => x.ItemArt.IdProducto.ToString() == ListaProductoVenta.SelectedItem.Value);
                itam.Cantidad = elim.Cantidad + Convert.ToInt32(CantidadProductoVenta.Text);
                itam.Subtotal = itam.Cantidad * elim.ItemArt.precioCompra;
                itam.ItemArt = elim.ItemArt;
                itams.Remove(elim);
                itams.Add(itam);
                repetidor.DataSource = itams;
                repetidor.DataBind();
                Session.Add("itemsVenta", itams);
            }
            else
            {
                itam.ItemArt = listaActual.Find(x => x.IdProducto.ToString() == ListaProductoVenta.SelectedItem.Value);
                itam.Cantidad = Convert.ToInt32(CantidadProductoVenta.Text);
                itam.Subtotal = Convert.ToDecimal(itam.Cantidad * itam.ItemArt.precioCompra);
                itams.Add(itam);
                repetidor.DataSource = itams;
                repetidor.DataBind();
                Session.Add("itemsVenta", itams);
            }
            foreach (ListaProductos item in itams)
            {
                total += item.Subtotal;
            }
            Session.Add("totalventa", total);
        }

        protected void GuardarVenta_Click(object sender, EventArgs e)
        {
            VentaNegocio negocio = new VentaNegocio();
            ListaProductosNegocio listaproducto = new ListaProductosNegocio();
            Venta venta = new Venta();
            decimal totalventas;

            // se trae los datos de total y los items

            totalventas = (decimal)Session["totalventa"];

            ///se agrega la venta
            venta.cliente = new Cliente();
            venta.cliente.IdCliente = int.Parse(DDLListaCliente.SelectedItem.Value);
            venta.Importe = totalventas;
            venta.metodoPago = new MetodoPago();
            venta.metodoPago.IdMetodoPago = int.Parse(ListaMetodoVenta.SelectedItem.Value);
            venta.Fecha = txtFechaVenta.Text;
            venta.tipofactura = new TipoFactura();
            venta.tipofactura.IdTipoFactura = int.Parse(ListaTipoFactura.SelectedItem.Value);
            /// venta usuario
            venta.usuario = new Usuario();
            if (Session["usuario"] != null)
            {

                venta.usuario = (Usuario)Session["usuario"];
            }
            else
            {
                venta.usuario.IdUsuario = 1;
            }



            negocio.AgregarVenta(venta);

            // fin de agregar compra





            //agrega lista de productos
            int ultimonumeroVenta;
            List<ListaProductos> itemsCompra = (List<ListaProductos>)Session["itemsVenta"];
            ultimonumeroVenta = negocio.NumeroVenta();
            listaproducto.AgregarListaVenta(itemsCompra, ultimonumeroVenta);

            foreach (ListaProductos item in itemsCompra)
            {
                listaproducto.QuitarStockVenta(item.Cantidad, item.ItemArt.IdProducto);
            }
            Session.Remove("itemsVenta");
        }
    }
}
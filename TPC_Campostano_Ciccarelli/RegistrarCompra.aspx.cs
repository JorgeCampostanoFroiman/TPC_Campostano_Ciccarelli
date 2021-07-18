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
    public partial class RegistrarCompra : System.Web.UI.Page
    {
        public List<Proveedor> listaP;
        public List<MetodoPago> listaMp;
        public List<Producto> listaproducto;
        public List<ListaProductos> items;
        ListaProductos iten;
        public decimal total;
        protected void Page_Load(object sender, EventArgs e)
        {

                try
                {
                items = (List<ListaProductos>)Session["items"];
                if (items == null)
                    items = new List<ListaProductos>();

                iten = new ListaProductos();
            }
                catch (Exception)
                {
                    Response.Redirect("Error.aspx");
                }
            
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtFechaFactura.Text = Calendar1.SelectedDate.ToShortDateString();

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            try
            {

                
                if (Calendar1.Visible == true)
                {
                    Calendar1.Visible = false;
                }
                else
                {
                    Calendar1.Visible = true;

                }
            }
            catch (Exception)
            {
                Response.Redirect("Error.aspx");
            }
        }

        protected void ListaProveedor_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListaProductoCompra.Items.Clear();
            int a;
            ProductoNegocio productoNegocio = new ProductoNegocio();

            a = Int32.Parse(ListaProveedor.Text);


            listaproducto = productoNegocio.ListarProductoPorIdProveedor(a);
            ListItem f;
            foreach (Producto item in listaproducto)
            {
                f = new ListItem('(' + item.Codigo.ToString() + ')' + ' ' + item.NombreProducto.ToString(), item.IdProducto.ToString());
                ListaProductoCompra.Items.Add(f);
            }
        }

        

        protected void txtFechaFactura_Init(object sender, EventArgs e)
        {
            txtFechaFactura.Text = DateTime.Now.ToString("dd/MM/yyyy");
        }

        protected void ListaProveedor_Init(object sender, EventArgs e)
        {
            try
            {
                ProveedorNegocio proveedorNegocio = new ProveedorNegocio();
                listaP = proveedorNegocio.Listar();

                ListItem i;
                foreach (Proveedor item in listaP)
                {
                    i = new ListItem(item.RazonSocialProveedor.ToString(), item.IdProveedor.ToString());
                    ListaProveedor.Items.Add(i);

                }
            }
            catch(Exception)
            {
                Response.Redirect("Error.aspx");
            }
        }

        protected void ListaMetodo_Init(object sender, EventArgs e)
        {
            try
            {
                MetodoPagoNegocio metodoPagoNegocio = new MetodoPagoNegocio();
                listaMp = metodoPagoNegocio.Listar();

                ListItem z;
                foreach (MetodoPago item in listaMp)
                {
                    z = new ListItem(item.Nombre.ToString(), item.IdMetodoPago.ToString());
                    ListaMetodo.Items.Add(z);

                }
            }
            catch(Exception)
            {
                Response.Redirect("Error.aspx");
            }
        }

        protected void AgregarProductoEnCompra_Click(object sender, EventArgs e)
        {
            ProductoNegocio negocio = new ProductoNegocio();
            List<Producto> listaActual = negocio.Listar();
            iten.ItemArt = listaActual.Find(x => x.IdProducto.ToString() == ListaProductoCompra.SelectedItem.Value);
            iten.Cantidad = Convert.ToInt32(CantidadProducto.Text);
            iten.Subtotal = Convert.ToDecimal(iten.Cantidad * Convert.ToInt32(PrecioCompraProducto.Text));
            items.Add(iten);
            repetidor.DataSource = items;
            repetidor.DataBind();
            Session.Add("items", items);

            foreach (ListaProductos item in items)
            {
                total += item.Subtotal;
            }
            Session.Add("totalcompra", total);
        }

        protected void GuardarCompra_Click(object sender, EventArgs e)
        {
            try
            {

                CompraNegocio negocio = new CompraNegocio();
                ListaProductosNegocio listaproducto = new ListaProductosNegocio();
                Compra compra = new Compra();
                decimal totalcompras;

                // se trae los datos de total y los items

                totalcompras = (decimal)Session["totalcompra"];

                ///se agrega la compra
                compra.proveedor = new Proveedor();
                compra.proveedor.IdProveedor = int.Parse(ListaProveedor.SelectedItem.Value);
                compra.Importe = totalcompras;
                compra.metodoPago = new MetodoPago();
                compra.metodoPago.IdMetodoPago = int.Parse(ListaMetodo.SelectedItem.Value);

                //cambio de formato de fecha para que sea valida en la base de datos

                /*DateTime FechaCalendario = Convert.ToDateTime(txtFechaFactura.Text);
                 String FechaCalendarioString = FechaCalendario.ToString("yyyy-MM-dd");
                 compra.Fecha = Convert.ToDateTime(FechaCalendarioString);*/


                compra.Fecha = Convert.ToDateTime(Calendar1.SelectedDate.ToString("yyyy/MM/dd"));



                negocio.AgregarCompra(compra);
                // fin de agregar compra

                //agrega lista de productos
                int ultimonumeroCompra;
                List<ListaProductos> itemsCompra = (List<ListaProductos>)Session["items"];
                ultimonumeroCompra = negocio.NumeroCompra();
                ultimonumeroCompra += 1;
                listaproducto.AgregarListaCompra(itemsCompra, ultimonumeroCompra);
            }
            catch (Exception)
            {
                Response.Redirect("Error.aspx");
            }

        }
    }
}
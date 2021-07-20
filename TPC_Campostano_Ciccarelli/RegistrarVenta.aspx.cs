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
        public List<ListaProductos> Items;
        ListaProductos itam;

        public decimal total;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Items = (List<ListaProductos>)Session["itemsVenta"];
                if (Items == null)
                    Items = new List<ListaProductos>();

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

        protected void ListaClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListaProductoVenta.Items.Clear();
            int a;
            ProductoNegocio productoNegocio = new ProductoNegocio();

            a = Int32.Parse(ListaClientes.Text);


            listaProducto = productoNegocio.ListarProductoPorIdProveedor(a);
            ListItem f;
            foreach (Producto item in listaProducto)
            {
                f = new ListItem('(' + item.Codigo.ToString() + ')' + ' ' + item.NombreProducto.ToString(), item.IdProducto.ToString());
                ListaProductoVenta.Items.Add(f);
            }
        }

        protected void ListaClientes_Init(object sender, EventArgs e)
        {
            try
            {
                ClienteNegocio clienteNegocio = new ClienteNegocio();
                listaC = clienteNegocio.Listar();

                ListItem i;
                foreach (Cliente item in listaC)
                {
                    i = new ListItem(item.RazonSocial.ToString(), item.IdCliente.ToString());
                    ListaClientes.Items.Add(i);
                }
            }
            catch (Exception)
            {
                Response.Redirect("Error.aspx");
            }
        }

       

        protected void ListaMetodoVenta_Init(object sender, EventArgs e)
        {
            try
            {
                MetodoPagoNegocio metodoPagoNegocio = new MetodoPagoNegocio();
                listaMPago = metodoPagoNegocio.Listar();

                ListItem z;
                foreach (MetodoPago item in listaMPago)
                {
                    z = new ListItem(item.Nombre.ToString(), item.IdMetodoPago.ToString());
                    ListaMetodoVenta.Items.Add(z);

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


    }
}
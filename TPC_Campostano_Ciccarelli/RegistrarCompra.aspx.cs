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
        protected void Page_Load(object sender, EventArgs e)
        {

                try
                {                                            
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
            txt2.Text = ListaProveedor.Text;

            listaproducto = productoNegocio.ListarPorIdProveedor(a);
            ListItem f;
            foreach (Producto item in listaproducto)
            {
                f = new ListItem(item.Codigo.ToString(), item.IdProducto.ToString());
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
    }
}
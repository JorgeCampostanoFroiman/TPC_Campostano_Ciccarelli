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
                ProveedorNegocio proveedorNegocio = new ProveedorNegocio();
                listaP = proveedorNegocio.Listar();

                ListItem i;
                foreach (Proveedor item in listaP)
                {
                    i = new ListItem(item.RazonSocialProveedor.ToString(), item.IdProveedor.ToString());
                    ListaProveedor.Items.Add(i);

                }

                MetodoPagoNegocio metodoPagoNegocio = new MetodoPagoNegocio();
                listaMp = metodoPagoNegocio.Listar();

                ListItem z;
                foreach (MetodoPago item in listaMp)
                {
                    z = new ListItem(item.Nombre.ToString(), item.IdMetodoPago.ToString());
                    ListaMetodo.Items.Add(z);

                }
              
                ProductoNegocio productoNegocio = new ProductoNegocio();
                listaproducto = productoNegocio.Listar();

                /*
                if (Convert.ToInt32(ListaProveedor.SelectedValue) == item.proveedor.IdProveedor)
                {


                }*/
                    ListItem x;
                foreach (Producto item in listaproducto)
                {

                    x = new ListItem(item.Codigo.ToString(), item.IdProducto.ToString());
                    ListaProductoVenta.Items.Add(x);
      
                }

                


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

                /*txtFechaFactura.Text = DateTime.Now.ToString("dd/MM/yyyy");*/
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

    }
}
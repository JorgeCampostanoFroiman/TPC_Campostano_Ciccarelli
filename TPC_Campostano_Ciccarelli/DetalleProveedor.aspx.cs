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
    public partial class DetalleProveedor : System.Web.UI.Page
    {
        public List<Proveedor> lista;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ProveedorNegocio negocio = new ProveedorNegocio();
                
                lista = negocio.Listar();
                Session.Add("proveedores", lista);

                int id = int.Parse(Request.QueryString["id"]);
                List<Proveedor> listado = (List<Proveedor>)Session["proveedores"];
                Proveedor seleccionado = listado.Find(x => x.IdProveedor == id);

                labelIdProveedor.Text = "Id Proveedor: " + seleccionado.IdProveedor;
                labelCuit.Text = "Cuit: " + seleccionado.CuitProveedor;
                labelDomicilio.Text = "Domicilio: " + seleccionado.Domicilio;
                if (seleccionado.Email != null)
                {
                   labelEmail.Text = "Email: " + seleccionado.Email;
                }
                if (seleccionado.Telefono != null)
                {
                    labelTelefono.Text = "Teléfono: " + seleccionado.Telefono;
                }
                labelRazonSocial.Text = "Razón social: " + seleccionado.RazonSocialProveedor;
                



            }

            catch (Exception)
            {
                Response.Redirect("Error.aspx");
            }

        }
    }
}
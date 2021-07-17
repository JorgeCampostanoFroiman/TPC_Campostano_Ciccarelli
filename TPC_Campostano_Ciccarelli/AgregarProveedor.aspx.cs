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
    public partial class AgregarProveedor : System.Web.UI.Page
    {
        public List<Proveedor> listaProveedores;
        ProveedorNegocio proveedorNegocio = new ProveedorNegocio(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegocio negocio = new ProductoNegocio();
            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    listaProveedores = (List<Proveedor>)Session["proveedores"];
                    if (listaProveedores == null)
                        listaProveedores = new List<Proveedor>();
                }


                listaProveedores = proveedorNegocio.Listar();

                if (Request.QueryString["c"] == "d")
                {
                    Proveedor equis = listaProveedores.Find(x => x.IdProveedor.ToString() == Request.QueryString["id"]);
                    proveedorNegocio.eliminar(equis.IdProveedor);
                }
                listaProveedores = proveedorNegocio.Listar();





            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnAgregarProv_Click(object sender, EventArgs e)
        {
            Proveedor nuevo = new Proveedor();
            nuevo.RazonSocialProveedor = textRazonSocial.Text;
            nuevo.Email = txtEmail.Text;
            nuevo.CuitProveedor = txtCuit.Text;
            nuevo.Domicilio = txtDomicilio.Text;
            nuevo.Telefono = txtTelefono.Text;

            proveedorNegocio.AgregarProveedor(nuevo);
        }

        
    }
}
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
    public partial class RegistrarProveedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void btnRegistrarProveedor_Click(object sender, EventArgs e)
        {
            ProveedorNegocio proveedorNegocio = new ProveedorNegocio();
            Proveedor nuevo = new Proveedor();
            try
            {

                nuevo.RazonSocialProveedor = txtRazonSocial.Text;
                nuevo.Email = txtEmail.Text;
                nuevo.CuitProveedor = txtCuit.Text;
                nuevo.Domicilio = txtDomicilio.Text;
                nuevo.Telefono = txtTelefono.Text;

                proveedorNegocio.AgregarProveedor(nuevo);

                proveedorAgregado.Text = "Proveedor agregado exitosamente.";
            }
            catch (Exception)
            {
                Response.Redirect("Error.aspx");
            }
        }
    }
}
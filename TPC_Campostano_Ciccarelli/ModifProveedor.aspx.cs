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
    public partial class ModifProveedor : System.Web.UI.Page
    {
        ProveedorNegocio proveedorNegocio = new ProveedorNegocio();
        public List<Proveedor> prov;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {

                    ///List<Proveedor> listaProv = proveedorNegocio.Listar();


                    /// Proveedor seleccionado = listaProv.Find(x => x.IdProveedor.ToString() == Request.QueryString["id"]);
                    int id = int.Parse(Request.QueryString["id"]);
                    List<Proveedor> listado = proveedorNegocio.Listar();
                    Proveedor seleccionado = listado.Find(x => x.IdProveedor == id);
                    tituloProveedor.Text = "Nombre anterior : (" + seleccionado.RazonSocialProveedor + ")" ;
                    

                }
            }
            catch (Exception)
            {
                Response.Redirect("Error.aspx");
            }

        }

        protected void btnModifProv_Click(object sender, EventArgs e)
        {
            prov = proveedorNegocio.Listar();
            Proveedor modif = prov.Find(x => x.IdProveedor.ToString() == Request.QueryString["id"]);

            modif.RazonSocialProveedor = textoRazonSocial.Text;
            modif.CuitProveedor = textoCuit.Text;
            modif.Domicilio = textoDomicilio.Text;
            modif.Email = textoEmail.Text;
            modif.Telefono = textoTelefono.Text;
            
            

            proveedorNegocio.modificarProveedor(modif);
            Response.Redirect("AgregarProveedor.aspx");

        }
    }
}
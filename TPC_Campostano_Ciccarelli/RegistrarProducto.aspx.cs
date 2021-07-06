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
    public partial class RegistrarProducto : System.Web.UI.Page
    {
        public List<Producto> lista;
        protected void Page_Load(object sender, EventArgs e)
        { 
            MarcaNegocio marcaNegocio = new MarcaNegocio();
            TipoNegocio tipoNegocio = new TipoNegocio();
            ProveedorNegocio proveedorNegocio = new ProveedorNegocio();

            if (!Page.IsPostBack)
            {
                DDLMarca.DataSource = marcaNegocio.Listar();
                DDLMarca.DataTextField = "Nombre";
                DDLMarca.DataValueField = "IdMarca";
                DDLMarca.DataBind();

                DDLProveedor.DataSource = proveedorNegocio.Listar();
                DDLProveedor.DataTextField = "RazonSocialProveedor";
                DDLProveedor.DataValueField = "IdProveedor";
                DDLProveedor.DataBind();

                DDLTipo.DataSource = tipoNegocio.Listar();
                DDLTipo.DataTextField = "Nombre";
                DDLTipo.DataValueField = "IdTipo";
                DDLTipo.DataBind();
            }

        }

        protected void BotonAceptar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
                return;
            else
            {
                lblOutput.Text = "Funcionaría en principio";
            }
        }
    }
}
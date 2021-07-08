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
    public partial class AgregarTipo : System.Web.UI.Page
    {
        TipoNegocio tipoNegocio = new TipoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
            

            if (!IsPostBack)
            {
              
                DDLTipo.DataSource = tipoNegocio.Listar();
                DDLTipo.DataTextField = "Nombre";
                DDLTipo.DataValueField = "IdTipo";
                DDLTipo.DataBind();

                DDLTipo2.DataSource = tipoNegocio.Listar();
                DDLTipo2.DataTextField = "Nombre";
                DDLTipo2.DataValueField = "IdTipo";
                DDLTipo2.DataBind();

                DDLTipo3.DataSource = tipoNegocio.Listar();
                DDLTipo3.DataTextField = "Nombre";
                DDLTipo3.DataValueField = "IdTipo";
                DDLTipo3.DataBind();

            }
        }

        protected void btnModificarTipo_Click(object sender, EventArgs e)
        {

        }

        protected void btnEliminarTipo_Click(object sender, EventArgs e)
        {
            tipoNegocio.eliminarTipo(int.Parse(DDLTipo3.SelectedItem.Value));
               
        }

        protected void btnAgregarTipo_Click(object sender, EventArgs e)
        {
            tipoNegocio.agregarTipo(textAgregarTipo.Text);

        }
    }
}
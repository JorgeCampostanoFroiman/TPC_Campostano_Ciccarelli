using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace TPC_Campostano_Ciccarelli
{
    public partial class AgregarMarca : System.Web.UI.Page
    {
        MarcaNegocio marcaNegocio = new MarcaNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {
                DDLMarca.DataSource = marcaNegocio.Listar();
                DDLMarca.DataTextField = "Nombre";
                DDLMarca.DataValueField = "IdMarca";
                DDLMarca.DataBind();
            }
        }


        protected void btnAgregarMarca_Click(object sender, EventArgs e)
        {
            MarcaNegocio marcaNegocio = new MarcaNegocio();
            marcaNegocio.agregarMarca(textAgregarMarca.Text);
        }

        protected void RefreshButton_Click(object sender, EventArgs e)
        {
           
                DDLMarca.DataSource = marcaNegocio.Listar();
                DDLMarca.DataTextField = "Nombre";
                DDLMarca.DataValueField = "IdMarca";
                DDLMarca.DataBind();
                lbl1.Text = "Ddl refrescada exitosamente";
            
            

        }
    }
}

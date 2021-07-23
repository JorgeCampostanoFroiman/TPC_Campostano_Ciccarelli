using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Campostano_Ciccarelli
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                dropMenu.Visible = false;
                comprasMenu.Visible = false;
                ventasMenu.Visible = false;
                mostrarUsuario.Visible = false;
            }
            else if (((dominio.Usuario)Session["clase usuario"]).TipoUsuario == dominio.TipoUsuario.NORMAL)
            {
                dropMenu.Visible = false;
            }
        }
    }
}
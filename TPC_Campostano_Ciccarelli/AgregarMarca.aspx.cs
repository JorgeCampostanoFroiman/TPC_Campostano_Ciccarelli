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
    public partial class AgregarMarca : System.Web.UI.Page
    {
        public List<Marca> lista;
        MarcaNegocio marcaNegocio = new MarcaNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegocio negocio = new ProductoNegocio();
            try
            {
                lista = marcaNegocio.Listar();
                Session.Add("ListaMarcas", lista);
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }

        }

        protected void modificarMarca_Click(object sender, EventArgs e)
        {

        }

        protected void eliminarMarca_Click(object sender, EventArgs e)
        {
            ///marcaNegocio.eliminarMarca()
        }
    }
}

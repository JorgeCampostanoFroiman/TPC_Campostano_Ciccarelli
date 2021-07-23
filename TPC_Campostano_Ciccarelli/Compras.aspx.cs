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
    public partial class Compras1 : System.Web.UI.Page
    {
        public List<Compra> lista;
        public void Page_Load(object sender, EventArgs e)
        {

            if ((Session["usuario"] == null))
            {
                Session.Add("error", "No tienes permisos para ver este sitio");
                Response.Redirect("Error.aspx");
            }

            CompraNegocio negocio = new CompraNegocio();
            try
            {
                lista = negocio.Listar();
                Session.Add("ListaCompras", lista);
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }

        }
    }
}
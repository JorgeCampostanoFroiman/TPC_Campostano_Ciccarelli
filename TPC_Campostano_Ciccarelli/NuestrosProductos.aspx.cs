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
    public partial class NuestrosProductos : System.Web.UI.Page
    {
        public List<Producto> lista;
        public void Page_Load(object sender, EventArgs e)
        {
            ProductoNegocio negocio = new ProductoNegocio();
            try
            {
                lista = negocio.Listar();
                Session.Add("ListaProductos", lista);

                if (Request.QueryString["Id"] != null)
                {
                    lista = (List<Producto>)Session["productos"];
                    if (lista == null)
                        lista = new List<Producto>();
                }


                lista = negocio.Listar();
                if (Request.QueryString["c"] == "d")
                {
                    Producto equis = lista.Find(x => x.IdProducto.ToString() == Request.QueryString["id"]);
                    negocio.eliminar(equis.IdProducto);
                }
                lista = negocio.Listar();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }
}
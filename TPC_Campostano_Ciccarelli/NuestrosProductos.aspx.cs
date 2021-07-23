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
        public List<Producto> ProductoBuscar;
        public List<Producto> Busqueda;
        public void Page_Load(object sender, EventArgs e)
        {
            if ((Session["usuario"] != null) && (((dominio.Usuario)Session["clase usuario"]).TipoUsuario == dominio.TipoUsuario.ADMIN))
            {

            }
            else
            {
                Session.Add("error", "No tienes permisos para ver este sitio");
                Response.Redirect("Error.aspx");
            }

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

        /*desarrollo de barra de busqueda*/
      
        

        protected void BotonBusqueda_Click1(object sender, EventArgs e)
        {
            List<Producto> Aux = (List<Producto>)Session["ListaProductos"];
            Busqueda = new List<Producto>();

            foreach (Producto item in Aux)
            {
                if (System.Text.RegularExpressions.Regex.IsMatch(item.NombreProducto, BarraBusqueda.Text, System.Text.RegularExpressions.RegexOptions.IgnoreCase))
                {
                    Busqueda.Add(item);
                }
                else
                {
                    if (System.Text.RegularExpressions.Regex.IsMatch(item.Codigo, BarraBusqueda.Text, System.Text.RegularExpressions.RegexOptions.IgnoreCase))
                    {
                        Busqueda.Add(item);
                    }
                    else
                    {
                        if (System.Text.RegularExpressions.Regex.IsMatch(item.tipo.Nombre, BarraBusqueda.Text, System.Text.RegularExpressions.RegexOptions.IgnoreCase))
                        {
                            Busqueda.Add(item);

                        }
                        else
                        {
                            if (System.Text.RegularExpressions.Regex.IsMatch(Convert.ToString(item.Stock), BarraBusqueda.Text, System.Text.RegularExpressions.RegexOptions.IgnoreCase))
                            {
                                Busqueda.Add(item);

                            }

                        }


                    }
                }
            }

            lista = Busqueda;

            Session.Add("Buscar", Busqueda);
        }

        protected void Refrescar_Click(object sender, EventArgs e)
        {
            ProductoNegocio negocio = new ProductoNegocio();
            lista = negocio.Listar();
        }
    }
}
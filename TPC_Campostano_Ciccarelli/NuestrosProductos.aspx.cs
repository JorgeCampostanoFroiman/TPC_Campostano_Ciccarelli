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

        /*desarrollo de barra de busqueda*/
        protected void BotonBusqueda_Click(object sender, EventArgs e)
        {
            ProductoNegocio negocio = new ProductoNegocio();
            List<Producto> Aux = (List<Producto>)Session["ListaProductos"];
            ProductoBuscar = new List<Producto>();

            foreach (Producto item in Aux)
            {

                if (BarraBusqueda.Text != "")
                {
                    lista = Aux.FindAll(BUSQUEDA => BUSQUEDA.NombreProducto.ToUpper().Contains(BarraBusqueda.Text.ToUpper()));
                    Session.Add("Buscar", lista);
                    lista = negocio.Listar();
                }

                /*if (System.Text.RegularExpressions.Regex.IsMatch(item.NombreProducto, BarraBusqueda.Text, System.Text.RegularExpressions.RegexOptions.IgnoreCase))
                {
                    lista.Add(item);
                }
                else
                {
                    if (System.Text.RegularExpressions.Regex.IsMatch(item.marca.Nombre, BarraBusqueda.Text, System.Text.RegularExpressions.RegexOptions.IgnoreCase))
                    {
                        lista.Add(item);
                    }
                }
            }
            Session.Add("Buscar", lista);
            List<Producto> busqueda = (List<Producto>)Session["Buscar"];
            lista = negocio.Listar();
                */

            }
        }
    }
}
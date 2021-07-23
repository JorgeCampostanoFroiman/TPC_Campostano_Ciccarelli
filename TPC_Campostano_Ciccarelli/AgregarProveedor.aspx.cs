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
    public partial class AgregarProveedor : System.Web.UI.Page
    {
        public List<Proveedor> listaProveedores;
        ProveedorNegocio proveedorNegocio = new ProveedorNegocio();
        public List<Proveedor> Busqueda;
        protected void Page_Load(object sender, EventArgs e)
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
                if (Request.QueryString["Id"] != null)
                {
                    listaProveedores = (List<Proveedor>)Session["proveedores"];
                    if (listaProveedores == null)
                        listaProveedores = new List<Proveedor>();
                }


                listaProveedores = proveedorNegocio.Listar();

                if (Request.QueryString["c"] == "d")
                {
                    Proveedor equis = listaProveedores.Find(x => x.IdProveedor.ToString() == Request.QueryString["id"]);
                    proveedorNegocio.eliminar(equis.IdProveedor);
                }
                listaProveedores = proveedorNegocio.Listar();





            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void BotonBusqueda3_Click(object sender, EventArgs e)
        {
            
            Busqueda = new List<Proveedor>();

            foreach (Proveedor item in listaProveedores)
            {
                if (System.Text.RegularExpressions.Regex.IsMatch(item.CuitProveedor, BarraBusqueda3.Text, System.Text.RegularExpressions.RegexOptions.IgnoreCase))
                {
                    Busqueda.Add(item);
                }
                else
                {
                    if (System.Text.RegularExpressions.Regex.IsMatch(item.RazonSocialProveedor, BarraBusqueda3.Text, System.Text.RegularExpressions.RegexOptions.IgnoreCase))
                    {
                        Busqueda.Add(item);
                    }
                    else
                    {
                        if (System.Text.RegularExpressions.Regex.IsMatch(item.Email, BarraBusqueda3.Text, System.Text.RegularExpressions.RegexOptions.IgnoreCase))
                        {
                            Busqueda.Add(item);

                        }
                        else
                        {
                            if (System.Text.RegularExpressions.Regex.IsMatch(item.Domicilio, BarraBusqueda3.Text, System.Text.RegularExpressions.RegexOptions.IgnoreCase))
                            {
                                Busqueda.Add(item);

                            }

                        }


                    }
                }
            }

            listaProveedores = Busqueda;

            Session.Add("Buscar4", Busqueda);

        }

        protected void Refrescar_Click(object sender, EventArgs e)
        {
            ProveedorNegocio negocio = new ProveedorNegocio();
            listaProveedores = negocio.Listar();
        }
    }
}
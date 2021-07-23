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
        public List<Tipo> listaTipos;
        TipoNegocio tipoNegocio = new TipoNegocio();
        public List<Tipo> Busqueda;
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
                    listaTipos = (List<Tipo>)Session["tipos"];
                    if (listaTipos == null)
                        listaTipos = new List<Tipo>();
                }
                listaTipos = tipoNegocio.Listar();

                if (Request.QueryString["c"] == "d")
                {
                    tipoNegocio.eliminarTipo(Convert.ToInt32(Request.QueryString["id"]));
                }
                listaTipos = tipoNegocio.Listar();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (tipoNegocio.existeTipo(txtAgregar.Text) == true)
            {
                if (tipoNegocio.existeTipoDeBaja(txtAgregar.Text) == true)
                {
                    Tipo modificar = new Tipo();
                    modificar.Nombre = txtAgregar.Text;
                    modificar.Estado = Convert.ToBoolean(1);
                    tipoNegocio.ModificarTipoDeBaja(modificar);
                    tipoTexto.Text = "****La Marca ya existía pero estaba dada de baja. Ya ha sido dada de alta nuevamente.****";

                }
                else
                {
                    tipoTexto.Text = "****La Marca ya existe, intente con otro nombre****)";
                }
            }
            else
            {
                tipoNegocio.agregarTipo(txtAgregar.Text);
                tipoTexto.Text = "***Marca agregada correctamente.***";
            }


            listaTipos = tipoNegocio.Listar();
        }


        protected void BotonBusqueda5_Click(object sender, EventArgs e)
        {
            Busqueda = new List<Tipo>();

            foreach (Tipo item in listaTipos)
            {
                if (System.Text.RegularExpressions.Regex.IsMatch(item.Nombre, BarraBusqueda5.Text, System.Text.RegularExpressions.RegexOptions.IgnoreCase))
                {
                    Busqueda.Add(item);
                }

            }

            listaTipos = Busqueda;

            Session.Add("Buscar3", Busqueda);
        }

        protected void Refrescar_Click1(object sender, EventArgs e)
        {
            TipoNegocio negocio = new TipoNegocio();
            listaTipos = negocio.Listar();
        }
    }
}
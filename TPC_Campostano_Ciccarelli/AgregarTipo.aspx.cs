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
        protected void Page_Load(object sender, EventArgs e)
        {
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
                    Tipo equis = listaTipos.Find(x => x.IdTipo.ToString() == Request.QueryString["id"]);
                    tipoNegocio.eliminarTipo(equis.IdTipo);
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
            tipoNegocio.agregarTipo(txtAgregar.Text);
        }
    }
}
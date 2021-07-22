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
        public List<Marca> listaMarcas;
        MarcaNegocio marcaNegocio = new MarcaNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegocio negocio = new ProductoNegocio();
            try
            {
                
                if (Request.QueryString["Id"] != null)
                {
                    listaMarcas = (List<Marca>)Session["marcas"];
                    if (listaMarcas == null)
                        listaMarcas = new List<Marca>();
                }
                    

                    listaMarcas = marcaNegocio.Listar();

                if (Request.QueryString["c"] == "d")
                {
                    Marca equis = listaMarcas.Find(x => x.IdMarca.ToString() == Request.QueryString["id"]);
                    marcaNegocio.eliminarMarca(equis.IdMarca);
                }
                    listaMarcas = marcaNegocio.Listar();





            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }

        }

      
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            marcaNegocio.agregarMarca(txtAgregar.Text);
        }
    }
}

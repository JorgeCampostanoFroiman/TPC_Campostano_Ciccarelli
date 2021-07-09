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
    public partial class ModificarMarca : System.Web.UI.Page
    {
        public List<Marca> listaMarcas;
        MarcaNegocio marcaNegocio = new MarcaNegocio();



        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    listaMarcas = marcaNegocio.Listar();
                    Marca seleccionado = listaMarcas.Find(x => x.IdMarca.ToString() == Request.QueryString["id"]);
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnMarca_Click(object sender, EventArgs e)
        {
            listaMarcas = marcaNegocio.Listar();
            Marca modif = listaMarcas.Find(x => x.IdMarca.ToString() == Request.QueryString["id"]);
            modif.Nombre = TxtMarca.Text;
            marcaNegocio.modificarMarca(modif);
        }
    }
}
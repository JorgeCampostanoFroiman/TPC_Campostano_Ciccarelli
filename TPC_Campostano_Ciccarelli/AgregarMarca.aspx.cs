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
        public List<Marca> Busqueda;
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
                    
                    marcaNegocio.eliminarMarca(Convert.ToInt32(Request.QueryString["id"]));
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
            if (marcaNegocio.existeMarca(txtAgregar.Text) == true)
            {
                if (marcaNegocio.existeMarcadeBaja(txtAgregar.Text) == true)
                {
                    Marca modificar = new Marca();
                    modificar.Nombre = txtAgregar.Text;
                    modificar.Estado = Convert.ToBoolean(1);
                    marcaNegocio.ModificarMarcaDeBaja(modificar);
                    marcaTexto.Text = "****La Marca ya existía pero estaba dada de baja. Ya ha sido dada de alta nuevamente.****";
                    
                }
                else
                {
                    marcaTexto.Text = "****La Marca ya existe, intente con otro nombre****)";
                }
            }
            
            else
            {
                marcaNegocio.agregarMarca(txtAgregar.Text);
                marcaTexto.Text = "***Marca agregada correctamente.***";
            }


            listaMarcas = marcaNegocio.Listar();
        }

        protected void BotonBusqueda_Click(object sender, EventArgs e)
        {
           
            Busqueda = new List<Marca>();

            foreach (Marca item in listaMarcas)
            {
                if (System.Text.RegularExpressions.Regex.IsMatch(item.Nombre, BarraBusqueda.Text, System.Text.RegularExpressions.RegexOptions.IgnoreCase))
                {
                    Busqueda.Add(item);
                }
                
            }

            listaMarcas = Busqueda;

            Session.Add("Buscar2", Busqueda);
        }

        protected void Refrescar_Click(object sender, EventArgs e)
        {
            MarcaNegocio negocio = new MarcaNegocio();
            listaMarcas = negocio.Listar();
        }
    }
}

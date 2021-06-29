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
    public partial class RegistrarVenta : System.Web.UI.Page
    {
       
        public List<Cliente> listaC;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
/*
                ClienteNegocio clienteNegocio = new ClienteNegocio();
                listaC = clienteNegocio.Listar();

                ListItem r;
                foreach (Cliente item in listaC)
                {
                    r = new ListItem(item.RazonSocial.ToString(), item.IdCliente.ToString());
                    listaC.Items.Add(r);

                }
*/
            }
            catch (Exception)
            {
                Response.Redirect("Error.aspx");
            }
        }
    }
}
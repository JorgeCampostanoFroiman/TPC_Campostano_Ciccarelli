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
    public partial class Ingreso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                textContraseña.Visible = false;
                textMail.Visible = false;
                labelLogueado.Visible = true;
                labelLogueado.Text= "Ya estas logueado como " + Session["usuario"];
                btnIngreso.Visible = false;
                btnDesloguear.Visible = true;
            }
        }

        protected void btnIngreso_Click(object sender, EventArgs e)
        {
            Usuario usuario;
            Usuario newUser;
            UsuarioNegocio negocio = new UsuarioNegocio();
            try
            {
                usuario = new Usuario(textContraseña.Text, textMail.Text, false);
                if (negocio.Loguear(usuario))
                {
                    newUser = negocio.usuarioLogueado(usuario.Email);
                    Session.Add("clase usuario", newUser);
                    Session.Add("usuario", newUser.Nombre);
                    Response.Redirect("Ventas.aspx", false);
                }
                else
                {
                    Session.Add("error", "Usuario o contraseña incorrectos");
                    Response.Redirect("Error.aspx", false);
                }
            }
            catch (Exception)
            {
                Session.Add("Error", "Excepcion encontrada, pero la capturamos!");
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnDesloguear_Click(object sender, EventArgs e)
        {
            Session.Remove("usuario");
            Response.Redirect("Ingreso.aspx");
        }
    }
}
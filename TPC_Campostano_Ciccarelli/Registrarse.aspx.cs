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
    public partial class Registrarse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            Page.Validate();
            if (!Page.IsValid)
                return;
            else
            {

                if (usuarioNegocio.ListarPorDNI(Convert.ToInt32(textoDNI.Text)) == false)
                {

                    Usuario usuario = new Usuario();
                    usuario.Dni = textoDNI.Text;
                    usuario.Nombre = textoNombre.Text;
                    usuario.Apellido = textoApellido.Text;
                    usuario.Email = textoEmail.Text;
                    usuario.Telefono = textoTelefono.Text;
                    usuario.Contraseña = textoContraseña.Text;


                    usuarioNegocio.Agregar(usuario);

                    usuarioAgregado.Text = "Usuario agregado exitósamente. ";
                }
                else
                {
                    return;
                }
            }
        }
    }
}
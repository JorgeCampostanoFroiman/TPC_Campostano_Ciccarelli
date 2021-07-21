using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public enum TipoUsuario
    {
        NORMAL=1,
        ADMIN=2
    }

    public class Usuario
    {
        public int IdUsuario { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }
        public string Contraseña { get; set; }
        public string Dni { get; set; }
        public TipoUsuario TipoUsuario { get; set; }

        public Usuario(string pass, string mail, bool admin )
        {
            Contraseña = pass;
            Email = mail;
            TipoUsuario = admin ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;
        }

        public Usuario(string mail)
        {
            Email = mail;
        }
        public Usuario()
        {

        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Proveedor
    {
        public int IdProveedor { get; set; }
        public bool Estado { get; set; }
        public string Email { get; set; }
        public string Telefono { get; set; }
        public string Domicilio { get; set; }
        public string CuitProveedor { get; set; }
        public string RazonSocialProveedor { get; set; }


        public Proveedor(string nombre)
        {
            RazonSocialProveedor = nombre;
        }

        public Proveedor(int id)
        {
            IdProveedor = id;
        }


        public Proveedor(int id, string nombre)
        {
            IdProveedor = id;
            RazonSocialProveedor = nombre;
        }

        public override string ToString()
        {
            return RazonSocialProveedor;
        }

    }
}

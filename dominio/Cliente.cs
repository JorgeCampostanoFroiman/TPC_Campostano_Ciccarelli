using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Cliente
    {
        public int IdCliente { get; set; }
        public bool Estado { get; set; }
        public string Dni { get; set; }
        public string Domicilio { get; set; }
        public string CuitCliente { get; set; }
        public string RazonSocial { get; set; }

        public Cliente(string razonSocial)
        {
            RazonSocial = razonSocial;
        }

        public Cliente(int id)
        {
            IdCliente = id;
        }
        public Cliente()
        {

        }

        public Cliente(int id, string nombre)
        {
            IdCliente = id;
            RazonSocial = nombre;
        }

        public override string ToString()
        {
            return RazonSocial;
        }
    }
}

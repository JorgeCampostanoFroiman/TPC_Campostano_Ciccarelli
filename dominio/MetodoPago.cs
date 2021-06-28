using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class MetodoPago
    {
        public int IdMetodoPago { get; set; }
        public string Nombre { get; set; }

        
        public MetodoPago(string nombre)
        {
            Nombre = nombre;
        }

        public MetodoPago(int id)
        {
            IdMetodoPago = id;
        }

        public MetodoPago(int id, string nombre)
        {
            IdMetodoPago = id;
            Nombre = nombre;
        }

        public override string ToString()
        {
            return Nombre;
        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Marca
    {

        public int IdMarca { get; set; }
        public string Nombre { get; set; }

        public Marca(string nombre)
        {
            Nombre = nombre;
        }

        public Marca(int id, string nombre)
        {
            Nombre = nombre;
            IdMarca = id;
        }

        public override string ToString()
        {
            return Nombre;
        }

    }
}

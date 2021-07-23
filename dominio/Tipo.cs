using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Tipo
    {
        public int IdTipo { get; set; }
        public string Nombre { get; set; }

        public bool Estado { get; set; }
        public Tipo(string nombre)
        {
            Nombre = nombre;
        }

        public Tipo(int id, string nombre)
        {
            IdTipo = id;
            Nombre = nombre;
        }

        public Tipo()
        {

        }


        public override string ToString()
        {
            return Nombre;
        }

    }
}

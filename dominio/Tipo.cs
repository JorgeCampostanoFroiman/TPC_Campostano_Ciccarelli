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
        public Tipo(string nombre)
        {
            Nombre = nombre;
        }


    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class TipoFactura
    {
        public int IdTipoFactura { get; set; }
        public string Nombre { get; set; }


        public TipoFactura(string nombre)
        {
            Nombre = nombre;
        }

        public TipoFactura()
        {

        }
        public TipoFactura(int id, string nombre)
        {
            IdTipoFactura = id;
            Nombre = nombre;
        }
    }
}

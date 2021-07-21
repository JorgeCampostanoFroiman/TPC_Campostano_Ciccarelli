using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class EstadoStock
    {

        public int IdEstadoStockProducto { get; set; }
        public string NombreEstadoStockProducto { get; set; }

        public EstadoStock(string nombre)
        {
            NombreEstadoStockProducto = nombre;
        }
        public EstadoStock(int id)
        {
            IdEstadoStockProducto = id;
        }
        public EstadoStock()
        {

        }

        public EstadoStock(string nombre, int id)
        {
            NombreEstadoStockProducto = nombre;
            IdEstadoStockProducto = id;
        }

    }
}

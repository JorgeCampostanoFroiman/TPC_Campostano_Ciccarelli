using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Producto
    {
        public int IdProducto { get; set; }
        public string Codigo { get; set; }
        public string NombreProducto { get; set; }
        public Marca marca { get; set; }
        public Tipo tipo { get; set; }
        public decimal precioCompra { get; set; }
        public decimal precioVenta { get; set; }
        public int Stock { get; set; }
        public int Ganancia { get; set; }
        public string Descripcion { get; set; }
        public Proveedor proveedor { get; set; }
        public string imagenUrl { get; set; }

        public Producto(int id)
        {
            IdProducto = id;
        }

        public Producto()
        {

        }
    }
}


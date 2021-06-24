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
        public Marca Idmarca { get; set; }
        public Tipo Idtipo { get; set; }
        public decimal precioCompra { get; set; }
        public decimal precioVenta { get; set; }
        public int Stock { get; set; }
        public int Ganancia { get; set; }
        public string Descripcion { get; set; }
        public Proveedor Idproveedor { get; set; }
        public string imagenUrl { get; set; }
    }
}

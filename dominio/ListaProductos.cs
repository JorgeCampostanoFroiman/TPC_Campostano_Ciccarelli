using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class ListaProductos
    {
        public int IdListaProductos { get; set; }
        public Producto Idproducto { get; set; }
        public int Cantidad { get; set; }
        public decimal Subtotal { get; set; }
        public bool Transaccion { get; set; }
        public Proveedor Idproveedor { get; set; }

    }
}

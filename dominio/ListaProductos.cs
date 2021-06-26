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
        public Producto producto { get; set; }
        public int Cantidad { get; set; }
        public decimal Subtotal { get; set; }
        public bool Transaccion { get; set; }
        public Proveedor proveedor { get; set; }

        public ListaProductos(int id, Producto product, int cant, decimal st, bool transaccion, Proveedor prov)
        {
            IdListaProductos = id;
            producto = product;
            Cantidad = cant;
            Subtotal = st;
            Transaccion = transaccion;
            proveedor = prov;
        }

    }
}

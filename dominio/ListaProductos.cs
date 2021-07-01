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
        public int IdNumeroDeProducto { get; set; } //Era Proveedor. Lo cambiamos para que sea un ID para cada producto, falta cambiarlo en la DB.

        public ListaProductos(int id, Producto product, int cant, decimal st, bool transaccion, int idproducto)
        {
            IdListaProductos = id;
            producto = product;
            Cantidad = cant;
            Subtotal = st;
            Transaccion = transaccion;
            IdNumeroDeProducto = idproducto;
        }

    }
}

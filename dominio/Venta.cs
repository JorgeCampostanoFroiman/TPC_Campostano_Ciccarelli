using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Venta
    {
        public int IdVenta { get; set; }
        public Cliente cliente { get; set; } 
        public Usuario usuario { get; set; }
        public decimal Importe { get; set; }
        public TipoFactura tipofactura { get; set; }
        public DateTime Fecha { get; set; }
        public MetodoPago metodoPago { get; set; }
    }
}

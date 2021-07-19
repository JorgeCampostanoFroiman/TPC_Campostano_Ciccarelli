using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Compra
    {
        public int IdCompra { get; set; }
        public Proveedor proveedor { get; set; }
        public decimal Importe { get; set; }
        public MetodoPago metodoPago { get; set; }
        public string Fecha { get; set; }
     

       

    }
}

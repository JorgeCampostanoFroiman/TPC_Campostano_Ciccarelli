using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class CompraNegocio
    {

        public List<Compra> Listar()
        {
            List<Compra> lista = new List<Compra>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT C.IdCompra, C.IdProveedor, C.Importe, C.MetodoPago, C.Fecha, C.IdListaProductos FROM Compra AS C, ListaProductos AS LP WHERE C.IdListaProductos = LP.IdListaProductos ");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Compra aux = new Compra();
                    aux.IdCompra = (int)datos.Lector["IdCompra"];
                    aux.Idproveedor = new Proveedor((int)datos.Lector["IdProveedor"]);
                    aux.Importe = (decimal)datos.Lector["Importe"];
                    aux.metodoPago = new MetodoPago((int)datos.Lector["MetodoPago"]);
                    aux.Fecha = (DateTime)datos.Lector["Fecha"];
                   

                    lista.Add(aux);
                }

                return lista;

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
            

        }
            

    }
}

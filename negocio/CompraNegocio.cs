using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;
using negocio;

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
                datos.setearConsulta("SELECT C.IdCompra, P.RazonSocialProveedor, C.Importe, M.Nombre AS Metodopago, C.Fecha, C.IdListaProductos FROM Compra AS C, ListaProductos AS LP, Proveedor AS P, MetodoPago AS M WHERE C.IdProveedor = P.IdProveedor and C.IdListaProductos = LP.IdListaProductos and C.MetodoPago = M.IdMetodoPago ");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Compra aux = new Compra();
                    aux.IdCompra = (int)datos.Lector["IdCompra"];
                    aux.Importe = (decimal)datos.Lector["Importe"];
                    aux.metodoPago = new MetodoPago((string)datos.Lector["Metodopago"]);
                    aux.Fecha = (DateTime)datos.Lector["Fecha"];
                    aux.proveedor = new Proveedor((string)datos.Lector["RazonSocialProveedor"]);
                   /// aux.listaProductos = new ListaProductos((string)datos.Lector["idListaProductos"]);                   

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

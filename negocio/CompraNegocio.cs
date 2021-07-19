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
                datos.setearConsulta("SELECT C.IdCompra, P.RazonSocialProveedor, C.Importe, M.Nombre AS Metodopago, C.Fecha FROM Compra AS C, Proveedor AS P, MetodoPago AS M WHERE C.IdProveedor = P.IdProveedor and C.MetodoPago = M.IdMetodoPago ");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Compra aux = new Compra();
                    aux.IdCompra = (int)datos.Lector["IdCompra"];
                    aux.Importe = (decimal)datos.Lector["Importe"];
                    aux.metodoPago = new MetodoPago((string)datos.Lector["Metodopago"]);
                    aux.Fecha = (string)datos.Lector["Fecha"];
                    aux.proveedor = new Proveedor((string)datos.Lector["RazonSocialProveedor"]);

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
        public void AgregarCompra(Compra nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string valores = "values('" + nuevo.proveedor.IdProveedor + "', '" + nuevo.Importe + "', '" + nuevo.metodoPago.IdMetodoPago + "', '" + nuevo.Fecha + "')";
                datos.setearConsulta("insert into Compra (IdProveedor, Importe, MetodoPago, Fecha) " + valores);
                datos.ejectutarAccion();

            }
            catch (Exception ex)
            {
                throw (ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public int NumeroCompra()
        {
            int ultimonumero = 0;
            AccesoDatos datos = new AccesoDatos();

            datos.setearConsulta("select MAX(IdCompra) AS MAXIMO from Compra");
            datos.ejecutarLectura();
            while (datos.Lector.Read())
            {
                ultimonumero = (int)datos.Lector["MAXIMO"];
            }
            return ultimonumero;
        }

    }
}

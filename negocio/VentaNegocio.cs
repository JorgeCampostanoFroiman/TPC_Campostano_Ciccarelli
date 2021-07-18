using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class VentaNegocio
    {
       
        public List<Venta> Listar()
        {
            List<Venta> lista = new List<Venta>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT V.IdVenta, C.RazonSocial, TF.Nombre AS TipoFactura, V.Fecha, V.Importe, MP.Nombre AS MetodoPago, U.Nombre AS Usuario, U.Apellido FROM Venta as V, Usuario as U, MetodoPago as MP, Cliente as C, TipoFactura as TF WHERE C.IdCliente = V.IdCliente AND TF.IdTipoFactura = V.TipoFactura AND MP.IdMetodoPago = V.MetodoPago AND U.IdUsuario = V.IdUsuario");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Venta aux = new Venta();
                    aux.IdVenta = (int)datos.Lector["IdVenta"];
                    aux.cliente = new Cliente((string)datos.Lector["RazonSocial"]);
                    aux.Importe = (decimal)datos.Lector["Importe"];
                    aux.metodoPago = new MetodoPago((string)datos.Lector["MetodoPago"]);
                    aux.Fecha = (DateTime)datos.Lector["Fecha"];              
                    aux.tipofactura = new TipoFactura((string)datos.Lector["TipoFactura"]);
                    aux.usuario = new Usuario((string)datos.Lector["Usuario"]);
                    lista.Add(aux);
                }
                return lista;
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
    }

        


        
 }
         




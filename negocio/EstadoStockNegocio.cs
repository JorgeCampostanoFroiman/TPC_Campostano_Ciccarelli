using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
   public class EstadoStockNegocio
    {

        public List<EstadoStock> Listar()
        {
            List<EstadoStock> lista = new List<EstadoStock>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Select IdStockProducto, NombreStockProducto FROM EstadoStock");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {

                    EstadoStock aux = new EstadoStock((string)datos.Lector["NombreStockProducto"] , (int)datos.Lector["IdStockProducto"]);
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

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;
using negocio;

namespace negocio
{
    public class MetodoPagoNegocio
    {
        public List<MetodoPago> Listar()
        {
            List<MetodoPago> lista = new List<MetodoPago>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select IdMetodoPago, Nombre FROM MetodoPago");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    lista.Add(new MetodoPago((int)datos.Lector["IdMetodoPago"], (string)datos.Lector["Nombre"]));
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

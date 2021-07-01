using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;
using negocio;

namespace negocio
{
    public class ProveedorNegocio
    {
        public List<Proveedor> Listar()
        {
            List<Proveedor> lista = new List<Proveedor>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select IdProveedor, RazonSocialProveedor FROM Proveedor");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    lista.Add(new Proveedor((int)datos.Lector["IdProveedor"], (string)datos.Lector["RazonSocialProveedor"]));
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
    
        public int BuscarIdProveedor(string nombre)
        {
            int p = 0;
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select IdProveedor, RazonSocialProveedor FROM Proveedor");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    if (nombre == (string)datos.Lector["RazonSocialProveedor"])
                    {
                        p = (int)datos.Lector["IdProveedor"];
                    }
                }

                return p;
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

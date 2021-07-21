using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;


namespace negocio
{
    public class TipoFacturaNegocio
    {
        public List<TipoFactura> Listar()
        {
            List<TipoFactura> lista = new List<TipoFactura>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select IdTipoFactura, Nombre from TipoFactura");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    lista.Add(new TipoFactura((int)datos.Lector["IdTipoFactura"], (string)datos.Lector["Nombre"]));
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



        public void agregarTipo(string nueva)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string valores = "values('" + nueva + "')";
                datos.setearConsulta("insert into Tipo (Nombre) " + valores);
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

        public void eliminarTipo(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Delete From Tipo Where IdTipo = " + id);
                datos.ejectutarAccion();
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

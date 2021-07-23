using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class TipoNegocio
    {
        public List<Tipo> Listar()
        {
            List<Tipo> lista = new List<Tipo>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select IdTipo, Nombre, Estado from Tipo");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    if ((bool)datos.Lector["Estado"] == true)
                    {
                        lista.Add(new Tipo((int)datos.Lector["IdTipo"], (string)datos.Lector["Nombre"]));
                    }
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
                datos.setearConsulta("Update Tipo Set Estado = " + 0 + " where IdTipo = " + id);
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

        public bool existeTipo(string nombre)
        {
            bool bandera = false;
            int comparacion = 1;
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT Nombre From Tipo");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    comparacion = string.Compare((string)datos.Lector["Nombre"], nombre);
                    if (comparacion == 0)
                    {
                        bandera = true;
                    }
                }
                return bandera;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
                datos = null;
            }
        }

        public bool existeTipoDeBaja(string nombre)
        {
            bool bandera = false;
            int comparacion = 1;
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT Nombre From Tipo Where Estado = 0");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    comparacion = string.Compare((string)datos.Lector["Nombre"], nombre);

                    if (comparacion == 0)
                    {
                        bandera = true;
                    }

                }
                return bandera;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
                datos = null;
            }
        }

        public void ModificarTipoDeBaja(Tipo modificar)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update Tipo set Estado = @estado, Nombre = @nombre WHERE Nombre = @nombre");

                datos.setearParametro("@estado", modificar.Estado);
                datos.setearParametro("@nombre", modificar.Nombre);

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

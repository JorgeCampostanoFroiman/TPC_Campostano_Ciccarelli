using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class MarcaNegocio
    {
        public List<Marca> Listar()
        {
            List<Marca> lista = new List<Marca>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select IdMarca, Nombre, Estado from Marca");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    if ((bool)datos.Lector["Estado"] == true)
                    {
                        lista.Add(new Marca((int)datos.Lector["IdMarca"], (string)datos.Lector["Nombre"]));
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



        public void agregarMarca(string nueva)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string valores = "values('" + nueva + "')";
                datos.setearConsulta("insert into Marca (Nombre) " + valores);
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

        public void eliminarMarca(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Update Marca Set Estado = " + 0 + " where IdMarca = " + id);
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

        public void modificarMarca(Marca marca)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update Marca set Nombre = @nombre WHERE IdMarca = @id ");
                datos.setearParametro("@nombre", marca.Nombre);
                datos.setearParametro("@id", marca.IdMarca);
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

        public bool existeMarca(string nombre)
        {
                bool bandera = false;
                int comparacion = 1;
                AccesoDatos datos = new AccesoDatos();
                try
                {
                    datos.setearConsulta("SELECT Nombre From Marca");
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

        public bool existeMarcadeBaja(string nombre)
        {
            bool bandera = false;
            int comparacion = 1;
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT Nombre From Marca Where Estado = 0");
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


        public void ModificarMarcaDeBaja(Marca modificar)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update Marca set Estado = @estado, Nombre = @nombre WHERE Nombre = @nombre");

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

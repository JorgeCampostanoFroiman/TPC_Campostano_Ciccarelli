using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class UsuarioNegocio
    {
        public bool Loguear(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select IdUsuario, TipoUsuario FROM Usuario Where Email = @email AND Contraseña = @contraseña");
                datos.setearParametro("@email", usuario.Email);
                datos.setearParametro("@contraseña", usuario.Contraseña);

                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    usuario.IdUsuario = (int)datos.Lector["IdUsuario"];
                    usuario.TipoUsuario = (int)(datos.Lector["TipoUsuario"]) == 2 ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;
                    return true;
                }
                return false;
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

        public Usuario usuarioLogueado(string mail)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select Nombre, Apellido, Telefono, Email, Contraseña, TipoUsuario, Dni FROM Usuario Where Email = @email");
                datos.setearParametro("@email", mail);
                datos.ejecutarLectura();

                Usuario logueado = new Usuario();

                while (datos.Lector.Read()){
                    logueado.TipoUsuario = (int)(datos.Lector["TipoUsuario"]) == 2 ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;
                    logueado.Nombre = (string)datos.Lector["Nombre"];
                    logueado.Apellido = (string)datos.Lector["Apellido"];
                    logueado.Email = (string)datos.Lector["Email"];
                    logueado.Contraseña = (string)datos.Lector["Contraseña"];
                    logueado.Dni = (string)datos.Lector["Dni"];
                    if (datos.Lector["Telefono"] is System.DBNull)
                    {

                        logueado.Telefono = "No especificado";
                    }
                    else
                    {
                        logueado.Telefono = (string)datos.Lector["Telefono"];
                    }
                }

                return logueado;
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

        public bool ListarPorDNI(int dni)
        {
            bool bandera = false;
            int comparacion;
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT Dni From Usuario");
                datos.ejecutarLectura();
                
                while (datos.Lector.Read())
                {   
                    if (Convert.ToInt32((string)datos.Lector["Dni"]) == dni)
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

        public void Agregar (Usuario nuevo)
        {
                AccesoDatos datos = new AccesoDatos();
                try
                {
                    string valores = "values('" + nuevo.Nombre + "', '" + nuevo.Apellido + "', '" + nuevo.Telefono + "', '" + nuevo.Email + "', '" + nuevo.Contraseña + "', '" + nuevo.Dni + "')";
                    datos.setearConsulta("insert into Usuario (Nombre, Apellido, Telefono, Email, Contraseña, Dni) " + valores);

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
    }
}

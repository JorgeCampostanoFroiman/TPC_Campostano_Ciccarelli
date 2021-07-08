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

        /*aca modifico
       Lista todos los atributos de proveedor
       */
        public List<Proveedor> ListarProveedor()
        {
            List<Proveedor> listaProveedor = new List<Proveedor>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select IdProveedor, Estado, RazonSocialProveedor, CuitProveedor, Domicilio, Email, Telefono FROM Proveedor");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Proveedor aux = new Proveedor();
                    aux.IdProveedor = (int)datos.Lector["IdProveedor"];
                    aux.Estado = (bool)datos.Lector["Estado"];
                    aux.RazonSocialProveedor = (string)datos.Lector["RazonSocialProveedor"];
                    aux.CuitProveedor = (string)datos.Lector["CuitProveedor"];
                    aux.Domicilio = (string)datos.Lector["Domicilio"];
                    aux.Email = (string)datos.Lector["Email"];
                    aux.Telefono = (string)datos.Lector["Telefono"];

                    listaProveedor.Add(aux);
                }

                return listaProveedor;
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
        public void AgregarProveedor(Proveedor nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string valores = "values('" + nuevo.IdProveedor + "', '" + nuevo.Estado + "', '" + nuevo.RazonSocialProveedor + "', '" + nuevo.CuitProveedor + "', '" + nuevo.Domicilio + "', " + nuevo.Email + ", '" + nuevo.Telefono + "')";
                datos.setearConsulta("insert into Proveedor (IdProveedor, Estado, RazonSocialProveedor, CuitProveedor, Domicilio, Email, Telefono ) " + valores);

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
        public void modificarProveedor(Proveedor modificar)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update Producto set Estado = @estado, RazonSocialProveedor = @razonsocial, CuitProveedor = @cuitproveedor, Domicilio = @Domicilio, Email = @Email, Telefono = @telefono WHERE IdProveedor = @id");
                datos.setearParametro("@estado", modificar.Estado);
                datos.setearParametro("@razonsocial", modificar.RazonSocialProveedor);
                datos.setearParametro("@cuitproveedor", modificar.CuitProveedor);
                datos.setearParametro("@domicilio", modificar.Domicilio);
                datos.setearParametro("@email", modificar.Email);
                datos.setearParametro("@telefono", modificar.Telefono);
                datos.setearParametro("@id", modificar.IdProveedor);

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

        public void eliminar(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Delete From Proveedor Where IdProveedor = " + id);
                datos.ejectutarAccion();
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

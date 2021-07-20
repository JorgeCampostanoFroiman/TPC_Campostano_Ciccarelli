using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class ProductoNegocio
    {
       
        public List<Producto> Listar()
        {
            List<Producto> lista = new List<Producto>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Select P.IdProducto, P.Codigo, P.NombreProducto, M.Nombre AS Marca, T.Nombre AS Tipo, P.PrecioCompra, P.Stock, P.Ganancia, P.PrecioVenta, P.Descripcion, PV.RazonSocialProveedor, P.ImagenUrl FROM Producto AS P, Marca AS M, Tipo AS T, Proveedor AS PV WHERE P.IdMarca = M.IdMarca AND P.IdTipo = T.IdTipo AND P.IdProveedor = PV.IdProveedor");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Producto aux = new Producto();
                    aux.IdProducto = (int)datos.Lector["IdProducto"];
                    aux.proveedor = new Proveedor((string)datos.Lector["RazonSocialProveedor"]);
                    aux.marca = new Marca((string)datos.Lector["Marca"]);
                    aux.tipo = new Tipo((string)datos.Lector["Tipo"]);
                    aux.precioCompra = (decimal)datos.Lector["PrecioCompra"];
                    aux.precioVenta = (decimal)datos.Lector["PrecioVenta"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.NombreProducto = (string)datos.Lector["NombreProducto"];
                    aux.Stock = (int)datos.Lector["Stock"];
                    aux.Ganancia = ((int)Convert.ToInt64(datos.Lector["Ganancia"]));
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.imagenUrl = (string)datos.Lector["ImagenUrl"];                

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

        public List<Producto> ListarProductoPorIdProveedor(int id)
        {
            List<Producto> listaProductoProveedor = new List<Producto>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT IdProducto, Codigo, NombreProducto From Producto Where IdProveedor = " + id);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Producto aux = new Producto();
                    aux.IdProducto = (int)datos.Lector["IdProducto"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.NombreProducto = (string)datos.Lector["NombreProducto"];

                    listaProductoProveedor.Add(aux);
                }

                return listaProductoProveedor;
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

        public List<Producto> ListarPorIdProveedor(int id)
        {
            List<Producto> listaProductoProveedor = new List<Producto>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT IdProducto, Codigo From Producto Where IdProveedor = " + id);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Producto aux = new Producto();
                    aux.IdProducto = (int)datos.Lector["IdProducto"];
                    aux.marca.IdMarca = (int)datos.Lector["IdMarca"];
                    aux.tipo.IdTipo = (int)datos.Lector["IdTipo"];
                    aux.precioCompra = (decimal)datos.Lector["PrecioCompra"];
                    aux.precioVenta = (decimal)datos.Lector["PrecioVenta"];
                    aux.proveedor.IdProveedor = (int)datos.Lector["IdProveedor"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.NombreProducto = (string)datos.Lector["NombreProducto"];
                    aux.Stock = (int)datos.Lector["Stock"];
                    aux.Ganancia = ((int)Convert.ToInt64(datos.Lector["Ganancia"]));
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.imagenUrl = (string)datos.Lector["ImagenUrl"];

                    listaProductoProveedor.Add(aux);
                }

                return listaProductoProveedor;
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


        public bool ListarPorCodigo(string codigo)
        {
            bool bandera = false;
            int comparacion = 1;
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT Codigo From Producto");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    comparacion = string.Compare((string)datos.Lector["Codigo"], codigo);
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

        public void Agregar(Producto nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string valores = "values('" + nuevo.Codigo + "', '" + nuevo.NombreProducto + "', '" + nuevo.marca.IdMarca + "', '" + nuevo.tipo.IdTipo + "', '" + nuevo.precioCompra + "', " + nuevo.Stock + ", '" + nuevo.Ganancia + "', '" + nuevo.precioVenta + "', '" + nuevo.Descripcion + "', '" + nuevo.proveedor.IdProveedor + "', '" + nuevo.imagenUrl + "')";
                datos.setearConsulta("insert into Producto (Codigo, NombreProducto, IdMarca, IdTipo, PrecioCompra, Stock, Ganancia, PrecioVenta, Descripcion,IdProveedor, ImagenUrl ) " + valores);

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

        public void modificar(Producto modificar)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update Producto set Codigo = @codigo, NombreProducto = @nombre, IdMarca = @idMarca, IdTipo = @idTipo, PrecioCompra = @precioCompra, Stock = @stock, Ganancia = @ganancia, PrecioVenta = @precioVenta, Descripcion = @descripcion, IdProveedor = @idProveedor, ImagenUrl = @imagenUrl WHERE IdProducto = @id");
                
                datos.setearParametro("@codigo", modificar.Codigo);
                datos.setearParametro("@nombre", modificar.NombreProducto);
                datos.setearParametro("@idMarca", modificar.marca.IdMarca);
                datos.setearParametro("@idTipo", modificar.tipo.IdTipo);
                datos.setearParametro("@precioCompra", modificar.precioCompra);
                datos.setearParametro("@stock", modificar.Stock);
                datos.setearParametro("@ganancia", modificar.Ganancia);
                datos.setearParametro("@precioVenta", modificar.precioVenta);
                datos.setearParametro("@descripcion", modificar.Descripcion);
                datos.setearParametro("@idProveedor", modificar.proveedor.IdProveedor);
                datos.setearParametro("@imagenUrl", modificar.imagenUrl);
                datos.setearParametro("@id", modificar.IdProducto);
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
                datos.setearConsulta("Delete From Producto Where IdProducto = " + id);
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

        public decimal obtenerPrecio (int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT PrecioCompra from Producto Where IdProducto = " + id);
                datos.ejectutarAccion();
                decimal aux = (decimal)datos.Lector["PrecioCompra"];
                return aux;
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

    }
}

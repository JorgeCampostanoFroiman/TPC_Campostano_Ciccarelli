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
                datos.setearConsulta("Select P.IdProducto, P.Codigo, M.Nombre AS Marca, T.Nombre AS Tipo, P.PrecioCompra, P.Stock, P.Ganancia, P.PrecioVenta, P.Descripcion, PV.RazonSocialProveedor, P.ImagenUrl FROM Producto AS P, Marca AS M, Tipo AS T, Proveedor AS PV WHERE P.IdMarca = M.IdMarca AND P.IdTipo = T.IdTipo AND P.IdProveedor = PV.IdProveedor");
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
        public List<Producto> ListarPorIdProveedor(int id)
        {
            List<Producto> listaProductoProveedor = new List<Producto>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT From Producto Where IdProveedor = " + id);
                datos.ejectutarAccion();
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

    }
}

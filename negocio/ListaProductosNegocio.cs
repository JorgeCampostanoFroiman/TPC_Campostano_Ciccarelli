using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
   
      public class ListaProductosNegocio
      {
            public List<ListaProductos> ListarProductosCompra(int id)
            {
                List<ListaProductos> lista = new List<ListaProductos>();
                AccesoDatos datos = new AccesoDatos();
                try
                {
                    datos.setearConsulta("select ListaProductos.IdProducto, ListaProductos.Cantidad, ListaProductos.Subtotal, ListaProductos.IdNumeroDeCompra, Producto.PrecioCompra, Producto.Codigo, Producto.NombreProducto from ListaProductos inner join Producto on ListaProductos.IdProducto = Producto.IdProducto and ListaProductos.IdNumeroDeCompra = " + id);
                    datos.ejecutarLectura();
                    while (datos.Lector.Read())
                    {
                        ListaProductos aux = new ListaProductos();
                        aux.ItemArt = new Producto(((int)datos.Lector["IdProducto"]));
                        aux.Cantidad = (int)datos.Lector["Cantidad"];
                        aux.Subtotal = (decimal)datos.Lector["Subtotal"];
                        aux.ItemArt.NombreProducto = (string)datos.Lector["NombreProducto"];
                        aux.ItemArt.precioCompra = (decimal)datos.Lector["PrecioCompra"];
                        aux.ItemArt.Codigo = (string)datos.Lector["Codigo"];

                    if (datos.Lector["IdNumeroDecompra"] is System.DBNull)
                    {
                        aux.IdNumeroDeCompra = 0;
                    }
                    else
                    {
                        aux.IdNumeroDeCompra = (int)datos.Lector["IdNumeroDeCompra"];
                    }
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

            public List<ListaProductos> ListarProductosVenta(int id)
            {
                List<ListaProductos> lista = new List<ListaProductos>();
                AccesoDatos datos = new AccesoDatos();
                try
                {
                    datos.setearConsulta("select ListaProductos.IdProducto, ListaProductos.Cantidad, ListaProductos.Subtotal, ListaProductos.IdNumeroDeVenta, Producto.PrecioVenta, Producto.Codigo, Producto.Stock, Producto.NombreProducto from ListaProductos inner join Producto on ListaProductos.IdProducto = Producto.IdProducto and ListaProductos.IdNumeroDeVenta = " + id);
                    datos.ejecutarLectura();
                    while (datos.Lector.Read())
                    {
                        ListaProductos aux = new ListaProductos();
                        aux.ItemArt = new Producto(((int)datos.Lector["IdProducto"]));
                        aux.Cantidad = (int)datos.Lector["Cantidad"];
                        aux.Subtotal = (decimal)datos.Lector["Subtotal"];
                        aux.ItemArt.NombreProducto = (string)datos.Lector["NombreProducto"];
                        aux.ItemArt.precioVenta = (decimal)datos.Lector["PrecioVenta"];
                        aux.ItemArt.Codigo = (string)datos.Lector["Codigo"];
                        aux.ItemArt.Stock = (int)datos.Lector["Stock"];

                    if (datos.Lector["IdNumeroDeVenta"] is System.DBNull)
                    {
                        aux.IdNumeroDeCompra = 0;
                    }
                    else
                    {
                        aux.IdNumeroDeCompra = (int)datos.Lector["IdNumeroDeVenta"];
                    }
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


            public void AgregarListaCompra(List<ListaProductos> listaproductos, int ultimonumerocompra)
            {
                AccesoDatos datos = new AccesoDatos();
                try
                {
                    foreach (ListaProductos item in listaproductos)
                    {
                        ListaProductos aux = new ListaProductos();
                        aux.IdNumeroDeCompra = ultimonumerocompra;
                        string valores = "values('" + item.ItemArt.IdProducto + "', '" + item.Cantidad + "', '" + item.Subtotal + "', '" + aux.IdNumeroDeCompra + "')";
                        datos.setearConsulta("insert into ListaProductos (IdProducto, Cantidad, Subtotal, IdNumeroDeCompra) " + valores);
                        datos.ejectutarAccion();
                        datos.cerrarConexion();
                    }

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

        public void AgregarStockCompra(int cantidad, int id, int stockminimo)
        {
            AccesoDatos datos = new AccesoDatos();


            try
            {
                int estadoStock = 0;
                int stock = 0;
                datos.setearConsulta("Select IdProducto, Stock FROM Producto WHERE IdProducto = " + id);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    stock = (int)datos.Lector["Stock"] + cantidad;
                }
                datos.cerrarConexion();


                if (stock > stockminimo)
                {
                    estadoStock = 1;
                }
                else if (stock <= stockminimo)
                {
                    estadoStock = 2;

                }
                else
                {
                    estadoStock = 3;
                }

                datos.setearConsulta("update Producto set Stock = @stack, IdEstadoStock = @estadoStock Where IdProducto = @ide");
                datos.setearParametro("@stack", stock);
                datos.setearParametro("@ide", id);
                datos.setearParametro("@estadoStock", estadoStock);
                datos.ejectutarAccion();
                datos.cerrarConexion();
               
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

        public void AgregarListaVenta(List<ListaProductos> listaproductos, int ultimonumeroventa)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                foreach (ListaProductos item in listaproductos)
                {
                    ListaProductos aux = new ListaProductos();
                    aux.IdNumeroDeVenta = ultimonumeroventa;
                    string valores = "values('" + item.ItemArt.IdProducto + "', '" + item.Cantidad + "', '" + item.Subtotal + "', '" + aux.IdNumeroDeVenta + "')";
                    datos.setearConsulta("insert into ListaProductos (IdProducto, Cantidad, Subtotal, IdNumeroDeVenta) " + valores);
                    datos.ejectutarAccion();
                    datos.cerrarConexion();
                }

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

        public void QuitarStockVenta(int cantidad, int id, int stockminimo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                int estadoStock = 0;
                int stock = 0;
                datos.setearConsulta("Select IdProducto, Stock FROM Producto WHERE IdProducto = " + id);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    stock = (int)datos.Lector["Stock"] - cantidad;
                }
                datos.cerrarConexion();

                if (stock > stockminimo)
                {
                    estadoStock = 1;
                }
                else if (stock <= stockminimo)
                {
                    estadoStock = 2;

                }
                else
                {
                    estadoStock = 3;
                }

                datos.setearConsulta("update Producto set Stock = @stack, IdEstadoStock = @estadoStock Where IdProducto = @ide");
                datos.setearParametro("@stack", stock);
                datos.setearParametro("@ide", id);
                datos.setearParametro("@estadoStock", estadoStock);
                datos.ejectutarAccion();
                datos.cerrarConexion();

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


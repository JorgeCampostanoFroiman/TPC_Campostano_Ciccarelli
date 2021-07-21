﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
   
      public class ListaProductosNegocio
        {
            public List<ListaProductos> Listar()
            {
                List<ListaProductos> lista = new List<ListaProductos>();
                AccesoDatos datos = new AccesoDatos();
                try
                {
                    datos.setearConsulta("Select IdListaProductos, P.IdProducto as Producto, Cantidad, Subtotal, IdNumeroDeCompra, IdNumeroDeVenta FROM ListaProductos AS LP, Producto AS P WHERE P.IdProducto = LP.IdProducto");
                    datos.ejecutarLectura();
                    while (datos.Lector.Read())
                    {
                        ListaProductos aux = new ListaProductos();
                        aux.IdListaProductos = (int)datos.Lector["IdListaProductos"];
                        aux.ItemArt = new Producto((int)datos.Lector["Producto"]);
                        aux.Cantidad = (int)datos.Lector["Cantidad"];
                        aux.Subtotal = (int)datos.Lector["Subtotal"];
                        aux.IdNumeroDeCompra = (int)datos.Lector["IdNumeroDeCompra"];
                        aux.IdNumeroDeVenta = (int)datos.Lector["IdNumeroDeVenta"];

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


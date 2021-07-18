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
                    aux.ItemArt= new Producto((int)datos.Lector["Producto"]);
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

    }
}

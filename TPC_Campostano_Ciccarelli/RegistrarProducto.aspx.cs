using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace TPC_Campostano_Ciccarelli
{
    public partial class RegistrarProducto : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
           
            MarcaNegocio marcaNegocio = new MarcaNegocio();
            TipoNegocio tipoNegocio = new TipoNegocio();
            ProveedorNegocio proveedorNegocio = new ProveedorNegocio();

            if (!IsPostBack)
            {
                DDLMarca.DataSource = marcaNegocio.Listar();
                DDLMarca.DataTextField = "Nombre";
                DDLMarca.DataValueField = "IdMarca";    
                DDLMarca.DataBind();

                DDLProveedor.DataSource = proveedorNegocio.Listar();
                DDLProveedor.DataTextField = "RazonSocialProveedor";
                DDLProveedor.DataValueField = "IdProveedor";
                DDLProveedor.DataBind();

                DDLTipo.DataSource = tipoNegocio.Listar();
                DDLTipo.DataTextField = "Nombre";
                DDLTipo.DataValueField = "IdTipo";
                DDLTipo.DataBind();

            }

        }

        protected void BotonAceptar_Click(object sender, EventArgs e)
        {
            ProductoNegocio productoNegocio = new ProductoNegocio();
            Page.Validate();
            if (!Page.IsValid)
                return;
            else
            {
                
                tPrecioVenta.Text = Convert.ToString(((Convert.ToInt32(tPrecioCompra.Text) * Convert.ToInt32(tGanancia.Text)) / 100)+ Convert.ToInt32(tPrecioCompra.Text));
                
                if (productoNegocio.ListarPorCodigo(tCodigo.Text) == false)
                {

                   
                    Producto producto = new Producto();
                    producto.Codigo = tCodigo.Text;
                    producto.NombreProducto = tNombre.Text;
                    producto.precioCompra = Convert.ToDecimal(tPrecioCompra.Text);
                    producto.Stock = Convert.ToInt32(tStock.Text);
                    producto.Ganancia = Convert.ToInt16(tGanancia.Text);
                    producto.precioVenta = Convert.ToDecimal(tPrecioVenta.Text);
                    producto.Descripcion = tDesc.Text;



                    ///cambio del estado de stock
                    ///
                    
                    int stockminimo = (int)Session["StockMinimo"];
   
                    if (producto.Stock > stockminimo)
                    {
                        producto.estadostock = new EstadoStock();
                        producto.estadostock.IdEstadoStockProducto = 1;
                    } else if(producto.Stock <= stockminimo)
                    {
                        producto.estadostock = new EstadoStock();
                        producto.estadostock.IdEstadoStockProducto = 2;

                    }
                    else
                    {
                    
                    producto.estadostock = new EstadoStock();
                    producto.estadostock.IdEstadoStockProducto = 3;
                    }
                   


                    ///fin cambio del estado de stock
                    producto.marca = new Marca();
                    producto.marca.IdMarca = int.Parse(DDLMarca.SelectedItem.Value);

                    producto.tipo = new Tipo();
                    producto.tipo.IdTipo = int.Parse(DDLTipo.SelectedItem.Value);

                    producto.proveedor = new Proveedor();
                    producto.proveedor.IdProveedor = int.Parse(DDLProveedor.SelectedItem.Value);




                    productoNegocio.Agregar(producto);

                }
                else if(productoNegocio.ListarPorEstado(tCodigo.Text) == true)
                       
                {
                    Producto producto = new Producto();
                    producto.Codigo = tCodigo.Text;
                    producto.NombreProducto = tNombre.Text;
                    producto.precioCompra = Convert.ToDecimal(tPrecioCompra.Text);
                    producto.Stock = Convert.ToInt32(tStock.Text);
                    producto.Ganancia = Convert.ToInt16(tGanancia.Text);
                    producto.precioVenta = Convert.ToDecimal(tPrecioVenta.Text);
                    producto.Descripcion = tDesc.Text;
                    producto.Estado = 1;



                    ///cambio del estado de stock
                    ///

                    int stockminimo = (int)Session["StockMinimo"];

                    if (producto.Stock > stockminimo)
                    {
                        producto.estadostock = new EstadoStock();
                        producto.estadostock.IdEstadoStockProducto = 1;
                    }
                    else if (producto.Stock <= stockminimo)
                    {
                        producto.estadostock = new EstadoStock();
                        producto.estadostock.IdEstadoStockProducto = 2;

                    }
                    else
                    {

                        producto.estadostock = new EstadoStock();
                        producto.estadostock.IdEstadoStockProducto = 3;
                    }



                    ///fin cambio del estado de stock
                    producto.marca = new Marca();
                    producto.marca.IdMarca = int.Parse(DDLMarca.SelectedItem.Value);

                    producto.tipo = new Tipo();
                    producto.tipo.IdTipo = int.Parse(DDLTipo.SelectedItem.Value);

                    producto.proveedor = new Proveedor();
                    producto.proveedor.IdProveedor = int.Parse(DDLProveedor.SelectedItem.Value);




                    productoNegocio.Agregar(producto);

                }
                else
                {
                    return;
                }               
            }
        }

        /// VER SI REALIZA LO NECESARIO SINO SACAR
        protected void DDLMarca_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

    }
}
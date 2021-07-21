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
    public partial class ModificarProducto : System.Web.UI.Page
    {
        MarcaNegocio marcaNegocio = new MarcaNegocio();
        TipoNegocio tipoNegocio = new TipoNegocio();
        ProveedorNegocio proveedorNegocio = new ProveedorNegocio();
        ProductoNegocio productoNegocio = new ProductoNegocio();
        public List<Producto> prod;


        protected void Page_Load(object sender, EventArgs e)
        {


            try
            {
                if (!IsPostBack)
                {

                    List<Marca> listamarca = marcaNegocio.Listar();
                    Session["ListaMarca"] = listamarca;


                    DDLMarca.DataSource = listamarca;
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


                    int id = int.Parse(Request.QueryString["id"]);
                    List<Producto> listado = (List<Producto>)Session["ListaProductos"];
                    Producto seleccionado = listado.Find(x => x.IdProducto == id);

                    tituloProducto.Text = "Nombre anterior: (" + seleccionado.NombreProducto + ")";




                    /*
                    textPrecioCompra.Text = "PrecioCompra: " + Convert.ToString(seleccionado.PrecioCompra);
                    labelMarca.Text = "Marca: " + Convert.ToString(seleccionado.marca);
                    labelPrecio.Text = "Precio: " + Convert.ToString(seleccionado.Precio);
                    img.ImageUrl = seleccionado.ImagenUrl;
                    /
                    /productoNegocio.Agregar(producto);*/
                }
            }
            catch (Exception)
            {
                Response.Redirect("Error.aspx");
            }


        }

        protected void BotonAceptar_Click(object sender, EventArgs e)
        {
            prod = productoNegocio.Listar();
            Producto modif = prod.Find(x => x.IdProducto.ToString() == Request.QueryString["id"]);

            textPrecioVenta.Text = Convert.ToString(((Convert.ToInt32(textPrecioCompra.Text) * Convert.ToInt32(textGanancia.Text)) / 100) + Convert.ToInt32(textPrecioCompra.Text));

            modif.Codigo = textCodigo.Text;
            modif.NombreProducto = textNombre.Text;
            modif.precioCompra = Convert.ToDecimal(textPrecioCompra.Text);
            modif.Stock = Convert.ToInt32(textStock.Text);
            modif.Ganancia = Convert.ToInt16(textGanancia.Text);
            modif.Descripcion = textDesc.Text;
            modif.precioVenta = Convert.ToDecimal(textPrecioVenta.Text);
            ///cambio del estado de stock
            ///

            int stockminimo = (int)Session["StockMinimo"];

            if (modif.Stock > stockminimo)
            {
                modif.estadostock = new EstadoStock();
                modif.estadostock.IdEstadoStockProducto = 1;
            }
            else if (modif.Stock <= stockminimo)
            {
                modif.estadostock = new EstadoStock();
                modif.estadostock.IdEstadoStockProducto = 2;

            }
            else
            {

                modif.estadostock = new EstadoStock();
                modif.estadostock.IdEstadoStockProducto = 3;
            }

            ///fin cambio del estado de stock

            modif.marca = new Marca();
            modif.marca.IdMarca = int.Parse(DDLMarca.SelectedItem.Value);

            modif.tipo = new Tipo();
            modif.tipo.IdTipo = int.Parse(DDLTipo.SelectedItem.Value);

            modif.proveedor = new Proveedor();
            modif.proveedor.IdProveedor = int.Parse(DDLProveedor.SelectedItem.Value);

            productoNegocio.modificar(modif);


        }
    }
}
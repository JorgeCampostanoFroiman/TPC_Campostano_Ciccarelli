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
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                MarcaNegocio marcaNegocio = new MarcaNegocio();
                TipoNegocio tipoNegocio = new TipoNegocio();
                ProveedorNegocio proveedorNegocio = new ProveedorNegocio();


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

                /* trae la lista de marca y muestra la seleccionada*/
                string nombremarca;
                nombremarca = seleccionado.marca.Nombre;
                DDLMarca.SelectedIndex = -1;
                DDLMarca.Items.FindByText(nombremarca).Selected = true;

                string nombretipo;
                nombretipo = seleccionado.tipo.Nombre;
                DDLTipo.SelectedIndex = -1;
                DDLTipo.Items.FindByText(nombretipo).Selected = true;

                string nombreproveedor;
                nombreproveedor = seleccionado.proveedor.RazonSocialProveedor;
                DDLProveedor.SelectedIndex = -1;
                DDLProveedor.Items.FindByText(nombreproveedor).Selected = true;

                textCodigo.Text = seleccionado.Codigo;
                textNombre.Text = seleccionado.NombreProducto;

                /* DDLMarca.DataTextField = seleccionado.marca.Nombre;
                 DDLTipo.Text = seleccionado.tipo.Nombre;
                DDLProveedor.Text = seleccionado.proveedor.RazonSocialProveedor;
                */

                textPrecioCompra.Text = Convert.ToString(seleccionado.precioCompra);
                textStock.Text = Convert.ToString(seleccionado.Stock);
                textGanancia.Text = Convert.ToString(seleccionado.Ganancia);
                textPrecioVenta.Text = Convert.ToString(seleccionado.precioVenta);
                textDesc.Text = seleccionado.Descripcion;



                /*
                textPrecioCompra.Text = "PrecioCompra: " + Convert.ToString(seleccionado.PrecioCompra);
                labelMarca.Text = "Marca: " + Convert.ToString(seleccionado.marca);
                labelPrecio.Text = "Precio: " + Convert.ToString(seleccionado.Precio);
                img.ImageUrl = seleccionado.ImagenUrl;
                */
                /*productoNegocio.Agregar(producto);*/
            }
            catch (Exception)
            {
                Response.Redirect("Error.aspx");
            }



        }
    }
}
﻿using System;
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
                
                textPrecioVenta.Text = Convert.ToString(((Convert.ToInt32(textPrecioCompra.Text) * Convert.ToInt32(textGanancia.Text)) / 100)+ Convert.ToInt32(textPrecioCompra.Text));
                
                if (productoNegocio.ListarPorCodigo(textCodigo.Text) == false)
                {
                    lblOutput.Text = "Funcionaría en principio";
                   
                    Producto producto = new Producto();
                    producto.Codigo = textCodigo.Text;
                    producto.NombreProducto = textNombre.Text;
                    producto.precioCompra = Convert.ToDecimal(textPrecioCompra.Text);
                    producto.Stock = Convert.ToInt32(textStock.Text);
                    producto.Ganancia = Convert.ToInt16(textGanancia.Text);
                    producto.precioVenta = Convert.ToDecimal(textPrecioVenta.Text);
                    producto.Descripcion = textDesc.Text;
                    
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
                    lblOutput.Text = " El codigo de producto ya existe";
                    return;
                }               
            }
        }

        /// VER SI REALIZA LO NECESARIO SINO SACAR
        protected void DDLMarca_SelectedIndexChanged(object sender, EventArgs e)
        {
          
        }

        protected void BtnGuardarMarca_Click(object sender, EventArgs e)
        {   
            MarcaNegocio marcaNegocio = new MarcaNegocio();
            Session.Add("marcaAgregada", textAgregarMarca.Text);
            marcaNegocio.agregarMarca("marcaAgregada");

        }
    }
}
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
    public partial class RegistrarProveedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void btnRegistrarProveedor_Click(object sender, EventArgs e)
        {
            ProveedorNegocio proveedorNegocio = new ProveedorNegocio();
            Proveedor nuevo = new Proveedor();
            try
            {

                if (proveedorNegocio.existeProveedor(txtCuit.Text) == true)
                {
                    proveedorAgregado.Text = "El cuit de Proveedor ya está en uso";

                    if (proveedorNegocio.existeProveedorDeBaja(txtCuit.Text) == true)
                    {
                        nuevo.RazonSocialProveedor = txtRazonSocial.Text;
                        nuevo.Email = txtEmail.Text;
                        nuevo.CuitProveedor = txtCuit.Text;
                        nuevo.Domicilio = txtDomicilio.Text;
                        nuevo.Telefono = txtTelefono.Text;
                        nuevo.Estado = Convert.ToBoolean(1);

                        proveedorNegocio.modificarProveedorExistente(nuevo);

                        proveedorAgregado.Text = "El proveedor ya existía, ha sido dado de alta con los nuevos datos";
                    }

                }
                else
                {
                    nuevo.RazonSocialProveedor = txtRazonSocial.Text;
                    nuevo.Email = txtEmail.Text;
                    nuevo.CuitProveedor = txtCuit.Text;
                    nuevo.Domicilio = txtDomicilio.Text;
                    nuevo.Telefono = txtTelefono.Text;

                    proveedorNegocio.AgregarProveedor(nuevo);

                    proveedorAgregado.Text = "Proveedor agregado exitosamente.";
                }

                //}
                //else if (proveedorNegocio.existeProveedorDeBaja(txtCuit.Text) == true)
                //{
                
                //}
                //else
                //{
                //    proveedorAgregado.Text = "El proveedor ya existe y está dado de alta. Regresando..";
                //    return;
                //}


            }
            catch (Exception)
            {
                Session.Add("Error", "Hubo un problema registrando el proveedor, lo sentimos!");
                Response.Redirect("Error.aspx");
            }
        }
    }
}
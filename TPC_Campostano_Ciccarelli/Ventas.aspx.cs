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
	public partial class Ventas : System.Web.UI.Page
	{
        public List<Venta> lista;
        public void Page_Load(object sender, EventArgs e)
        {

            if ((Session["usuario"] == null))
            {
                Session.Add("error", "No tienes permisos para ver este sitio");
                Response.Redirect("Error.aspx");
            }

            VentaNegocio negocio = new VentaNegocio();
            try
            {
                lista = negocio.Listar();
                Session.Add("ListaVentas", lista);
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }

            ///generear pdf de venta
            ///
          /*  var pdfPrintOptions = new PdfPrintOptions
            {
                Footer = new SimpleHeaderFooter
                {
                    FontFamily = "Arial",
                    FontSize = 11,
                    LeftText = "Demo",
                    RightText = "{page}"
                }

            };

            IronPdf.AspxToPdf.RenderThisPageAsPdf(IronPdf.AspxToPdf.FileBehavior.Attachment, printOptions: pdfPrintOptions);
*/
        }
    }
}
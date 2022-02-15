using Proyecto3Capas.BLL;
using Proyecto3Capas.Util;
using Proyecto3Capas.VO;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto3Capas.Catalogos.Vendedores
{
    public partial class EdicionVendedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Id"] == null)
                {
                    Response.Redirect("ListadoVendedores.aspx");
                }
                else
                {
                    int IdVendedor = int.Parse(Request.QueryString["Id"]);
                    VendedorVO vendedor = BLLVendedores.GetVendedoresByID(IdVendedor);
                    if (vendedor.IdVendedor == IdVendedor)
                    {
                        txtNombre.Text = vendedor.Nombre;
                        txtApPaterno.Text = vendedor.ApPaterno;
                        txtApMaterno.Text = vendedor.ApMaterno;
                        txtPuesto.Text = vendedor.Puesto;
                    }
                    else
                    {
                        Response.Redirect("ListadoVendedores.aspx");
                    }
                }
            }
        }

        protected void btnSubeImagen_Click(object sender, EventArgs e)
        {
            if (SubeImagen.Value != "")
            {

                string FileName =
                    Path.GetFileName(SubeImagen.PostedFile.FileName);


                string FileExt =
                    Path.GetExtension(FileName).ToLower();

                if ((FileExt != ".jpg") && (FileExt != ".png"))
                {

                    UtilControls.SweetBox("Error!", "Seleccione un archivo valido de imagen", "error", this.Page, this.GetType());
                }
                else
                {

                    string pathDir =
                        Server.MapPath("~/Imagenes/Vendedor/");
                    if (!Directory.Exists(pathDir))
                    {

                        Directory.CreateDirectory(pathDir);
                    }

                    SubeImagen.PostedFile.SaveAs(pathDir + FileName);
                    string urlfoto = "/Imagenes/Vendedor/" + FileName;
                    urlFoto.InnerText = urlfoto;
                    imgFotoChofer.ImageUrl = urlfoto;
                    btnGuardar.Visible = true;
                }
            }
            else
            {

                UtilControls.SweetBox("Error!", "Debes subir un archivo", "error", this.Page, this.GetType());
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                int id = int.Parse(Request.QueryString["Id"]);
                string urlfoto = urlFoto.InnerText;
                BLLVendedores.UpdVendedor(id, null, null, null, null, urlfoto);
                UtilControls.SweetBoxConfirm("Exito!", "Actualizada foto del empleado", "success", "ListadoVendedores.aspx", this.Page, this.GetType());
            }
            catch (Exception ex)
            {
                UtilControls.SweetBox("Error!", ex.ToString(), "error", this.Page, this.GetType());
            }
        }
    }
}
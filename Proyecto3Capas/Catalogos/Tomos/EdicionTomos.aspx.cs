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

namespace Proyecto3Capas.Catalogos.Tomos
{
    public partial class EdicionTomos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Id"] == null)
                {
                    Response.Redirect("ListadoTomos.aspx");
                }
                else
                {
                    int IdTomo = int.Parse(Request.QueryString["Id"]);
                    TomosVO Tomo = BLLTomos.GetTomoByID(IdTomo);
                    if (Tomo.IdTomo == IdTomo)
                    {
                        txtTitulo.Text = Tomo.Titulo;
                        txtGenero.Text = Tomo.Genero;

                    }
                    else
                    {
                        Response.Redirect("ListadoTomos.aspx");
                    }
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                int id = int.Parse(Request.QueryString["Id"]);
                float Precio = float.Parse(txtPrecio.Text);
                int Stock = int.Parse(txtStock.Text);
                string UrlFoto = urlFoto.InnerText;

                BLLTomos.UpdTomos(id, null, Precio, Stock, null, UrlFoto);
                UtilControls.SweetBoxConfirm("Exito!", "Tomo agregado exitosamente", "success", "ListadoTomos.aspx", this.Page, this.GetType());
            }
            catch (Exception ex)
            {
                UtilControls.SweetBox("Error!", ex.ToString(), "error", this.Page, this.GetType());
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
                        Server.MapPath("~/Imagenes/Tomos/");
                    if (!Directory.Exists(pathDir))
                    {
                        
                        Directory.CreateDirectory(pathDir);
                    }
                    
                    SubeImagen.PostedFile.SaveAs(pathDir + FileName);
                    string urlfoto = "/Imagenes/Tomos/" + FileName;
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
    }
}
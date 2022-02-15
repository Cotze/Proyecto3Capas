using Proyecto3Capas.BLL;
using Proyecto3Capas.Util;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Proyecto3Capas.enumeradores;

namespace Proyecto3Capas.Catalogos.Vendedores
{
    public partial class AltaVendedores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UtilControls.EnumToListBox(typeof(Tipo), DDLTipoPuesto, false);
                DDLTipoPuesto.DataBind();
                DDLTipoPuesto.Items.Insert(0, new ListItem("Selecciona un puesto", ""));
            }
        }

        protected void btnSubeImagen_Click(object sender, EventArgs e)
        {
            //Validar que el usuario haya sleccionado un archivo
            if (SubeImagen.Value != "")
            {
                //asignar a una variable el nombre del archivo seleccionado
                string FileName =
                    Path.GetFileName(SubeImagen.PostedFile.FileName);

                //validar que el archivo sea .jpg o .png
                string FileExt =
                    Path.GetExtension(FileName).ToLower();

                if ((FileExt != ".jpg") && (FileExt != ".png"))
                {
                    //mensaje de error
                    UtilControls.SweetBox("Error!", "Seleccione un archivo valido de imagen", "error", this.Page, this.GetType());
                }
                else
                {
                    //Verifivamos que el directorio deonde vamos
                    //guardar el archivo exista
                    string pathDir =
                        Server.MapPath("~/Imagenes/Vendedor/");
                    if (!Directory.Exists(pathDir))
                    {
                        //Crea el arbol completo
                        Directory.CreateDirectory(pathDir);
                    }
                    //Guardamos la imagen en el directorio correspondiente
                    SubeImagen.PostedFile.SaveAs(pathDir + FileName);
                    string urlfoto = "/Imagenes/Vendedor/" + FileName;
                    urlFoto.InnerText = urlfoto;
                    imgFotoChofer.ImageUrl = urlfoto;
                    btnGuardar.Visible = true;
                }
            }
            else
            {
                //Enviar mensaje de que no se puede ser vacio
                //mensaje de error
                UtilControls.SweetBox("Error!", "Debes subir un archivo", "error", this.Page, this.GetType());
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string nombre = txtNombre.Text;
                string apPaterno = txtApPaterno.Text;
                string apMaterno = txtApMaterno.Text;;
                string TipoCamion = DDLTipoPuesto.SelectedValue;
                string urlfoto = urlFoto.InnerText;


                BLLVendedores.InsVendedores(nombre, apPaterno, apMaterno, TipoCamion, urlfoto);
                UtilControls.SweetBoxConfirm("Exito!", "Vendedor agregado exitosamente", "success", "ListadoVendedores.aspx", this.Page, this.GetType());
            }
            catch (Exception ex)
            {
                UtilControls.SweetBox("Error!", ex.ToString(), "error", this.Page, this.GetType());
            }
        }
    }
}
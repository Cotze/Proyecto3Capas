using Proyecto3Capas.BLL;
using Proyecto3Capas.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Proyecto3Capas.enumeradores;

namespace Proyecto3Capas.Catalogos.Tomos
{
    public partial class ListadoTomos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    RefrescarGrid();
                }
                catch (Exception ex)
                {
                    //Poner un mensaje
                    throw ex;
                }
            }
        }

        private void RefrescarGrid()
        {
            GVTomos.DataSource = BLLTomos.GetLstTomos(null);

            GVTomos.DataBind();
        }

        protected void GVTomos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string IdTomo = GVTomos.DataKeys[e.RowIndex].Values["IdTomo"].ToString();
            string Resultado = BLLTomos.DelTomos(int.Parse(IdTomo));
            if (Resultado == "1")
            {
                UtilControls.SweetBox("Tomo eliminado con éxito", "", "success", this.Page, this.GetType());
                RefrescarGrid();
            }
            else if (Resultado == "0")
            {
                UtilControls.SweetBox("El Tomo no pudo ser eliminado", "Los tomos NO DISPONIBLES no pueden ser eliminados", "error", this.Page, this.GetType());
            }
        }

        protected void GVTomos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Label lblTipoM = (Label)GVTomos.Rows[e.NewEditIndex].FindControl("lblTipoManga");
            string tipoM = lblTipoM.Text;

            GVTomos.EditIndex = e.NewEditIndex;
            RefrescarGrid();

            DropDownList DDLTipoMangaAux = (DropDownList)GVTomos.Rows[e.NewEditIndex].FindControl("DDLTipoManga");

            UtilControls.EnumToListBox(typeof(Tipo), DDLTipoMangaAux, false);

            DDLTipoMangaAux.DataBind();

            DDLTipoMangaAux.SelectedValue = tipoM;
        }

        protected void GVTomos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void GVTomos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string IdTomos = GVTomos.DataKeys[e.RowIndex].Values["idTomo"].ToString();
            string titulo = e.NewValues["Titulo"].ToString();            

            DropDownList TipoMangaAux = (DropDownList)GVTomos.Rows[e.RowIndex].FindControl("DDLTipoManga");
            string genero = TipoMangaAux.SelectedValue;

            bool? Disponibilidad = bool.Parse(e.NewValues["Disponibilidad"].ToString());

            try
            {
                string resultado = BLLTomos.UpdTomos(int.Parse(IdTomos), titulo, null, null , genero, Disponibilidad, null);
                GVTomos.EditIndex = -1;
                RefrescarGrid();
                UtilControls.SweetBox(resultado, "", "success", this.Page, this.GetType());
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
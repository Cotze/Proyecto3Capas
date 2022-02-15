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
            
            try
            {
                string Resultado = BLLTomos.DelTomos(int.Parse(IdTomo));
                string Mensaje = "";
                string Clase = "";
                if (Resultado == "Tomo eliminado")
                {
                    Mensaje = "Ok!";
                    Clase = "success";
                }
                else
                {
                    Mensaje = "Atencion!";
                    Clase = "warning";
                }
                RefrescarGrid();
                UtilControls.SweetBox(Mensaje, Resultado, Clase, this.Page, this.GetType());
                
            }
            catch (Exception ex)
            {

                UtilControls.SweetBox("ERROR!", ex.Message, "danger", this.Page, this.GetType());
            }
        }

        protected void GVTomos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Label lblTipoM = (Label)GVTomos.Rows[e.NewEditIndex].FindControl("lblTipoManga");
            string tipoM = lblTipoM.Text;

            GVTomos.EditIndex = e.NewEditIndex;
            RefrescarGrid();

            DropDownList DDLTipoMangaAux = (DropDownList)GVTomos.Rows[e.NewEditIndex].FindControl("DDLTipoManga");
            UtilControls.EnumToListBox(typeof(Genero), DDLTipoMangaAux, false);

            DDLTipoMangaAux.DataBind();
            DDLTipoMangaAux.SelectedValue = tipoM;
        }

        protected void GVTomos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVTomos.EditIndex = -1;
            RefrescarGrid();
        }

        protected void GVTomos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string IdTomos = GVTomos.DataKeys[e.RowIndex].Values["IdTomo"].ToString();
            DropDownList TipoMangaAux = (DropDownList)GVTomos.Rows[e.RowIndex].FindControl("DDLTipoManga");


            string titulo = e.NewValues["Titulo"].ToString();
            string genero = TipoMangaAux.SelectedValue;

            try
            {
                BLLTomos.UpdTomos(int.Parse(IdTomos), titulo, null, null , genero, null);
                GVTomos.EditIndex = -1;
                RefrescarGrid();
                UtilControls.SweetBox("Ok!", "Tomo actaulizado", "success", this.Page, this.GetType());
                
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        protected void GVTomos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "select")
            {
                int index = int.Parse(e.CommandArgument.ToString());
                string IdTomo = GVTomos.DataKeys[index].Values["IdTomo"].ToString();
                Response.Redirect("EdicionTomos.aspx?Id=" + IdTomo);
            }
        }
    }
}
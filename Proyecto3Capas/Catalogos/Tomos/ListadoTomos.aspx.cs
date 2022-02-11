using Proyecto3Capas.BLL;
using Proyecto3Capas.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                    throw;
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
    }
}
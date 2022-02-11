using Proyecto3Capas.BLL;
using Proyecto3Capas.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto3Capas.Catalogos.Vendedores
{
    public partial class ListadoVendedores : System.Web.UI.Page
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

        public void RefrescarGrid()
        {
            //Lenar el GVChoferes con al lista ChoferesVO
            GVVendedores.DataSource = BLLVendedores.GetLstVendedores(null);

            //Actualiza el contenido del grid
            GVVendedores.DataBind();
        }

        protected void GVVendedores_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string IdVendedor = GVVendedores.DataKeys[e.RowIndex].Values["IdVendedor"].ToString();
            try
            {
                string Resultado = BLLVendedores.DelVendedor(int.Parse(IdVendedor));
                string Mensaje = "";
                string Clase = "";

                if (Resultado == "Vendedor eliminado")
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

            }catch(Exception ex)
            {
                UtilControls.SweetBox("ERROR!", ex.Message, "danger", this.Page, this.GetType());
            }
        }
    }
}
using Proyecto3Capas.BLL;
using Proyecto3Capas.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Proyecto3Capas.enumeradores;

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
                    throw ex;
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

        protected void GVVendedores_RowEditing(object sender, GridViewEditEventArgs e)
        {
            
            Label lblTipoE = (Label)GVVendedores.Rows[e.NewEditIndex].FindControl("lblTipoEmpleado");
            string tipoE = lblTipoE.Text;

            GVVendedores.EditIndex = e.NewEditIndex;
            RefrescarGrid();

            DropDownList DDLTipoEmpleadoAux = (DropDownList)GVVendedores.Rows[e.NewEditIndex].FindControl("DDLTipoEmpleado");
            UtilControls.EnumToListBox(typeof(Tipo), DDLTipoEmpleadoAux, false);

            DDLTipoEmpleadoAux.DataBind();

            DDLTipoEmpleadoAux.SelectedValue = tipoE;
        }

        protected void GVVendedores_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string IdVendedor = GVVendedores.DataKeys[e.RowIndex].Values["IdVendedor"].ToString();
                DropDownList TipoEmpleadoAux = (DropDownList)GVVendedores.Rows[e.RowIndex].FindControl("DDLTipoEmpleado");

                string Nombre = e.NewValues["Nombre"].ToString();
                string ApPaterno = e.NewValues["ApPaterno"].ToString();
                string ApMaterno = e.NewValues["ApMaterno"].ToString();
                string Empleado = TipoEmpleadoAux.SelectedValue;
                BLLVendedores.UpdVendedor(int.Parse(IdVendedor), Nombre, ApPaterno, ApMaterno, Empleado, null, null);

                GVVendedores.EditIndex = -1;
                RefrescarGrid();
                UtilControls.SweetBox("Registro actualizado", "", "success", this.Page, this.GetType());
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void GVVendedores_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVVendedores.EditIndex = -1;
            RefrescarGrid();
        }

        protected void GVVendedores_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int index = int.Parse(e.CommandArgument.ToString()); 
                string IdCamion = GVVendedores.DataKeys[index].Values["IdVendedor"].ToString(); 
                Response.Redirect("EdicionVendedor.aspx?Id=" + IdCamion);
            }
        }
    }
}
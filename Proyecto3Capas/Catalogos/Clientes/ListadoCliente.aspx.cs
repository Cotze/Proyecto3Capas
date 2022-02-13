using Proyecto3Capas.BLL;
using Proyecto3Capas.Util;
using Proyecto3Capas.VO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto3Capas.Catalogos.Clientes
{
    public partial class ListadoCliente : System.Web.UI.Page
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
            GVClientes.DataSource = BLLCliente.GetLstCliente(null);

            //Actualiza el contenido del grid
            GVClientes.DataBind();
        }

        protected void GVClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "select")
            {
                int index = int.Parse(e.CommandArgument.ToString()); //Referencia al reglonseleccionado
                string IdCliente = GVClientes.DataKeys[index].Values["IdCliente"].ToString(); //Recupera el valor de la columna Id del reglon seleccionado
                Response.Redirect("EdicionCliente.aspx?Id=" + IdCliente);
            }
        }

        protected void GVClientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string IdCliente = GVClientes.DataKeys[e.RowIndex].Values["IdCliente"].ToString();
            try
            {
                string Resultado = BLLCliente.DelCliente(int.Parse(IdCliente));
                string Mensaje = "";
                string Clase = "";

                if (Resultado == "Cliente eliminado")
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

        protected void GVClientes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVClientes.EditIndex = e.NewEditIndex;
            RefrescarGrid();
        }

        protected void GVClientes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                //Recuperacion de los datos
                string IdCliente = GVClientes.DataKeys[e.RowIndex].Values["IdCliente"].ToString();
                string Nombre = e.NewValues["Nombre"].ToString();
                string ApPaterno = e.NewValues["ApPaterno"].ToString();
                string ApMaterno = e.NewValues["ApMaterno"].ToString();

                BLLCliente.UpdCliente(int.Parse(IdCliente), Nombre, ApPaterno, ApMaterno, null, null);

                //Salir del modo edicion
                GVClientes.EditIndex = -1;
                RefrescarGrid();
                UtilControls.SweetBox("Registro actualizado", "", "success", this.Page, this.GetType());

            }
            catch (Exception ex)
            {

                throw;
            }
        }

        protected void GVClientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVClientes.EditIndex = -1;
            RefrescarGrid();
        }
    }
}
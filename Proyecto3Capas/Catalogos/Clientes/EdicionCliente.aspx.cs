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
    public partial class EdicionCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Id"] == null)
            {
                Response.Redirect("ListadoCliente.aspx");
            }


            int IdCliente = int.Parse(Request.QueryString["Id"]);
            ClienteVO cliente = BLLCliente.GetClienteByID(IdCliente);
            if (cliente.IdCliente == 0)
            {
                UtilControls.SweetBoxConfirm("Error", "El cliente no se encuentra en la base de datos", "ListadoCliente.aspx", "warning", this.Page, this.GetType());
            }
            txtNombre.Text = cliente.Nombre;
            TxtApPaterno.Text = cliente.ApPaterno;
            TxtApMaterno.Text = cliente.ApPaterno;
            txtRFC.Text = cliente.RFC;
            txtTelefono.Text = cliente.Telefono;

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                //RECUPERAR INFORMACION DE LA CAJA DE TEXTO
                int id = int.Parse(Request.QueryString["Id"]);
                string Telefono = txtTelefono.Text;
                string RFC = txtRFC.Text;

                BLLCliente.UpdCliente(id, null, null, null, RFC, Telefono);
                UtilControls.SweetBoxConfirm("Exito", "Cliente actualizado correctamente", "success", "ListadoCliente.aspx", this.Page, this.GetType());
            }
            catch (Exception ex)
            {
                UtilControls.SweetBox("Error", ex.Message, "error", this.Page, this.GetType());
            }
        }
    }
}
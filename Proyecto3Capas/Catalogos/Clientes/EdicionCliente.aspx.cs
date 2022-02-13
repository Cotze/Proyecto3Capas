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
            if (!IsPostBack)
            {
                if (Request.QueryString["Id"] == null)
                {
                    Response.Redirect("ListadoCliente.aspx");
                }
                else
                {
                    int IdCliente = int.Parse(Request.QueryString["Id"]);
                    ClienteVO cliente = BLLCliente.GetClienteByID(IdCliente);
                    if (cliente.IdCliente == IdCliente)
                    {
                        txtNombre.Text = cliente.Nombre;
                        TxtApPaterno.Text = cliente.ApPaterno;
                        TxtApMaterno.Text = cliente.ApPaterno;
                        txtRFC.Text = cliente.RFC;
                        txtTelefono.Text = cliente.Telefono;
                    }
                    else
                    {
                        Response.Redirect("ListadoCliente.aspx");
                    }                    
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                //RECUPERAR INFORMACION DE LA CAJA DE TEXTO
                int id = int.Parse(Request.QueryString["Id"]);
                string telefono = txtTelefono.Text;
                string RFC = txtRFC.Text;

                BLLCliente.UpdCliente(id, null, null, null, RFC, telefono);
                UtilControls.SweetBoxConfirm("Exito", "Cliente actualizado correctamente", "success", "ListadoCliente.aspx", this.Page, this.GetType());
            }
            catch (Exception ex)
            {
                UtilControls.SweetBox("Error", ex.Message, "error", this.Page, this.GetType());
            }
        }
    }
}
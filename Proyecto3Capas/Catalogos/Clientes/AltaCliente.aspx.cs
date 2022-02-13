using Proyecto3Capas.BLL;
using Proyecto3Capas.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto3Capas.Catalogos.Clientes
{
    public partial class AltaCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string nombre = txtNombre.Text;
                string apPaterno = TxtApPaterno.Text;
                string apMaterno = TxtApMaterno.Text;
                string rfc = txtRFC.Text;
                string telfono = txtTelefono.Text;

                BLLCliente.InsCliente(nombre, apPaterno, apMaterno, rfc, telfono);
                UtilControls.SweetBoxConfirm("Exito!", "Cliente agregado correctamente", "success", "ListadoCliente.aspx", this.Page, this.GetType());
            }
            catch (Exception ex)
            {

                UtilControls.SweetBox("Error!", ex.ToString(), "error", this.Page, this.GetType());
            }
        }
    }
}
using Proyecto3Capas.DAL;
using Proyecto3Capas.VO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto3Capas.BLL
{
    public class BLLCliente
    {
        //Listar
        public static List<ClienteVO> GetLstCliente(bool? paramDisponibilidad)
        {
            return DALClientes.GetLstCliente(paramDisponibilidad);
        }
        //Insertar
        public static void InsCliente(string paramNombre, string paramApPaterno, string paramApMaterno, string paramRFC, string paramTelefono)
        {
            try
            {
                DALClientes.InsCliente(paramNombre, paramApPaterno, paramApMaterno, paramRFC, paramTelefono);
            }
            catch (Exception)
            {

                throw;
            }
        }
        //Actualizar
        public static void UpdCliente(int paramIdCliente, string paramNombre, string paramApPaterno, string paramApMaterno, string paramRFC, string paramTelefono)
        {
            DALClientes.UpdCliente(paramIdCliente, paramNombre, paramApPaterno, paramApMaterno, paramRFC, paramTelefono);
        }
        //Eliminar
        public static string DelCliente(int paramIdCliente)
        {
            try
            {
                DALClientes.DelCliente(paramIdCliente);
                return "Cliente eliminado";
            }
            catch (Exception)
            {

                throw;
            }
        }
        //GetByID
        public static ClienteVO GetClienteByID(int paramIdCliente)
        {
            return DALClientes.GetClienteById(paramIdCliente);
        }
    }
}
using Proyecto3Capas.Util;
using Proyecto3Capas.VO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Web;

namespace Proyecto3Capas.DAL
{
    public class DALClientes
    {
        //Listar
        public static List<ClienteVO> GetLstCliente(bool? paramDisponibilidad)
        {
            try
            {
                DataSet dsCliente;
                dsCliente = DBConnection.ExecuteDataSet("Cliente_Listar");

                List<ClienteVO> ListaClientes = new List<ClienteVO>();

                foreach (DataRow dr in dsCliente.Tables[0].Rows)
                {
                    ListaClientes.Add(new ClienteVO(dr));
                }
                return ListaClientes;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        //Insertar
        public static void InsCliente(string paramNombre, string paramApPaterno, string paramApMaterno, string paramRFC, string paramTelefono)
        {
            try
            {
                DBConnection.ExecuteNonQuery("Cliente_Insertar", "@Nombre", paramNombre, "@ApPaterno", paramApPaterno, "@ApMaterno", paramApMaterno, "@RFC", paramRFC  , "@Telefono", paramTelefono);
            }
            catch (Exception)
            {

                throw;
            }
        }
        //Actualizar
        public static void UpdCliente(int paramIdCamion, string paramNombre, string paramApPaterno, string paramApMaterno, string paramRFC, string paramTelefono)
        {
            try
            {
                DBConnection.ExecuteNonQuery("Cliente_Actualizar", "@id", paramIdCamion, "@Nombre", paramNombre, "@ApPaterno", paramApPaterno, "@ApMaterno", paramApMaterno, "@RFC", paramRFC, "@Telefono", paramTelefono);
            }
            catch (Exception)
            {

                throw;
            }
        }
        //Eliminar
        public static void DelCliente(int paramIdCamion)
        {
            try
            {
                DBConnection.ExecuteNonQuery("Cliente_Eliminar", "@id", paramIdCamion);
            }
            catch (Exception)
            {

                throw;
            }
        }
        //GetByID
        public static ClienteVO GetClienteById(int paramIdCamion)
        {
            try
            {
                DataSet dsCliente = DBConnection.ExecuteDataSet("Cliente_GetByID", "@id", paramIdCamion);
                if (dsCliente.Tables[0].Rows.Count > 0)
                {
                    DataRow dr = dsCliente.Tables[0].Rows[0];
                    ClienteVO Cliente = new ClienteVO(dr);
                    return Cliente;
                }
                else
                {
                    ClienteVO Cliente = new ClienteVO();
                    return Cliente;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
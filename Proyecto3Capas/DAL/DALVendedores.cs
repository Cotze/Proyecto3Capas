using Proyecto3Capas.Util;
using Proyecto3Capas.VO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Proyecto3Capas.DAL
{
    public class DALVendedores
    {
        //Listar
        public static List<VendedorVO> GetLstVendedores(bool? paramDisponibilidad)
        {
            try
            {
                //Obtener la lista de choferes
                //Declaramos un DataSet
                DataSet dsVendedor;

                //Verificar la disponiblidad
                if (paramDisponibilidad == null)
                {
                    //Obtener todos los Choferes de la BD
                    dsVendedor = DBConnection.ExecuteDataSet("Vendedor_Listar");
                }
                else
                {
                    //Obtener los choferes según paramDisponibilidad
                    dsVendedor = DBConnection.ExecuteDataSet("Vendedor_Listar", "@Disponibilidad", paramDisponibilidad);
                }

                //Declaramos la lista a retornar
                List<VendedorVO> ListaVendedor = new List<VendedorVO>();
                //Recorremos el DataSet para llenar la lista
                foreach (DataRow dr in dsVendedor.Tables[0].Rows)
                {
                    ListaVendedor.Add(new VendedorVO(dr));
                }
                return ListaVendedor;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        //insertar
        public static void InsVendedor(string paramNombre, string paramApPaterno, string paramApMaterno, string paramPuesto, string paramUrlFoto)
        {
            try
            {
                DBConnection.ExecuteNonQuery("Vendedor_Insertar", "@Nombre", paramNombre, "@ApPaterno", paramApPaterno, "@ApMaterno",paramApMaterno, "@Puesto", paramPuesto, "@UrlFoto", paramUrlFoto);

            }
            catch (Exception ex)
            {
                throw;
            }
        }

        //Actualizar
        public static void UpdVendedor(int paramIdVendedor, string paramNombre, string paramApPaterno, string paramApMaterno, string paramPuesto, string paramUrlFoto)
        {
            try
            {
                DBConnection.ExecuteNonQuery("Choferes_Actualizar", "@id", paramIdVendedor, "@Nombre", paramNombre, "@ApPaterno", paramApPaterno, "@ApMaterno", paramApMaterno, "@Puesto", paramPuesto, "@UrlFoto", paramUrlFoto);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        //Eliminar
        public static void DelVendedor(int paramIdVendedor)
        {
            try
            {
                DBConnection.ExecuteNonQuery("Vendedor_Eliminar", "@id", paramIdVendedor);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        //GetByID
        public static VendedorVO GetVendedoresById(int paramIdVendedor)
        {
            try
            {
                DataSet dsChofer = DBConnection.ExecuteDataSet("Vendedor_GetByID", "@id", paramIdVendedor);
                if (dsChofer.Tables[0].Rows.Count > 0)
                {
                    DataRow dr = dsChofer.Tables[0].Rows[0];
                    VendedorVO Chofer = new VendedorVO(dr);
                    return Chofer;
                }
                else
                {
                    VendedorVO chofer = new VendedorVO();
                    return chofer;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
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
                throw ex;
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
                throw ex;
            }
        }

        //Actualizar
        public static void UpdVendedor(int paramIdVendedor, string paramNombre, string paramApPaterno, string paramApMaterno, string paramPuesto, string paramUrlFoto)
        {
            try
            {
                DBConnection.ExecuteNonQuery("Vendedor_Actualizar", "@id", paramIdVendedor, "@Nombre", paramNombre, "@ApPaterno", paramApPaterno, "@ApMaterno", paramApMaterno, "@Puesto", paramPuesto, "@UrlFoto", paramUrlFoto);
            }
            catch (Exception ex)
            {
                throw ex;
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
                throw ex;
            }
        }

        //GetByID
        public static VendedorVO GetVendedoresById(int paramIdVendedor)
        {
            try
            {
                DataSet dsVendedor = DBConnection.ExecuteDataSet("Vendedor_GetByID", "@id", paramIdVendedor);
                if (dsVendedor.Tables[0].Rows.Count > 0)
                {
                    DataRow dr = dsVendedor.Tables[0].Rows[0];
                    VendedorVO Vendedor = new VendedorVO(dr);
                    return Vendedor;
                }
                else
                {
                    VendedorVO Vendedor = new VendedorVO();
                    return Vendedor;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
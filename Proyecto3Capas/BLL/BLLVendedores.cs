using Proyecto3Capas.DAL;
using Proyecto3Capas.VO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto3Capas.BLL
{
    public class BLLVendedores
    {

        //Listar
        public static List<VendedorVO> GetLstVendedores(bool? paramDisponiilidad)
        {
            return DALVendedores.GetLstVendedores(paramDisponiilidad);
        }

        //Insertar
        public static void InsVendedores(string paramNombre, string paramApPaterno, string paramApMaterno, string paramPuesto, string paramUrlFoto)
        {
            try
            {
                DALVendedores.InsVendedor(paramNombre, paramApPaterno, paramApMaterno, paramPuesto, paramUrlFoto);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        //Actualizar
        public static void UpdVendedor(int paramIdVendedor, string paramNombre, string paramApPaterno, string paramApMaterno, string paramPuesto, string paramUrlFoto)
        {
            DALVendedores.UpdVendedor(paramIdVendedor, paramNombre, paramApPaterno, paramApMaterno, paramPuesto, paramUrlFoto);
        }

        //Eliminar
        public static string DalVendedor(int paramIdVendedor)
        {
            try
            {
                
                VendedorVO Vendedor = DALVendedores.GetVendedoresById(paramIdVendedor);
                return paramIdVendedor.ToString();
            }
            catch (Exception ex)
            {
                throw;
            }

        }

        //GetByID
        public static VendedorVO GetVendedoresByID(int paramIdVendedor)
        {
            return DALVendedores.GetVendedoresById(paramIdVendedor);
        }
    }
    
}
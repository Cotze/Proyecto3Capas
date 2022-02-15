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
        public static void InsVendedores(string paramNombre, string paramApPaterno, string paramApMaterno, string paramPuesto, string paramUrlFoto, string paramPais)
        {
            try
            {
                DALVendedores.InsVendedor(paramNombre, paramApPaterno, paramApMaterno, paramPuesto, paramUrlFoto, paramPais);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //Actualizar
        public static void UpdVendedor(int paramIdVendedor, string paramNombre, string paramApPaterno, string paramApMaterno, string paramPuesto, string paramUrlFoto, string paramPais)
        {
            DALVendedores.UpdVendedor(paramIdVendedor, paramNombre, paramApPaterno, paramApMaterno, paramPuesto, paramUrlFoto, paramPais);
        }

        //Eliminar
        public static string DelVendedor(int paramIdVendedor)
        {
            try
            {
                DALVendedores.DelVendedor(paramIdVendedor);
                return "Vendedor eliminado";
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        //GetByID
        public static VendedorVO GetVendedoresByID(int paramIdVendedor)
        {
            return DALVendedores.GetVendedoresById(paramIdVendedor);
        }
    }
    
}
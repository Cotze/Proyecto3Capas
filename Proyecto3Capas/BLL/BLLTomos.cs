using Proyecto3Capas.DAL;
using Proyecto3Capas.VO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto3Capas.BLL
{
    public class BLLTomos
    {
        //Listar
        public static List<TomosVO> GetLstTomos(bool? paramDisponiilidad)
        {
            return DALTomos.GetLstTomos(paramDisponiilidad);
        }

        //Insertar
        public static void InsTomos(string paramTitulo, float paramPrecio, int? paramStock, string paramGenero, string paramUrlFoto)
        {
            try
            {
                DALTomos.InsTomos(paramTitulo, paramPrecio, paramStock, paramGenero, paramUrlFoto);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //Actualizar
        public static void UpdTomos(int paramIdTomo, string paramTitulo, float? paramPrecio, int? paramStock, string paramGenero, string paramUrlFoto)
        {
            DALTomos.UpdTomos(paramIdTomo, paramTitulo, paramPrecio, paramStock, paramGenero, paramUrlFoto);
        }

        //Eliminar
        public static string DelTomos(int paramIdTomo)
        {
            try
            {
                DALTomos.DelTomo(paramIdTomo);
                return "Tomo eliminado";
            }
            catch (Exception ex)
            {   
                throw ex;
            }

        }

        //GetByID
        public static TomosVO GetTomoByID(int paramIdTomo)
        {
            return DALTomos.GetTomosById(paramIdTomo);
        }
    }
}
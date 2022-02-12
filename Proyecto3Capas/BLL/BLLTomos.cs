﻿using Proyecto3Capas.DAL;
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
        public static void InsTomos(string paramTitulo, float paramPrecio, int paramStock, string paramGenero, string paramUrlFoto)
        {
            try
            {
                DALTomos.InsTomos(paramTitulo, paramPrecio, paramStock, paramGenero, paramUrlFoto);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        //Actualizar
        public static void UpdTomos(int paramIdTomo, string paramTitulo, float? paramPrecio, int paramStock, string paramGenero, bool? paramDisponibilidad, string paramUrlFoto)
        {
            DALTomos.UpdTomos(paramIdTomo, paramTitulo, paramPrecio, paramStock, paramGenero, paramDisponibilidad, paramUrlFoto);
        }

        //Eliminar
        public static string DelTomos(int paramIdTomo)
        {
            try
            {
                //Verificar la disponibilidad del chofer
                TomosVO Tomo = DALTomos.GetTomosById(paramIdTomo);
                if (Tomo.Disponibilidad)
                {
                    DALTomos.DelTomo(paramIdTomo);
                    return "1";
                }
                else
                {
                    return "0";
                }
            }
            catch (Exception ex)
            {
                throw;
            }

        }

        //GetByID
        public static TomosVO GetTomoByID(int paramIdTomo)
        {
            return DALTomos.GetTomosById(paramIdTomo);
        }
    }
}
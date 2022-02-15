using Proyecto3Capas.Util;
using Proyecto3Capas.VO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Proyecto3Capas.DAL
{
    public class DALTomos
    {
        //Listar
        public static List<TomosVO> GetLstTomos(bool? paramDisponibilidad)
        {
            try
            {
                //Obtener la lista de choferes
                //Declaramos un DataSet
                DataSet dsTomos;

                //Verificar la disponibilidad
                if (paramDisponibilidad == null)
                {
                    //Obtener todos los Choferes de la BD
                    dsTomos = DBConnection.ExecuteDataSet("Tomos_Listar");
                }
                else
                {
                    //Obtener los choferes según paramDisponibilidad
                    dsTomos = DBConnection.ExecuteDataSet("Tomos_Listar", "@Disponibilidad", paramDisponibilidad);
                }

                //Declaramos la lista a retornar
                List<TomosVO> ListaTomos = new List<TomosVO>();
                //Recorremos el DataSet para llenar la lista
                foreach (DataRow dr in dsTomos.Tables[0].Rows)
                {
                    ListaTomos.Add(new TomosVO(dr));
                }
                return ListaTomos;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //insertar
        public static void InsTomos(string paramTitulo, float paramPrecio, int? paramStock, string paramGenero, string paramUrlFoto)
        {
            try
            {
                DBConnection.ExecuteNonQuery("Tomo_Insertar", "@Titulo", paramTitulo, "@Precio", paramPrecio, "@Stock", paramStock, "@Genero", paramGenero, "@UrlFoto", paramUrlFoto);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //Actualizar
        public static void UpdTomos(int paramIdTomo, string paramTitulo, float? paramPrecio, int? paramStock, string paramGenero, string paramUrlFoto)
        {
            try
            {
                DBConnection.ExecuteNonQuery("Tomos_Actualizar", "@id", paramIdTomo, "@Titulo", paramTitulo, "@Precio", paramPrecio, "@Stock", paramStock, "@Genero", paramGenero, "@UrlFoto", paramUrlFoto);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //Eliminar
        public static void DelTomo(int paramIdTomos)
        {
            try
            {
                DBConnection.ExecuteNonQuery("Tomos_Eliminar", "@id", paramIdTomos);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //GetByID
        public static TomosVO GetTomosById(int paramIdTomos)
        {
            try
            {
                DataSet dsTomos = DBConnection.ExecuteDataSet("Tomos_GetByID", "@id", paramIdTomos);
                if (dsTomos.Tables[0].Rows.Count > 0)
                {
                    DataRow dr = dsTomos.Tables[0].Rows[0];
                    TomosVO Chofer = new TomosVO(dr);
                    return Chofer;
                }
                else
                {
                    TomosVO tomo = new TomosVO();
                    return tomo;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
using Proyecto3Capas.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto3Capas.DAL
{
    public class DALEnvios
    {
        public static long InsRuta(int IdCliente, int IdVendedor, int Origen, int Destino, double Distancia, DateTime FSalida, DateTime FLlegadaE)
        {
            try
            {
                return
                    DBConnection.ExecuteNonQueryGetIdentitty
                        ("Rutas_Insertar", "@Cliente_id", IdCliente,
                                    "@DireccionOrigen", Origen,
                                    "@DireccionDestino", Destino,
                                    "@Distancia", Distancia,
                                    "@FHSalida", FSalida,
                                    "@FHLlegadaEstimada", FLlegadaE,
                                    "@Vendedor_id", IdVendedor);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
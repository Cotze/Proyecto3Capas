using Proyecto3Capas.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto3Capas.BLL
{
    public class BLLEnvios
    {
        //Insertar
        public static long InsEnvio(int IdCliente, int Idvendedor, int IdOrigen, int IdDestino, double Distancia, DateTime FSalida, DateTime FLlegadaE)
        {
            DALClientes.UpdCliente(IdCliente, null, null, null, null, null);
            DALVendedores.UpdVendedor(Idvendedor, null, null, null, null, null, null);
            return DALEnvios.InsRuta(IdCliente, Idvendedor, IdOrigen, IdDestino, Distancia, FSalida, FLlegadaE);

        }
    }
}
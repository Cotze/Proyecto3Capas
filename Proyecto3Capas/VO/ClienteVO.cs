using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Proyecto3Capas.VO
{
    public class ClienteVO
    {
        private int _idCliente;
        private string _Nombre;
        private string _ApPaterno;
        private string _ApMaterno;
        private string _RFC;
        private string _Telefono;

        public string Nombre { get => _Nombre; set => _Nombre = value; }
        public string ApPaterno { get => _ApPaterno; set => _ApPaterno = value; }
        public string ApMaterno { get => _ApMaterno; set => _ApMaterno = value; }
        public string RFC { get => _RFC; set => _RFC = value; }
        public string Telefono { get => _Telefono; set => _Telefono = value; }
        public int IdCliente { get => _idCliente; set => _idCliente = value; }

        public ClienteVO()
        {
            IdCliente = 0;
            Nombre = String.Empty;
            ApPaterno = String.Empty;
            ApMaterno = String.Empty;
            RFC = String.Empty;
            Telefono = string.Empty;
        }

        public ClienteVO(DataRow dr)
        {
            IdCliente = int.Parse(dr["id"].ToString());
            Nombre = dr["Nombre"].ToString();
            ApPaterno = dr["ApPaterno"].ToString();
            ApMaterno = dr["ApMaterno"].ToString();
            RFC = dr["RFC"].ToString();
            Telefono = dr["Telefono"].ToString();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Proyecto3Capas.VO
{
    public class VendedorVO
    {
        private int _IdVendedor;
        private String _Nombre;
        private String _ApPaterno;
        private String _ApMaterno;
        private String _Puesto;
        private String _UrlFoto;
        private string _Pais;

        public int IdVendedor { get => _IdVendedor; set => _IdVendedor = value; }
        public string Nombre { get => _Nombre; set => _Nombre = value; }
        public string ApPaterno { get => _ApPaterno; set => _ApPaterno = value; }
        public string ApMaterno { get => _ApMaterno; set => _ApMaterno = value; }
        public string Puesto { get => _Puesto; set => _Puesto = value; }
        public string UrlFoto { get => _UrlFoto; set => _UrlFoto = value; }
        public string Pais { get => _Pais; set => _Pais=value; }

        public VendedorVO() //Constructor
        {
            IdVendedor = 0;
            Nombre = string.Empty;
            ApPaterno = string.Empty;
            ApMaterno = string.Empty;
            Puesto = string.Empty;
            UrlFoto = string.Empty;
            Pais = string.Empty;
        }

        public VendedorVO(DataRow dr)
        {
            IdVendedor = int.Parse(dr["id"].ToString());
            Nombre = dr["Nombre"].ToString();
            ApPaterno = dr["ApPaterno"].ToString();
            ApMaterno = dr["ApMaterno"].ToString();
            Puesto = dr["Puesto"].ToString();
            UrlFoto = dr["UrlFoto"].ToString();
            Pais = dr["Pais"].ToString();
        }
    }
}
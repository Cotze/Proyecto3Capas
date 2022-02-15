using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Proyecto3Capas.VO
{
    public class TomosVO
    {
        private int _idTomo;
        private String _Titulo;
        private float _Precio;
        private int _Stock;
        private string _Genero;
        private string _UrlFoto;
        

        public int IdTomo { get => _idTomo; set => _idTomo = value; }
        public string Titulo { get => _Titulo; set => _Titulo = value; }
        public float Precio { get => _Precio; set => _Precio = value; }
        public int Stock { get => _Stock; set => _Stock = value; }
        public string Genero { get => _Genero; set => _Genero = value; }
        public string UrlFoto { get => _UrlFoto; set => _UrlFoto = value; }
        

        public TomosVO()
        {
            IdTomo = 0;
            Titulo = "";
            Precio = 0;
            Stock = 0;
            Genero = "";
            UrlFoto = "";
        }

        public TomosVO(DataRow dr)
        {
            IdTomo = int.Parse(dr["id"].ToString());
            Titulo = dr["Titulo"].ToString();
            Precio = float.Parse(dr["Precio"].ToString());
            Stock = int.Parse(dr["Stock"].ToString());
            Genero = dr["Genero"].ToString();
            UrlFoto = dr["UrlFoto"].ToString();
            
        }
    }
}
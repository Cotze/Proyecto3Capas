using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace Proyecto3Capas
{
    public class EnumeradoresPuestos
    {
        public enum Puesto
        {
            Vendedor,
            Gerente,
            [Description("Doble de tienda")]
            Jefe,
            Publicista
        }
    }
}
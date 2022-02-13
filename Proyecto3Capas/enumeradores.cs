using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace Proyecto3Capas
{
    public class enumeradores
    {
        public enum Tipo
        {
            Vendedor,
            Gerente,
            [Description("Doble de tienda")]
            Jefe,
            Publicista
        }
    }
}
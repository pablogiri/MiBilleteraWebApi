using System;
using System.Collections.Generic;

namespace Entities
{
    public partial class Localidad
    {
        public Localidad()
        {
            Usuarios = new HashSet<Usuario>();
        }

        public int IdLocalidad { get; set; }
        public string Nombre { get; set; } = null!;
        public int IdProvincia { get; set; }
        public DateTime FechaAlta { get; set; }
        public DateTime? FechaBaja { get; set; }

        public virtual Provincia IdProvinciaNavigation { get; set; } = null!;
        public virtual ICollection<Usuario> Usuarios { get; set; }
    }
}

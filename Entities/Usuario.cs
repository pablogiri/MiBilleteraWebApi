using System;
using System.Collections.Generic;

namespace Entities
{
    public partial class Usuario
    {
        public int IdUsuario { get; set; }
        public string Nombre { get; set; } = null!;
        public string Apellido { get; set; } = null!;
        public long Dni { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Email { get; set; } = null!;
        public string Usuario1 { get; set; } = null!;
        public string Password { get; set; } = null!;
        public string? Telefono { get; set; }
        public int IdLocalidad { get; set; }
        public DateTime FechaAlta { get; set; }
        public DateTime? FechaBaja { get; set; }

        public virtual Localidad IdLocalidadNavigation { get; set; } = null!;
    }
}

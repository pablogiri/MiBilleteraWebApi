using System;
using System.Collections.Generic;

namespace Entities
{
    public partial class VistaUsuario
    {
        public string Nombre { get; set; } = null!;
        public string Apellido { get; set; } = null!;
        public long Dni { get; set; }
        public string Localidad { get; set; } = null!;
        public string Provincia { get; set; } = null!;
        public DateTime FechaNacimiento { get; set; }
        public string Email { get; set; } = null!;
        public string? Telefono { get; set; }
        public DateTime? FechaBaja { get; set; }
    }
}

using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class LocalidadBC
    {
        public Localidad? ObtenerLocalidad(MiBilleteraContext db, int id)
        {
            return db.Localidades.FirstOrDefault(a => a.IdLocalidad == id);
        }
    }
}

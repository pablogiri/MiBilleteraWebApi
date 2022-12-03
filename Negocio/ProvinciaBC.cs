using Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class ProvinciaBC
    {
        public Provincia? ObtenerProvincia(MiBilleteraContext db, int id)
        {
            return db.Provincias.Include(a => a.Localidades).FirstOrDefault(a => a.IdProvincia == id);
        }
    }
}

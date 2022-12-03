using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class UsuarioBC
    {
        public Usuario? ObtenerUsuario(MiBilleteraContext db, int id)
        {
            return db.Usuarios.FirstOrDefault(a => a.IdUsuario == id);
        }
    }
}

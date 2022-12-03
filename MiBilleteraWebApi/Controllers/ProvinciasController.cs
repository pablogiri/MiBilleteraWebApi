using Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Negocio;

namespace MiBilleteraWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProvinciasController : ControllerBase
    {
        [HttpGet]
        public async Task<List<Provincia>> Get()
        {
            using (var db = new MiBilleteraContext())
            {
                return await db.Provincias.Include(a => a.Localidades).ToListAsync();
            }
        }

        //[HttpGet]
        [HttpGet("{idUsuario:int}")]
        public Provincia? Get(int idUsuario)
        {
            using (var db = new MiBilleteraContext())
            {
                int idLocalidad = new UsuarioBC().ObtenerUsuario(db, idUsuario).IdLocalidad;

                int idProvincia = new LocalidadBC().ObtenerLocalidad(db, idLocalidad).IdProvincia;

                return new ProvinciaBC().ObtenerProvincia(db, idProvincia);
            }
        }


        [HttpPost]
        public void Post([FromBody] Provincia oProvincia)
        {
            using (var db = new MiBilleteraContext())
            {
                db.Provincias.Add(oProvincia);
                db.SaveChanges();
            }
        }

        [HttpPut]
        public void Put( int id, string nombre)
        {
            using (var db = new MiBilleteraContext())
            {
                Provincia? provinciaVieja = db.Provincias.FirstOrDefault(a => a.IdProvincia == id);
                provinciaVieja.Nombre = nombre;
                db.SaveChanges();

            }
        
        }

        [HttpDelete]
        public void Delete(int id)
        {
            try
            {
                using (var db = new MiBilleteraContext())
                {
                    Provincia? oProvincia = db.Provincias.FirstOrDefault(x => x.IdProvincia == id);
                    db.Remove(oProvincia);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                throw ;
            }
        }
    }
}

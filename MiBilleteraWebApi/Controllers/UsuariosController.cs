using Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Negocio;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MiBilleteraWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuariosController : ControllerBase
    {
        // GET: api/<UsuariosController>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "Usuario1", "Usuario2", "Usuario3", "Usuario4" };
        }

        // GET api/<UsuariosController>/5
        [HttpGet("{id}")]
        public Usuario? Get(int id)
        {

            try
            {
                using (var db = new MiBilleteraContext())
                {

                    Usuario? oUsuario = db.Usuarios.Include(a => a.IdLocalidadNavigation).FirstOrDefault(a => a.IdUsuario == id);

                    //Localidad? oLocalidad = db.Localidades.FirstOrDefault(a => a.IdLocalidad == oUsuario.IdLocalidad);

                    //Provincia? oProvincia = new ProvinciaBC().ObtenerProvincia(db, oLocalidad.IdProvincia);
                return oUsuario;
                }

            }
            catch (Exception ex)
            {

                throw;
               //return "Se produjo un error, por favor, inténtelo más tarde o comuníquese con el administrador del sistema. Gracias por su paciencia";
            }

        }

        // POST api/<UsuariosController>
        [HttpPost]
        [Route("Agregar")]
        public void Post([FromBody] string value)
        {


        }

        // PUT api/<UsuariosController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<UsuariosController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}

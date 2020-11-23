using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Data;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly DataContext dc;

        public UserController(DataContext dc)
        {
            this.dc = dc;
        }

        // Get
        [HttpGet]
        public async Task<IActionResult> GetUsers()
        {
            var users = await dc.Users.ToListAsync();
            return Ok(users);
        }

        [HttpGet("get/{name}")]
        public async Task<IActionResult> GetUserByName(string name)
        {
            var user = await dc.Users.FirstOrDefaultAsync(a => a.userName == name);
            return Ok(user);
        }

        //Add
        [HttpPost("add")]
        [HttpPost("post")]
        //public async Task<IActionResult> AddUser(string userName, string email, string password)
        public async Task<IActionResult> AddUser(User user)
        {
            //User user = new User();
            //user.userName = userName;
            //user.email = email;
            //user.password = password;

            await dc.Users.AddAsync(user);
            await dc.SaveChangesAsync();

            return Ok(user);
        }

        //update
        [HttpPut("ban/{id}")]
        public async Task<IActionResult> BanUser(int id)
        {
            var user = await dc.Users.FirstOrDefaultAsync(a => a.Id == id);
            if (user.ban == true)
                user.ban = false;
            else
                user.ban = true;

            dc.Users.Update(user);
            await dc.SaveChangesAsync();
            return Ok(user);
        }

        [HttpPut("admin/{id}")]
        public async Task<IActionResult> AdminUser(int id)
        {
            var user = await dc.Users.FirstOrDefaultAsync(a => a.Id == id);
            if (user.admin == true)
                user.admin = false;
            else
                user.admin = true;

            dc.Users.Update(user);
            await dc.SaveChangesAsync();
            return Ok(user);
        }

        //delete
        [HttpDelete("delete/{id}")]
        public async Task<IActionResult> DeleteUser(int id)
        {
            var user = await dc.Users.FindAsync(id);

            dc.Users.Remove(user);
            await dc.SaveChangesAsync();
            return Ok(id);
        }
    }
}

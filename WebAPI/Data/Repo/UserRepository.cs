using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAPI.Models;

namespace WebAPI.Data.Repo
{
    public class UserRepository : IUserRepository
    {
        private readonly DataContext dc;

        public UserRepository(DataContext dc)
        {
            this.dc = dc;
        }
        public void AddUser(User user)
        {
            dc.Users.Add(user);
        }

        public void DeleteUser(int UserId)
        {
            var user = dc.Users.Find(UserId);
            dc.Users.Remove(user);
        }

        public async Task<IEnumerable<User>> GetUsersAsync()
        {
            return await dc.Users.ToListAsync();
        }

        public async Task<bool> SaveAsync()
        {
            return await dc.SaveChangesAsync() > 0;
        }
    }
}

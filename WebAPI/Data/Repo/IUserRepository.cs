using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAPI.Models;

namespace WebAPI.Data.Repo
{
    public interface IUserRepository
    {
        Task<IEnumerable<User>> GetUsersAsync();
        void AddUser(User user);
        void DeleteUser(int UserId);
        Task<bool> SaveAsync();
    }
}

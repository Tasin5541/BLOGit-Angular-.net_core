using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAPI.Models
{
    public class UpdatePost
    {
        public int Id { get; set; }
        public string newTitle { get; set; }
        public string newDescription { get; set; }
    }
}

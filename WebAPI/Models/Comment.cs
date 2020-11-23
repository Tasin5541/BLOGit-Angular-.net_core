using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAPI.Models
{
    public class Comment
    {
        public int Id { get; set; }
        public int postId { get; set; }
        public string comment { get; set; }
        public string userName { get; set; }
        public string commentedOn { get; set; }
    }
}

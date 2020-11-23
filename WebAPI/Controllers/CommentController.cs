using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAPI.Data;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CommentController : ControllerBase
    {
        private readonly DataContext dc;

        public CommentController(DataContext dc)
        {
            this.dc = dc;
        }

        [HttpGet("findComment/{id}")]
        public async Task<IActionResult> GetPost(int id)
        {
            var comment = await dc.Comments.Where(a => a.postId == id).ToListAsync();
            return Ok(comment);
        }

        [HttpGet("userComment/{userName}")]
        public async Task<IActionResult> GetUserComment(String userName)
        {
            var comment = await dc.Comments.Where(a => a.userName == userName).ToListAsync();
            return Ok(comment.Count);
        }

        [HttpPost("post")]
        public async Task<IActionResult> AddComment(Comment comment)
        {
            await dc.Comments.AddAsync(comment);
            await dc.SaveChangesAsync();

            return Ok(comment);
        }

        [HttpPut("edit/{id}")]
        public async Task<IActionResult> EditComment(UpdateComment updatecomment)
        {
            var comment = await dc.Comments.FirstOrDefaultAsync(a => a.Id == updatecomment.Id);
            comment.comment = updatecomment.newComment;

            dc.Comments.Update(comment);
            await dc.SaveChangesAsync();
            return Ok(comment);
        }

        //delete
        [HttpDelete("delete/{id}")]
        public async Task<IActionResult> DeleteComment(int id)
        {
            var comment = await dc.Comments.FindAsync(id);

            dc.Comments.Remove(comment);
            await dc.SaveChangesAsync();
            return Ok(id);
        }

        [HttpDelete("deleteAll/{id}")]
        public async Task<IActionResult> DeleteAllComment(int id)
        {
            var comment = dc.Comments.Where(a => a.postId == id);

            dc.Comments.RemoveRange(comment);
            await dc.SaveChangesAsync();
            return Ok(id);
        }
    }
}

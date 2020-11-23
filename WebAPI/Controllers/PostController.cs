using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
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
    public class PostController : ControllerBase
    {
        private readonly DataContext dc;
        public String newImageName;

        public PostController(DataContext dc)
        {
            this.dc = dc;
        }

        // Get
        [HttpGet]
        public async Task<IActionResult> GetPosts()
        {
            var posts = await dc.Posts.ToListAsync();
            return Ok(posts);
        }

        [HttpGet("findPost/{id}")]
        public async Task<IActionResult> GetPost(int id)
        {
            var post = await dc.Posts.FirstOrDefaultAsync(a => a.Id == id);
            return Ok(post);
        }

        [HttpGet("userPost/{Author}")]
        public async Task<IActionResult> GetUserPost(String Author)
        {
            var post = await dc.Posts.Where(a => a.Author == Author).ToListAsync();
            return Ok(post);
        }

        //Add
        [HttpPost("add")]
        [HttpPost("post")]
        //public async Task<IActionResult> AddUser(string userName, string email, string password)
        public async Task<IActionResult> AddPost(Post post)
        {
            //User user = new User();
            //user.userName = userName;
            //user.email = email;
            //user.password = password;

            //var foldername = "image";
            //var pathtosave = path.combine(directory.getcurrentdirectory(), foldername);

            //if (file.length > 0)
            //{
            //    var filename = contentdispositionheadervalue.parse(file.contentdisposition).filename.trim('"');
            //    var fullpath = path.combine(pathtosave, filename);
            //    var dbpath = path.combine(foldername, filename);

            //    using (var stream = new filestream(fullpath, filemode.create))
            //    {
            //        await file.copytoasync(stream);
            //    }
            //}
            //post.Banner_Image = newImageName;
            await dc.Posts.AddAsync(post);
            await dc.SaveChangesAsync();

            return Ok(post);
        }

        [HttpPost, DisableRequestSizeLimit]
        public IActionResult Upload()
        {
            try
            {
                var file = Request.Form.Files[0];
                var folderName = "Image";
                var pathToSave = Path.Combine(Directory.GetCurrentDirectory(), folderName);
                if (file.Length > 0)
                {
                    var fileName = ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
                    var fullPath = Path.Combine(pathToSave, fileName);
                    var dbPath = Path.Combine(folderName, fileName);
                    using (var stream = new FileStream(fullPath, FileMode.Create))
                    {
                        file.CopyTo(stream);
                    }
                    //newImageName = fileName;
                    return Ok(new { dbPath });
                }
                else
                {
                    return BadRequest();
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex}");
            }
        }

        [HttpPut("edit/{id}")]
        public async Task<IActionResult> EditComment(UpdatePost updatepost)
        {
            var post = await dc.Posts.FirstOrDefaultAsync(a => a.Id == updatepost.Id);
            post.Title = updatepost.newTitle;
            post.Description = updatepost.newDescription;

            dc.Posts.Update(post);
            await dc.SaveChangesAsync();
            return Ok(post);
        }

        //delete
        [HttpDelete("delete/{id}")]
        public async Task<IActionResult> DeletePost(int id)
        {
            var post = await dc.Posts.FindAsync(id);

            dc.Posts.Remove(post);
            await dc.SaveChangesAsync();
            return Ok(id);
        }
    }
}

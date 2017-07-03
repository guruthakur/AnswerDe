using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuizDAL;
namespace AnswerDe.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Registration()
        {
            return View();
        }
        [HttpPost]
        public string Registration(UserDetails usrdetail)
        {
            usrdetail.IsActive = true;
            usrdetail.SaveUser();
            return "done";
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication1.Controllers
{
    public class DefaultController : Controller
    {
        // GET: Default
        [OutputCache(Duration = 10, VaryByParam = "none")]
        public string Index()
        {
            return "Hi " + DateTime.Now;
        }
        public ActionResult Test()
        {
            return View();
        }
    }
}
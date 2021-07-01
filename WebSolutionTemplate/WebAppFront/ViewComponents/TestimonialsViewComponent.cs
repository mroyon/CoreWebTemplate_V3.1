using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppFront.ViewComponents
{
    /// <summary>
    /// TestimonialsViewComponent
    /// </summary>
    public class TestimonialsViewComponent : ViewComponent
    {
        //private IPostRepository repository;

        /// <summary>
        /// TestimonialsViewComponent
        /// </summary>
        public TestimonialsViewComponent()
        {}

        /// <summary>
        /// Invoke
        /// </summary>
        /// <param name="testimonialtag"></param>
        /// <returns></returns>
        public IViewComponentResult Invoke(
            string testimonialtag)
        {
            ViewBag.testimonialtag = testimonialtag;

            return View();
        }
    }
}

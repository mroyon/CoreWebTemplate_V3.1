using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppFront.ViewComponents
{
    /// <summary>
    /// AboutUsViewComponent
    /// </summary>
    public class AboutUsViewComponent : ViewComponent
    {
        //private IPostRepository repository;

        /// <summary>
        /// AboutUsViewComponent
        /// </summary>
        public AboutUsViewComponent()
        {}

        /// <summary>
        /// Invoke
        /// </summary>
        /// <param name="aboutustag"></param>
        /// <returns></returns>
        public IViewComponentResult Invoke(
            string aboutustag)
        {
            ViewBag.aboutustag = aboutustag;

            return View();
        }
    }
}

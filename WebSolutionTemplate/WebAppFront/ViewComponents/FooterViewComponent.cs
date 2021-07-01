using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppFront.ViewComponents
{
    /// <summary>
    /// FooterViewComponent
    /// </summary>
    public class FooterViewComponent : ViewComponent
    {
        //private IPostRepository repository;
        /// <summary>
        /// FooterViewComponent
        /// </summary>
        public FooterViewComponent()
        {}
        /// <summary>
        /// Invoke
        /// </summary>
        /// <param name="footertag"></param>
        /// <returns></returns>
        public IViewComponentResult Invoke(
            string footertag)
        {
            ViewBag.footertag = footertag;

            return View();
        }
    }
}

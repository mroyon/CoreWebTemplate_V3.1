using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppFront.ViewComponents
{
    /// <summary>
    /// HeaderViewComponent
    /// </summary>
    public class HeaderViewComponent : ViewComponent
    {
        //private IPostRepository repository;
        /// <summary>
        /// HeaderViewComponent
        /// </summary>
        public HeaderViewComponent()
        {}
        /// <summary>
        /// Invoke
        /// </summary>
        /// <param name="headertag"></param>
        /// <returns></returns>
        public IViewComponentResult Invoke(
            string headertag)
        {
            ViewBag.headertag = headertag;

            return View();
        }
    }
}

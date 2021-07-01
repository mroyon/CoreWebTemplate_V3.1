using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppFront.ViewComponents
{
    /// <summary>
    /// BannerViewComponent
    /// </summary>
    public class BannerViewComponent : ViewComponent
    {
        //private IPostRepository repository;
        /// <summary>
        /// BannerViewComponent
        /// </summary>
        public BannerViewComponent()
        {}
        /// <summary>
        /// Invoke
        /// </summary>
        /// <param name="bannertag"></param>
        /// <returns></returns>
        public IViewComponentResult Invoke(
            string bannertag)
        {
            ViewBag.bannertag = bannertag;

            return View();
        }
    }
}

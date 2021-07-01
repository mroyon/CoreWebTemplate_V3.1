using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAdmin.ViewComponents
{
    /// <summary>
    /// BreadCrumbsViewComponent
    /// </summary>
    public class BreadCrumbsViewComponent : ViewComponent
    {
        //private IPostRepository repository;

        /// <summary>
        /// AboutUsViewComponent
        /// </summary>
        public BreadCrumbsViewComponent()
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

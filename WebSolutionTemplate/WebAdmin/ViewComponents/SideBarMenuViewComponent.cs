using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAdmin.ViewComponents
{
    /// <summary>
    /// SideBarMenu
    /// </summary>
    public class SideBarMenuViewComponent : ViewComponent
    {
        //private IPostRepository repository;

        /// <summary>
        /// AboutUsViewComponent
        /// </summary>
        public SideBarMenuViewComponent()
        {}

        /// <summary>
        /// Invoke
        /// </summary>
        /// <param name="SideBarMenuTag"></param>
        /// <returns></returns>
        public IViewComponentResult Invoke(
            string headertag)
        {
            ViewBag.headertag = headertag;

            return View();
        }
    }
}

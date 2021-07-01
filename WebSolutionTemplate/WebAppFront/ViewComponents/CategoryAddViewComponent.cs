using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppFront.ViewComponents
{
    /// <summary>
    /// CategoryAddViewComponent
    /// </summary>
    public class CategoryAddViewComponent : ViewComponent
    {
        //private IPostRepository repository;
        /// <summary>
        /// CategoryAddViewComponent
        /// </summary>
        public CategoryAddViewComponent()
        {}
        /// <summary>
        /// Invoke
        /// </summary>
        /// <param name="categoryaddtag"></param>
        /// <returns></returns>
        public IViewComponentResult Invoke(
            string categoryaddtag)
        {
            ViewBag.categoryaddtag = categoryaddtag;

            return View();
        }
    }
}

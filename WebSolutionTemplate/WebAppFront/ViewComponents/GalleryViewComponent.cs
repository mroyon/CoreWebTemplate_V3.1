using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppFront.ViewComponents
{
    /// <summary>
    /// GalleryViewComponent
    /// </summary>
    public class GalleryViewComponent : ViewComponent
    {
        //private IPostRepository repository;
        /// <summary>
        /// GalleryViewComponent
        /// </summary>
        public GalleryViewComponent()
        {}
        /// <summary>
        /// Invoke
        /// </summary>
        /// <param name="gallerytag"></param>
        /// <returns></returns>
        public IViewComponentResult Invoke(
            string gallerytag)
        {
            ViewBag.gallerytag = gallerytag;

            return View();
        }
    }
}

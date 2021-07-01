using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppFront.ViewComponents
{
    /// <summary>
    /// ServicesViewComponent
    /// </summary>
    public class ServicesViewComponent : ViewComponent
    {
        //private IPostRepository repository;
        /// <summary>
        /// ServicesViewComponent
        /// </summary>
        public ServicesViewComponent()
        {}
        /// <summary>
        /// Invoke
        /// </summary>
        /// <param name="servicestag"></param>
        /// <returns></returns>
        public IViewComponentResult Invoke(
            string servicestag)
        {
            ViewBag.servicestag = servicestag;

            return View();
        }
    }
}

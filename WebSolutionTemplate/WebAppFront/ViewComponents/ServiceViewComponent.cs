using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppFront.ViewComponents
{
    /// <summary>
    /// ServiceViewComponent
    /// </summary>
    public class ServiceViewComponent : ViewComponent
    {
        //private IPostRepository repository;
        /// <summary>
        /// ServiceViewComponent
        /// </summary>
        public ServiceViewComponent()
        {}
        /// <summary>
        /// Invoke
        /// </summary>
        /// <param name="servicetag"></param>
        /// <returns></returns>
        public IViewComponentResult Invoke(
            string servicetag)
        {
            ViewBag.servicetag = servicetag;

            return View();
        }
    }
}

using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppFront.ViewComponents
{
    /// <summary>
    /// AppointmentViewComponent
    /// </summary>
    public class AppointmentViewComponent : ViewComponent
    {
        //private IPostRepository repository;

        /// <summary>
        /// AppointmentViewComponent
        /// </summary>
        public AppointmentViewComponent()
        {}

        /// <summary>
        /// Invoke
        /// </summary>
        /// <param name="appointmenttag"></param>
        /// <returns></returns>
        public IViewComponentResult Invoke(
            string appointmenttag)
        {
            ViewBag.appointmenttag = appointmenttag;

            return View();
        }
    }
}

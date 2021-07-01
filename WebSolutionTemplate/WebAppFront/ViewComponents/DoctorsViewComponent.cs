using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppFront.ViewComponents
{
    /// <summary>
    /// DoctorsViewComponent
    /// </summary>
    public class DoctorsViewComponent : ViewComponent
    {
        //private IPostRepository repository;
        /// <summary>
        /// DoctorsViewComponent
        /// </summary>
        public DoctorsViewComponent()
        {}
        /// <summary>
        /// Invoke
        /// </summary>
        /// <param name="doctorstag"></param>
        /// <returns></returns>
        public IViewComponentResult Invoke(
            string doctorstag)
        {
            ViewBag.doctorstag = doctorstag;

            return View();
        }
    }
}

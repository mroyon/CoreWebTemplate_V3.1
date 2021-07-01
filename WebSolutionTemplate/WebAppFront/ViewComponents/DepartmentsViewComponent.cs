using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppFront.ViewComponents
{
    /// <summary>
    /// DepartmentsViewComponent
    /// </summary>
    public class DepartmentsViewComponent : ViewComponent
    {
        //private IPostRepository repository;

        /// <summary>
        /// DepartmentsViewComponent
        /// </summary>
        public DepartmentsViewComponent()
        {}
        /// <summary>
        /// Invoke
        /// </summary>
        /// <param name="departmentstag"></param>
        /// <returns></returns>
        public IViewComponentResult Invoke(
            string departmentstag)
        {
            ViewBag.departmentstag = departmentstag;

            return View();
        }
    }
}

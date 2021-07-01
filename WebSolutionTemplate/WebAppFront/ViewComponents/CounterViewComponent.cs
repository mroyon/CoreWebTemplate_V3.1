using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppFront.ViewComponents
{
    /// <summary>
    /// CounterViewComponent
    /// </summary>
    public class CounterViewComponent : ViewComponent
    {
        //private IPostRepository repository;
        /// <summary>
        /// CounterViewComponent
        /// </summary>
        public CounterViewComponent()
        {}
        /// <summary>
        /// Invoke
        /// </summary>
        /// <param name="countertag"></param>
        /// <returns></returns>
        public IViewComponentResult Invoke(
            string countertag)
        {
            ViewBag.countertag = countertag;

            return View();
        }
    }
}

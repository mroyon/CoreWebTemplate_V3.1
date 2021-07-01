using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppFront.ViewComponents
{
    /// <summary>
    /// PricingViewComponent
    /// </summary>
    public class PricingViewComponent : ViewComponent
    {
        //private IPostRepository repository;
        /// <summary>
        /// PricingViewComponent
        /// </summary>
        public PricingViewComponent()
        {}
        /// <summary>
        /// Invoke
        /// </summary>
        /// <param name="pricingtag"></param>
        /// <returns></returns>
        public IViewComponentResult Invoke(
            string pricingtag)
        {
            ViewBag.pricingtag = pricingtag;

            return View();
        }
    }
}

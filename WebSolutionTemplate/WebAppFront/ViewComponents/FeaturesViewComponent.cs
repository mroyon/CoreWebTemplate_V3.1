using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppFront.ViewComponents
{
    /// <summary>
    /// FeaturesViewComponent
    /// </summary>
    public class FeaturesViewComponent : ViewComponent
    {
        //private IPostRepository repository;
        /// <summary>
        /// FeaturesViewComponent
        /// </summary>
        public FeaturesViewComponent()
        {}
        /// <summary>
        /// Invoke
        /// </summary>
        /// <param name="featurestag"></param>
        /// <returns></returns>
        public IViewComponentResult Invoke(
            string featurestag)
        {
            ViewBag.featurestag = featurestag;

            return View();
        }
    }
}

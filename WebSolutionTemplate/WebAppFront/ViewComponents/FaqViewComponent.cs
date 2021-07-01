using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppFront.ViewComponents
{
    /// <summary>
    /// FaqViewComponent
    /// </summary>
    public class FaqViewComponent : ViewComponent
    {
        //private IPostRepository repository;
        /// <summary>
        /// FaqViewComponent
        /// </summary>
        public FaqViewComponent()
        {}
        /// <summary>
        /// Invoke
        /// </summary>
        /// <param name="faqtag"></param>
        /// <returns></returns>
        public IViewComponentResult Invoke(
            string faqtag)
        {
            ViewBag.faqtag = faqtag;

            return View();
        }
    }
}

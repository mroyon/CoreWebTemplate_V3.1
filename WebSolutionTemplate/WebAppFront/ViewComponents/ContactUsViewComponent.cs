using BDO.DataAccessObjects.CommonEntities;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAppFront.ViewComponents
{
    /// <summary>
    /// ContactUsViewComponent
    /// </summary>
    public class ContactUsViewComponent : ViewComponent
    {
        //private IPostRepository repository;

        /// <summary>
        /// ContactUsViewComponent
        /// </summary>
        public ContactUsViewComponent()
        {}

        /// <summary>
        /// Invoke
        /// </summary>
        /// <param name="contactustag"></param>
        /// <returns></returns>
        public IViewComponentResult Invoke(
            string contactustag)
        {
            ViewBag.contactustag = contactustag;

            var model = new ContactUsModel();

            return View(model);
        }
    }
}

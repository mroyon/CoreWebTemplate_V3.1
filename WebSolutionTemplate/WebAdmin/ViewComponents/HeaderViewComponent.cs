using Microsoft.AspNetCore.Mvc;
using System.Linq;
using System.Reflection;
using BDO.DataAccessObjects.SecurityModule;
using WebAdmin.IntraServices;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using Microsoft.Extensions.Logging;
using Web.Core.Frame.CustomIdentityManagers;
using CLL.Localization;
using WebAdmin.Models;
using System.Diagnostics;

namespace WebAdmin.ViewComponents
{
    /// <summary>
    /// HeaderViewComponent
    /// </summary>
    public class HeaderViewComponent : ViewComponent
    {
        private readonly ILogger<HeaderViewComponent> _logger;
        private readonly ApplicationUserManager<owin_userEntity> _userManager;
        private readonly ApplicationSignInManager<owin_userEntity> _signInManager;
        private readonly IEmailSender _emailSender;
        private readonly IStringLocalizer _sharedLocalizer;
        private readonly IAuthenticationSchemeProvider _schemeProvider;

        //private IPostRepository repository;

        /// <summary>
        /// AboutUsViewComponent
        /// </summary>
        public HeaderViewComponent(
             ApplicationUserManager<owin_userEntity> userManager,
            ApplicationSignInManager<owin_userEntity> signInManager,
            IEmailSender emailSender,
            ILoggerFactory loggerFactory,
            IStringLocalizerFactory factory,
            IAuthenticationSchemeProvider schemeProvider
            )
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _emailSender = emailSender;
            _logger = loggerFactory.CreateLogger<HeaderViewComponent>();
            _schemeProvider = schemeProvider;

            var type = typeof(SharedResource);
            var assemblyName = new AssemblyName(type.GetTypeInfo().Assembly.FullName);
            _sharedLocalizer = factory.Create("SharedResource", assemblyName.Name);
        }

        /// <summary>
        /// Invoke
        /// </summary>
        /// <param name="headertag"></param>
        /// <returns></returns>
        public IViewComponentResult Invoke(
            string headertag)
        {
            ViewBag.headertag = headertag;

            return View();
        }
    }
}

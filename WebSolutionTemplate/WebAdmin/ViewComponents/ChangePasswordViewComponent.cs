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
using System.Threading.Tasks;

namespace WebAdmin.ViewComponents
{
    /// <summary>
    /// HeaderViewComponent
    /// </summary>
    public class ChangePasswordViewComponent : ViewComponent
    {
        private readonly ILogger<HeaderViewComponent> _logger;
        private readonly ApplicationUserManager<owin_userEntity> _userManager;
        private readonly ApplicationSignInManager<owin_userEntity> _signInManager;
        private readonly IStringLocalizer _sharedLocalizer;
        private readonly IAuthenticationSchemeProvider _schemeProvider;

        //private IPostRepository repository;

        /// <summary>
        /// ChangePasswordViewComponent
        /// </summary>
        public ChangePasswordViewComponent(
             ApplicationUserManager<owin_userEntity> userManager,
            ApplicationSignInManager<owin_userEntity> signInManager,
            ILoggerFactory loggerFactory,
            IStringLocalizerFactory factory,
            IAuthenticationSchemeProvider schemeProvider
            )
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _logger = loggerFactory.CreateLogger<HeaderViewComponent>();
            _schemeProvider = schemeProvider;

            var type = typeof(SharedResource);
            var assemblyName = new AssemblyName(type.GetTypeInfo().Assembly.FullName);
            _sharedLocalizer = factory.Create("SharedResource", assemblyName.Name);
        }

        /// <summary>
        /// InvokeAsync
        /// </summary>
        /// <returns></returns>
        public async Task<IViewComponentResult> InvokeAsync()
        {
            var model = new BDO.DataAccessObjects.SecurityModule.owin_userEntity();
            return View(model);
        }

    }
}

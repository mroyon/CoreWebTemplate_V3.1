using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Security.Claims;
using System.Threading.Tasks;
using AppConfig.EncryptionHandler;
using AppConfig.HelperClasses;
using BDO.DataAccessObjects.ExtendedEntities;
using BDO.DataAccessObjects.SecurityModule;
using WebAdmin.IntraServices;
using IdentityModel;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using Microsoft.Extensions.Logging;
using Web.Core.Frame.CustomIdentityManagers;
using CLL.Localization;
using Web.Core.Frame.Interfaces.UseCases;
using Web.Core.Frame.RequestResponse.UseCaseRequests;
using Web.Core.Frame.Presenters;
using BDO.DataAccessObjects.CommonEntities;
using Newtonsoft.Json;

namespace WebAdmin.Controllers
{
    /// <summary>
    /// OwinUser Controller
    /// </summary>
    [Authorize]
    [AutoValidateAntiforgeryToken]
    public class OwinUserController : BaseController
    {
        private readonly IAuth_UseCase _auth_UseCase;
        private readonly Auth_Presenter _auth_UsePresenter;

        private readonly IOwin_UserUseCase _owin_UserUseCase;
        private readonly Owin_UserPresenter _owin_UserPresenter;

        private readonly ApplicationUserManager<owin_userEntity> _userManager;
        private readonly ApplicationSignInManager<owin_userEntity> _signInManager;
        private readonly ILogger<AccountController> _logger;
        private readonly IStringLocalizer _sharedLocalizer;
        private readonly IAuthenticationSchemeProvider _schemeProvider;

        /// <summary>
        /// OwinUserController
        /// </summary>
        /// <param name="auth_UseCase"></param>
        /// <param name="auth_UsePresenter"></param>
        /// <param name="owin_UserUseCase"></param>
        /// <param name="owin_UserPresenter"></param>
        /// <param name="userManager"></param>
        /// <param name="signInManager"></param>
        /// <param name="loggerFactory"></param>
        /// <param name="factory"></param>
        /// <param name="schemeProvider"></param>
        public OwinUserController(
                        IAuth_UseCase auth_UseCase,
                        Auth_Presenter auth_UsePresenter,
            IOwin_UserUseCase owin_UserUseCase,
            Owin_UserPresenter owin_UserPresenter,

            ApplicationUserManager<owin_userEntity> userManager,
            ApplicationSignInManager<owin_userEntity> signInManager,
            ILoggerFactory loggerFactory,
            IStringLocalizerFactory factory,
            IAuthenticationSchemeProvider schemeProvider)

        {
            _auth_UseCase = auth_UseCase;
            _auth_UsePresenter = auth_UsePresenter;
            _owin_UserUseCase = owin_UserUseCase;
            _owin_UserPresenter = owin_UserPresenter;

            _userManager = userManager;
            _signInManager = signInManager;
            _logger = loggerFactory.CreateLogger<AccountController>();
            _schemeProvider = schemeProvider;

            var type = typeof(SharedResource);
            var assemblyName = new AssemblyName(type.GetTypeInfo().Assembly.FullName);
            _sharedLocalizer = factory.Create("SharedResource", assemblyName.Name);
        }

        /// <summary>
        /// GetListView
        /// </summary>
        /// <param name="returnUrl"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> LandingOwinUser(string returnUrl)
        {
            if (!User.Identity.IsAuthenticated){return RedirectToAction("Account", "Login");}
            return View("../Account/UserManagement/LandingOwinUser", new owin_userEntity());
        }


        /// <summary>
        /// ListOwinUser
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        [AutoValidateAntiforgeryToken]
        public async Task<IActionResult> ListOwinUser(DtParameters request)
        {
            try
            {
                var draw = request.Draw;
                owin_userEntity objrequest = new owin_userEntity();
                objrequest.BaseSecurityParam = new BDO.Base.SecurityCapsule();
                objrequest.BaseSecurityParam = request.BaseSecurityParam;
                objrequest.CurrentPage = request.Start == 0 ? 1 : request.Start / request.Length + 1;
                objrequest.PageSize = request.Length;
                objrequest.SortExpression = request.SortOrder + " " + request.Order[0].Dir;
                objrequest.strCommonSerachParam = request.Search.Value;
                objrequest.ControllerName = "OwinUser";
                await _owin_UserUseCase.GetListView(new Owin_UserRequest(objrequest), _owin_UserPresenter);
                return Json(_owin_UserPresenter.Result);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



    }
}
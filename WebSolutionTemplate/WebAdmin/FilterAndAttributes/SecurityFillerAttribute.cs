using AppConfig.EncryptionHandler;
using AppConfig.HelperClasses;
using BDO.Base;
using BDO.DataAccessObjects.ExtendedEntities;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Web.Core.Frame.Interfaces.Services;
using WebAdmin.IntraServices;

namespace WebAdmin.FilterAndAttributes
{
    /// <summary>
    /// SecurityFillerAttribute
    /// </summary>
    public class SecurityFillerAttribute : IAsyncActionFilter
    {

        private readonly IHostingEnvironment _HostingEnvironment;
        private readonly IConfiguration _config;
        private readonly IHttpContextAccessor _contextAccessor;
        /// <summary>
        /// SecurityFillerAttribute
        /// </summary>
        /// <param name="contextAccessor"></param>
        public SecurityFillerAttribute(IHttpContextAccessor contextAccessor,
            IHostingEnvironment HostingEnvironment,
                        IConfiguration config)
        {
            _HostingEnvironment = HostingEnvironment;
            _contextAccessor = contextAccessor;
            _config = config;
        }

        /// <summary>
        /// OnActionExecutionAsync
        /// </summary>
        /// <param name="context"></param>
        /// <param name="next"></param>
        /// <returns></returns>
        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            var actionDescriptor = context.ActionDescriptor as ControllerActionDescriptor;
            var controllerName = actionDescriptor.ControllerName;
            var actionName = actionDescriptor.ActionName;

            if (!_exceptionControllerAction._exceptionControllerActionGet().Exists(p=> p.Action == actionName && p.Controller == controllerName))
            {
                var userPrincipal = context.HttpContext.User.Claims;
                string Token = context.HttpContext.Request.Headers["X-CSRF-TOKEN-WEBADMINHEADER"].FirstOrDefault()?.Split(" ").Last();
                string coockieToken = context.HttpContext.Request.Cookies["X-CSRF-TOKEN-WEBADMIN"].ToString();
                List<Claim> cp =  GetClaimFromCookie(context.HttpContext, "CustomWebIdentity.V2.90");
                if (cp != null)
                {
                    var secobject = cp.Where(p => p.Type == "secobject").FirstOrDefault().Value;
                    var transid = userPrincipal.Where(p => p.Type == "TRANS").FirstOrDefault().Value;
                    var userid = cp.Where(p => p.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier").FirstOrDefault().Value;

                    DateTime dt = DateTime.Now;
                    EncryptionHelper objEnc = new EncryptionHelper();
                    var authSettings = _config.GetSection(nameof(AuthSettings)).Get<AuthSettings>();
                    string strserialize = objEnc.Decrypt(secobject, true, authSettings.SecretKey);
                    transid = objEnc.Decrypt(transid, true, authSettings.SecretKey);
                    SecurityCapsule _securityCapsule = JsonConvert.DeserializeObject<SecurityCapsule>(strserialize);
                    DateTime loginDate = new DateTime(long.Parse(transid.Split('.').Last()));

                    if (context.ActionArguments.Count > 0 && 
                        _securityCapsule != null && 
                        context.ActionArguments.ContainsKey("request"))
                    {
                        SecurityCapsule objBase = ((BDO.Base.BaseEntity)context.ActionArguments["request"])?.BaseSecurityParam;
                        if (objBase == null)
                            objBase = new SecurityCapsule();

                        objBase.actioname = actionName;
                        objBase.controllername = controllerName;
                        objBase.createdbyusername = userid.ToString();
                        objBase.updatedbyusername = userid.ToString();
                        objBase.ipaddress = context.HttpContext.Connection.RemoteIpAddress?.ToString() ?? "127.0.0.1";
                        objBase.createddate = dt;
                        objBase.updateddate = dt;
                        objBase.transid = transid;
                        ((BDO.Base.BaseEntity)context.ActionArguments["request"]).BaseSecurityParam = objBase;
                    }
                }
            }
            var resultContext = await next();
        }
        private List<Claim> GetClaimFromCookie(HttpContext httpContext, string cookieName)
        {
            // Get the encrypted cookie value
            var opt = httpContext.RequestServices.GetRequiredService<IOptionsMonitor<CookieAuthenticationOptions>>();
            var cookie = opt.CurrentValue.CookieManager.GetRequestCookie(httpContext, cookieName);
            // Decrypt if found
            if (!string.IsNullOrEmpty(cookie))
            {
                var dataProtector = opt.CurrentValue.DataProtectionProvider.CreateProtector("Microsoft.AspNetCore.Authentication.Cookies.CookieAuthenticationMiddleware", IdentityConstants.ApplicationScheme, "v2");
                var ticketDataFormat = new TicketDataFormat(dataProtector);
                var ticket = ticketDataFormat.Unprotect(cookie);
                return ticket.Principal.Claims.ToList();
            }
            return null;
        }


    }
}

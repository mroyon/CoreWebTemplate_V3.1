using AppConfig.EncryptionHandler;
using AppConfig.HelperClasses;
using BDO.Base;
using BDO.DataAccessObjects.ExtendedEntities;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Web.Core.Frame.Interfaces.Services;

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
            var tenant = await FillSecurity(context);
            var actionDescriptor = context.ActionDescriptor as ControllerActionDescriptor;
            var actionName = actionDescriptor.ActionName;
            if (actionName != "Login")
            {
                var userPrincipal = context.HttpContext.User.Claims;
                string Token = context.HttpContext.Request.Headers["X-CSRF-TOKEN-WEBADMINHEADER"].FirstOrDefault()?.Split(" ").Last();
                string coockieToken = context.HttpContext.Request.Cookies["X-CSRF-TOKEN-WEBADMIN"].ToString();



                //EncryptionHelper objEnc = new EncryptionHelper();
                //var authSettings = _config.GetSection(nameof(AuthSettings)).Get<AuthSettings>();
                //string strserialize = objEnc.Decrypt(Token, true, authSettings.SecretKey);

                //claims.Add(new Claim("secobject", strserialize));


            }
            var resultContext = await next();
            
            //if (resultContext.Result is ViewResult view)
            //{
            //    view.ViewData["Tenant"] = tenant;
            //}
        }

        /// <summary>
        /// OnActionExecutingAsync
        /// </summary>
        /// <param name="context"></param>
        public async Task OnActionExecutingAsync(ActionExecutingContext context)
        {
            //if (context.ModelState.IsValid)
            //{
            var actionDescriptor = context.ActionDescriptor as ControllerActionDescriptor;
            var actionName = actionDescriptor.ActionName;
            var controllerName = actionDescriptor.ControllerName;
            if (actionName == "Login")
            {
                return;
            }
            /*
            string Token = context.HttpContext.Request.Headers["X-CSRF-TOKEN-WEBADMINHEADER"].FirstOrDefault()?.Split(" ").Last();
            if (context.ActionArguments.Count > 0 && Token != null)
            {
                //var cp;// _jwtTokenValidator.GetPrincipalFromToken(Token);
                //if (cp != null)
                //{
                //    var id = cp.Claims.First(c => c.Type == "id").Value;
                //    var username = cp.Claims.First(c => c.Type == "CreatedByUserName").Value;
                //    var transid = cp.Claims.First(c => c.Type == "TransID").Value;
                //    DateTime dt = DateTime.Now;
                //    SecurityCapsule objBase = ((BDO.Base.BaseEntity)context.ActionArguments["request"])?.BaseSecurityParam;
                //    if (objBase == null)
                //        objBase = new SecurityCapsule();
                //    objBase.actioname = actionName;
                //    objBase.controllername = controllerName;
                //    objBase.createdbyusername = id.ToString();
                //    objBase.updatedbyusername = id.ToString();
                //    objBase.ipaddress = context.HttpContext.Connection.RemoteIpAddress?.ToString() ?? "127.0.0.1";
                //    objBase.createddate = dt;
                //    objBase.updateddate = dt;
                //    objBase.transid = transid;
                //    ((BDO.Base.BaseEntity)context.ActionArguments["request"]).BaseSecurityParam = objBase;
                //}
            }
            else
            {
                if (_HostingEnvironment.IsDevelopment())
                {
                    //THIS IS MOCK, REMOVE WHEN PUBLISH. COS WITHOUT SECURITY ACCESS TOKEN IT SHOULD NOT WORK!!!
                    DateTime dt = DateTime.Now;
                    bool reqobject = false;
                    SecurityCapsule objBase = null;
                    if (objBase == null)
                        objBase = new SecurityCapsule();
                    if (context.ActionArguments.Count > 0)
                    {
                        objBase = ((BDO.Base.BaseEntity)context.ActionArguments["request"])?.BaseSecurityParam;
                        if (objBase == null)
                            objBase = new SecurityCapsule();
                        reqobject = true;
                    }
                    else
                    {
                        reqobject = false;
                    }

                    if (objBase != null)
                    {
                        objBase.actioname = actionName;
                        objBase.controllername = controllerName;
                        objBase.createdbyusername = "e527c07f-de86-44c6-9f93-0000800d295a";
                        objBase.updatedbyusername = "e527c07f-de86-44c6-9f93-0000800d295a";
                        objBase.ipaddress = context.HttpContext.Connection.RemoteIpAddress?.ToString() ?? "127.0.0.1";
                        objBase.createddate = dt;
                        objBase.updateddate = dt;
                        objBase.transid = "DUMMYTRANSID";
                        if (reqobject)
                            ((BDO.Base.BaseEntity)context.ActionArguments["request"]).BaseSecurityParam = objBase;
                        else
                            context.ActionArguments.Add("request", objBase);
                    }
                }
            }
             */
            return;
        }

        /// <summary>
        /// FillSecurity
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public async Task<SecurityCapsule> FillSecurity(ActionExecutingContext context)
        {
            if (context.ActionArguments.TryGetValue("model", out object value))
            //&& value is SecurityCapsule BaseSecurityParam)
            {
                await Task.Delay(500);
                if (value != null)
                {
                    DateTime dt = DateTime.Now;
                    var claimsIdentity = context.HttpContext.User.Identity as ClaimsIdentity;

                    var actionDescriptor = context.ActionDescriptor as ControllerActionDescriptor;

                    var actionName = actionDescriptor.ActionName;
                    var controllerName = actionDescriptor.ControllerName;

                    BaseEntity ob = ((BaseEntity)value);
                    ob.BaseSecurityParam = new SecurityCapsule();

                    if (claimsIdentity.Claims.Count() > 0)
                    {
                        var _securityCapsule = JsonConvert.DeserializeObject<SecurityCapsule>(claimsIdentity.Claims.ToList().Where(p => p.Type == "secobject").FirstOrDefault().Value);
                        ob.BaseSecurityParam = _securityCapsule;
                    }
                    else
                    {
                        ob.BaseSecurityParam.createdbyusername = context.HttpContext.Session.Id;
                        ob.BaseSecurityParam.createddate = dt;
                        ob.BaseSecurityParam.updatedbyusername = context.HttpContext.Session.Id;
                        ob.BaseSecurityParam.updateddate = dt;

                        transactioncodeGen objTranIDGen = new transactioncodeGen();
                        ob.BaseSecurityParam.sessionid = _contextAccessor.HttpContext.Session.Id;
                        ob.BaseSecurityParam.transid = objTranIDGen.GetRandomAlphaNumericStringForTransactionActivity("TRANS", dt);
                        ob.BaseSecurityParam.usertoken = ob.BaseSecurityParam.transid;
                    }
                    ob.BaseSecurityParam.actioname = actionName;
                    ob.BaseSecurityParam.controllername = controllerName;
                    ob.BaseSecurityParam.pageurl = context.HttpContext.Request.GetDisplayUrl();
                    ob.BaseSecurityParam.ipaddress = context.HttpContext.Connection.RemoteIpAddress.ToString();

                    return new SecurityCapsule(); //ob.BaseSecurityParam;
                }
                //var authContext = await _service.GetAuthorizationContextAsync(returnUrl);
            }

            // no string parameter called returnUrl
            return null;
        }
    }
}

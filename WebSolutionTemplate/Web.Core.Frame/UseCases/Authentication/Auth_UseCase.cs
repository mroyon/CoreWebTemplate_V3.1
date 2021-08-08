using CLL.Localization;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Localization;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading;
using System.Threading.Tasks;
using Web.Core.Frame.RequestResponse.UseCaseRequests;
using Web.Core.Frame.RequestResponse.UseCaseResponses;
using Web.Core.Frame.Interfaces;
using Web.Core.Frame.Interfaces.Services;
using Web.Core.Frame.Interfaces.UseCases;
using Web.Core.Frame.Dto;
using BDO.DataAccessObjects.Models;
using BDO.DataAccessObjects.ExtendedEntities;
using System.IO;
using Microsoft.AspNetCore.Hosting;
using System.Text;
using Microsoft.Extensions.Options;

namespace Web.Core.Frame.UseCases
{
    public sealed class Auth_UseCase : IAuth_UseCase
    {
        private readonly IOptions<ApplicationGlobalSettings> _applicationGlobalSettings;
        private readonly IHttpContextAccessor _contextAccessor;
        private readonly IJwtFactory _jwtFactory;
        private readonly IStringLocalizer _sharedLocalizer;
        private readonly ILogger<Gen_FAQCagetogyUseCase> _logger;
        private readonly IEmailSender _emailSender;
        private readonly IHostingEnvironment _environment;


        public Error _errors { get; set; }

        public Auth_UseCase(
            IHttpContextAccessor contextAccessor,
            IJwtFactory jwtFactory,
            IStringLocalizerFactory factory,
            ILoggerFactory loggerFactory,
            IEmailSender emailSender,
            IHostingEnvironment environment,
            IOptions<ApplicationGlobalSettings> applicationGlobalSettings)
        {
            _contextAccessor = contextAccessor;
            _jwtFactory = jwtFactory;
            _logger = loggerFactory.CreateLogger<Gen_FAQCagetogyUseCase>();
            _emailSender = emailSender;
            _environment = environment;
            _applicationGlobalSettings = applicationGlobalSettings;

            var type = typeof(SharedResource);
            var assemblyName = new AssemblyName(type.GetTypeInfo().Assembly.FullName);
            _sharedLocalizer = factory.Create("SharedResource", assemblyName.Name);
        }

        public Task<bool> Handle(Auth_Request message, IOutputPort<Auth_Response> outputPort)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> ForgetPasswordRequest(Auth_Request message, IOutputPort_Auth<Auth_Response> outputPort)
        {
            CancellationToken cancellationToken = new CancellationToken();
            string authcode = string.Empty;
            try
            {
                authcode = await BFC.Core.FacadeCreatorObjects.Security.ExtendedPartial.FCCKAFUserSecurity.GetFacadeCreate(_contextAccessor).ForgetPasswordRequest(message.Obj_owin_user, cancellationToken);
                if (!string.IsNullOrEmpty(authcode))
                {
                    string html = System.IO.File.ReadAllText(Path.Combine(Environment.CurrentDirectory, "EmailTemplate/forgetPasswordAuthCode" + Thread.CurrentThread.CurrentCulture.ToString().ToUpper() + ".html"));
                    //using (StreamReader streamReader = new StreamReader(Path.Combine(Environment.CurrentDirectory, "EmailTemplate/forgetPasswordAuthCode" + cul), Encoding.UTF8))
                    //{
                    //    html = streamReader.ReadToEnd();
                    //}
                    html = html.Replace("{authocode}", authcode);
                    html = html.Replace("{resetpasswordurl}", "url");
                    _emailSender.SendEmailAsync(message.Obj_owin_user.emailaddress, _sharedLocalizer["RESET_YOUR_PASSWORD"].Value, "asdf");
                }
                outputPort.ForgetPasswordAjax(new Auth_Response(new AjaxResponse("200", _sharedLocalizer["FORGETPASSWORDEMAIL"].Value, CLL.LLClasses._Status._statusSuccess, CLL.LLClasses._Status._titleInformation, ""
                    ),  true, null));
                return true;
            }
            catch (Exception ex)
            {
                Auth_Response objResponse = new Auth_Response(false, _sharedLocalizer["DATA_DELETE_ERROR"], new Error(
                         "500",
                         ex.Message));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.ForgetPassword(objResponse);
                return true;
            }
        }

    }
}

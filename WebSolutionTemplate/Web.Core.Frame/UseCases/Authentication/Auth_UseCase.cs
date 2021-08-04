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

namespace Web.Core.Frame.UseCases
{
    public sealed class Auth_UseCase : IAuth_UseCase
    {
        private readonly IHttpContextAccessor _contextAccessor;
        private readonly IJwtFactory _jwtFactory;
        private readonly IStringLocalizer _sharedLocalizer;
        private readonly ILogger<Gen_FAQCagetogyUseCase> _logger;
        private readonly IHttpClientHR _ihttpclienthr;

        public Error _errors { get; set; }

        public Auth_UseCase(
            IHttpContextAccessor contextAccessor,
            IJwtFactory jwtFactory,
            IStringLocalizerFactory factory,
            ILoggerFactory loggerFactory
            , IHttpClientHR ihttpclienthr)
        {
            _contextAccessor = contextAccessor;
            _jwtFactory = jwtFactory;
            _logger = loggerFactory.CreateLogger<Gen_FAQCagetogyUseCase>();

            var type = typeof(SharedResource);
            var assemblyName = new AssemblyName(type.GetTypeInfo().Assembly.FullName);
            _sharedLocalizer = factory.Create("SharedResource", assemblyName.Name);
            _ihttpclienthr = ihttpclienthr;
        }

        public Task<bool> Handle(Auth_Request message, IOutputPort<Auth_Response> outputPort)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> ForgetPasswordRequest(Auth_Request message, IOutputPort_Auth<Auth_Response> outputPort)
        {
            CancellationToken cancellationToken = new CancellationToken();
            long? i = null;
            try
            {
                i = await BFC.Core.FacadeCreatorObjects.Security.ExtendedPartial.FCCKAFUserSecurity.GetFacadeCreate(_contextAccessor).ForgetPasswordRequest(message.Obj_owin_user, cancellationToken);
                outputPort.ForgetPassword(new Auth_Response(true, _sharedLocalizer["FORGETPASSWORDEMAIL"], null));
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

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
using BDO.DataAccessObjects.SecurityModule;
using BDO.DataAccessObjects.ExtendedEntities;

namespace Web.Core.Frame.UseCases
{
    public sealed class Owin_UserPasswordResetInfoUseCase : IOwin_UserPasswordResetInfoUseCase
    {
        private readonly IHttpContextAccessor _contextAccessor;
        private readonly IJwtFactory _jwtFactory;
        private readonly IStringLocalizer _sharedLocalizer;
        private readonly ILogger<Owin_UserPasswordResetInfoUseCase> _logger;
        

        public Error _errors { get; set; }

        public Owin_UserPasswordResetInfoUseCase(
            IHttpContextAccessor contextAccessor,
            IJwtFactory jwtFactory,
            IStringLocalizerFactory factory,
            ILoggerFactory loggerFactory
            )
        {
            _contextAccessor = contextAccessor;
            _jwtFactory = jwtFactory;
            _logger = loggerFactory.CreateLogger<Owin_UserPasswordResetInfoUseCase>();

            var type = typeof(SharedResource);
            var assemblyName = new AssemblyName(type.GetTypeInfo().Assembly.FullName);
            _sharedLocalizer = factory.Create("SharedResource", assemblyName.Name);
            
        }

        public Task<bool> Handle(Owin_UserPasswordResetInfoRequest message, IOutputPort<Owin_UserPasswordResetInfoResponse> outputPort)
        {
            throw new Exception("Not Implemented");
        }

        public async Task<bool> GetAll(Owin_UserPasswordResetInfoRequest message, ICRUDRequestHandler<Owin_UserPasswordResetInfoResponse> outputPort)
        {
            CancellationToken cancellationToken = new CancellationToken();
            try
            {
                IList<owin_userpasswordresetinfoEntity> oblist = await BFC.Core.FacadeCreatorObjects.Security.owin_userpasswordresetinfoFCC.GetFacadeCreate(_contextAccessor)
                .GetAll(new BDO.DataAccessObjects.SecurityModule.owin_userpasswordresetinfoEntity(), cancellationToken);

                if (oblist != null && oblist.Count > 0)
                {
                    outputPort.GetAll(new Owin_UserPasswordResetInfoResponse(oblist.ToList(), true));
                }
                else
                {
                    Owin_UserPasswordResetInfoResponse objResponse = new Owin_UserPasswordResetInfoResponse(false, _sharedLocalizer["NO_DATA_FOUND"], new Error(
                     "404",
                     _sharedLocalizer["NO_DATA_FOUND"]));
                    _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                    outputPort.GetAll(objResponse);
                }
                return true;
            }
            catch (Exception ex)
            {
                Owin_UserPasswordResetInfoResponse objResponse = new Owin_UserPasswordResetInfoResponse(false, _sharedLocalizer["DATA_FETCH_ERROR"], new Error(
                    "500",
                    ex.Message));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.GetAll(objResponse);
                return true;
            }
        }

        public async Task<bool> GetAllPaged(Owin_UserPasswordResetInfoRequest message, ICRUDRequestHandler<Owin_UserPasswordResetInfoResponse> outputPort)
        {
            CancellationToken cancellationToken = new CancellationToken();
            try
            {
                IList<owin_userpasswordresetinfoEntity> oblist = await BFC.Core.FacadeCreatorObjects.Security.owin_userpasswordresetinfoFCC.GetFacadeCreate(_contextAccessor)
                .GetAllByPages(message.Objowin_userpasswordresetinfo, cancellationToken);

                if (oblist != null && oblist.Count > 0)
                {
                    outputPort.GetAllPaged(new Owin_UserPasswordResetInfoResponse(oblist.ToList(), true));
                }
                else
                {
                    Owin_UserPasswordResetInfoResponse objResponse = new Owin_UserPasswordResetInfoResponse(false, _sharedLocalizer["NO_DATA_FOUND"], new Error(
                     "404",
                     _sharedLocalizer["NO_DATA_FOUND"]));
                    _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                    outputPort.GetAllPaged(objResponse);
                }
                return true;
            }
            catch (Exception ex)
            {
                Owin_UserPasswordResetInfoResponse objResponse = new Owin_UserPasswordResetInfoResponse(false, _sharedLocalizer["DATA_FETCH_ERROR"], new Error(
                    "500",
                    ex.Message));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.GetAllPaged(objResponse);
                return true;
            }
        }

        public async Task<bool> GetListView(Owin_UserPasswordResetInfoRequest message, ICRUDRequestHandler<Owin_UserPasswordResetInfoResponse> outputPort)
        {
            CancellationToken cancellationToken = new CancellationToken();
            try
            {

                IList<owin_userpasswordresetinfoEntity> oblist = await BFC.Core.FacadeCreatorObjects.Security.owin_userpasswordresetinfoFCC.GetFacadeCreate(_contextAccessor)
                .GAPgListView(message.Objowin_userpasswordresetinfo, cancellationToken);
                if (oblist != null && oblist.Count > 0)
                {
                    outputPort.GetListView(new Owin_UserPasswordResetInfoResponse(oblist.ToList(), true));
                }
                else
                {
                    Owin_UserPasswordResetInfoResponse objResponse = new Owin_UserPasswordResetInfoResponse(false, _sharedLocalizer["NO_DATA_FOUND"], new Error(
                     "404",
                     _sharedLocalizer["NO_DATA_FOUND"]));
                    _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                    outputPort.GetListView(objResponse);
                }
                return true;
            }
            catch (Exception ex)
            {
                Owin_UserPasswordResetInfoResponse objResponse = new Owin_UserPasswordResetInfoResponse(false, _sharedLocalizer["DATA_FETCH_ERROR"], new Error(
                    "500",
                    ex.Message));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.GetListView(objResponse);
                return true;
            }
        }

        public async Task<bool> GetSingle(Owin_UserPasswordResetInfoRequest message, ICRUDRequestHandler<Owin_UserPasswordResetInfoResponse> outputPort)
        {
            CancellationToken cancellationToken = new CancellationToken();
            try
            {
                owin_userpasswordresetinfoEntity objSingle = await BFC.Core.FacadeCreatorObjects.Security.owin_userpasswordresetinfoFCC.GetFacadeCreate(_contextAccessor)
                .GetSingle(message.Objowin_userpasswordresetinfo, cancellationToken);
                if (objSingle != null)
                {
                    outputPort.GetSingle(new Owin_UserPasswordResetInfoResponse(objSingle, true));
                }
                else
                {
                    Owin_UserPasswordResetInfoResponse objResponse = new Owin_UserPasswordResetInfoResponse(false, _sharedLocalizer["NO_DATA_FOUND"], new Error(
                     "404",
                     _sharedLocalizer["NO_DATA_FOUND"]));
                    _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                    outputPort.GetSingle(objResponse);
                }
                return true;
            }
            catch (Exception ex)
            {
                Owin_UserPasswordResetInfoResponse objResponse = new Owin_UserPasswordResetInfoResponse(false, _sharedLocalizer["DATA_FETCH_ERROR"], new Error(
                    "500",
                    ex.Message));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.GetSingle(objResponse);
                return true;
            }
        }

        public async Task<bool> Save(Owin_UserPasswordResetInfoRequest message, ICRUDRequestHandler<Owin_UserPasswordResetInfoResponse> outputPort)
        {
            _logger.LogInformation(JsonConvert.SerializeObject(message));
            CancellationToken cancellationToken = new CancellationToken();
            long? i = null;
            try
            {
                i = await BFC.Core.FacadeCreatorObjects.Security.owin_userpasswordresetinfoFCC.GetFacadeCreate(_contextAccessor)
                    .Add(message.Objowin_userpasswordresetinfo, cancellationToken);
                outputPort.Save(new Owin_UserPasswordResetInfoResponse(true, _sharedLocalizer["DATA_SAVE_CONFIRMATION"], null));
                return true;
            }
            catch (Exception ex)
            {
                Owin_UserPasswordResetInfoResponse objResponse = new Owin_UserPasswordResetInfoResponse(false, _sharedLocalizer["DATA_SAVE_ERROR"], new Error(
                    "500",
                    ex.Message));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.Save(objResponse);
                return true;
            }
        }

        public async Task<bool> Update(Owin_UserPasswordResetInfoRequest message, ICRUDRequestHandler<Owin_UserPasswordResetInfoResponse> outputPort)
        {
            CancellationToken cancellationToken = new CancellationToken();
            long? i = null;
            try
            {
                i = await BFC.Core.FacadeCreatorObjects.Security.owin_userpasswordresetinfoFCC.GetFacadeCreate(_contextAccessor)
                    .Update(message.Objowin_userpasswordresetinfo, cancellationToken);
                outputPort.Update(new Owin_UserPasswordResetInfoResponse(true, _sharedLocalizer["DATA_UPDATE_CONFIRMATION"], null));
                return true;
            }
            catch (Exception ex)
            {
                Owin_UserPasswordResetInfoResponse objResponse = new Owin_UserPasswordResetInfoResponse(false, _sharedLocalizer["DATA_UPDATE_ERROR"], new Error(
                       "500",
                       ex.Message));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.Update(objResponse);
                return true;
            }
        }

        public async Task<bool> Delete(Owin_UserPasswordResetInfoRequest message, ICRUDRequestHandler<Owin_UserPasswordResetInfoResponse> outputPort)
        {
            CancellationToken cancellationToken = new CancellationToken();
            long? i = null;
            try
            {
                i = await BFC.Core.FacadeCreatorObjects.Security.owin_userpasswordresetinfoFCC.GetFacadeCreate(_contextAccessor)
                    .Delete(message.Objowin_userpasswordresetinfo, cancellationToken);
                outputPort.Delete(new Owin_UserPasswordResetInfoResponse(true, _sharedLocalizer["DATA_DELETE_CONFIRMATION"], null));
                return true;
            }
            catch (Exception ex)
            {
                Owin_UserPasswordResetInfoResponse objResponse = new Owin_UserPasswordResetInfoResponse(false, _sharedLocalizer["DATA_DELETE_ERROR"], new Error("500",ex.Message.ToString()));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.Delete(objResponse);
                return true;
            }
        }
    }
}
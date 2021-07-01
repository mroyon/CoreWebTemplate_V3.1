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

namespace Web.Core.Frame.UseCases
{
    public sealed class Owin_UserPrefferencesSettingsUseCase : IOwin_UserPrefferencesSettingsUseCase
    {
        private readonly IHttpContextAccessor _contextAccessor;
        private readonly IJwtFactory _jwtFactory;
        private readonly IStringLocalizer _sharedLocalizer;
        private readonly ILogger<Owin_UserPrefferencesSettingsUseCase> _logger;
        private readonly IHttpClientHR _ihttpclienthr;

        public Error _errors { get; set; }

        public Owin_UserPrefferencesSettingsUseCase(
            IHttpContextAccessor contextAccessor,
            IJwtFactory jwtFactory,
            IStringLocalizerFactory factory,
            ILoggerFactory loggerFactory
            , IHttpClientHR ihttpclienthr)
        {
            _contextAccessor = contextAccessor;
            _jwtFactory = jwtFactory;
            _logger = loggerFactory.CreateLogger<Owin_UserPrefferencesSettingsUseCase>();

            var type = typeof(SharedResource);
            var assemblyName = new AssemblyName(type.GetTypeInfo().Assembly.FullName);
            _sharedLocalizer = factory.Create("SharedResource", assemblyName.Name);
            _ihttpclienthr = ihttpclienthr;
        }

        public Task<bool> Handle(Owin_UserPrefferencesSettingsRequest message, IOutputPort<Owin_UserPrefferencesSettingsResponse> outputPort)
        {
            throw new Exception("Not Implemented");
        }

        public async Task<bool> GetAll(Owin_UserPrefferencesSettingsRequest message, ICRUDRequestHandler<Owin_UserPrefferencesSettingsResponse> outputPort)
        {
            CancellationToken cancellationToken = new CancellationToken();
            try
            {
                IList<owin_userprefferencessettingsEntity> oblist = await BFC.Core.FacadeCreatorObjects.Security.owin_userprefferencessettingsFCC.GetFacadeCreate(_contextAccessor)
                .GetAll(new BDO.DataAccessObjects.SecurityModule.owin_userprefferencessettingsEntity(), cancellationToken);

                if (oblist != null && oblist.Count > 0)
                {
                    outputPort.GetAll(new Owin_UserPrefferencesSettingsResponse(oblist.ToList(), true));
                }
                else
                {
                    Owin_UserPrefferencesSettingsResponse objResponse = new Owin_UserPrefferencesSettingsResponse(false, _sharedLocalizer["NO_DATA_FOUND"], new Error(
                     "404",
                     _sharedLocalizer["NO_DATA_FOUND"]));
                    _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                    outputPort.GetAll(objResponse);
                }
                return true;
            }
            catch (Exception ex)
            {
                Owin_UserPrefferencesSettingsResponse objResponse = new Owin_UserPrefferencesSettingsResponse(false, _sharedLocalizer["DATA_FETCH_ERROR"], new Error(
                    "500",
                    ex.Message));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.GetAll(objResponse);
                return true;
            }
        }

        public async Task<bool> GetAllPaged(Owin_UserPrefferencesSettingsRequest message, ICRUDRequestHandler<Owin_UserPrefferencesSettingsResponse> outputPort)
        {
            CancellationToken cancellationToken = new CancellationToken();
            try
            {
                IList<owin_userprefferencessettingsEntity> oblist = await BFC.Core.FacadeCreatorObjects.Security.owin_userprefferencessettingsFCC.GetFacadeCreate(_contextAccessor)
                .GetAllByPages(message.Objowin_userprefferencessettings, cancellationToken);

                if (oblist != null && oblist.Count > 0)
                {
                    outputPort.GetAllPaged(new Owin_UserPrefferencesSettingsResponse(oblist.ToList(), true));
                }
                else
                {
                    Owin_UserPrefferencesSettingsResponse objResponse = new Owin_UserPrefferencesSettingsResponse(false, _sharedLocalizer["NO_DATA_FOUND"], new Error(
                     "404",
                     _sharedLocalizer["NO_DATA_FOUND"]));
                    _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                    outputPort.GetAllPaged(objResponse);
                }
                return true;
            }
            catch (Exception ex)
            {
                Owin_UserPrefferencesSettingsResponse objResponse = new Owin_UserPrefferencesSettingsResponse(false, _sharedLocalizer["DATA_FETCH_ERROR"], new Error(
                    "500",
                    ex.Message));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.GetAllPaged(objResponse);
                return true;
            }
        }

        public async Task<bool> GetListView(Owin_UserPrefferencesSettingsRequest message, ICRUDRequestHandler<Owin_UserPrefferencesSettingsResponse> outputPort)
        {
            CancellationToken cancellationToken = new CancellationToken();
            try
            {

                IList<owin_userprefferencessettingsEntity> oblist = await BFC.Core.FacadeCreatorObjects.Security.owin_userprefferencessettingsFCC.GetFacadeCreate(_contextAccessor)
                .GAPgListView(message.Objowin_userprefferencessettings, cancellationToken);
                if (oblist != null && oblist.Count > 0)
                {
                    outputPort.GetListView(new Owin_UserPrefferencesSettingsResponse(oblist.ToList(), true));
                }
                else
                {
                    Owin_UserPrefferencesSettingsResponse objResponse = new Owin_UserPrefferencesSettingsResponse(false, _sharedLocalizer["NO_DATA_FOUND"], new Error(
                     "404",
                     _sharedLocalizer["NO_DATA_FOUND"]));
                    _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                    outputPort.GetListView(objResponse);
                }
                return true;
            }
            catch (Exception ex)
            {
                Owin_UserPrefferencesSettingsResponse objResponse = new Owin_UserPrefferencesSettingsResponse(false, _sharedLocalizer["DATA_FETCH_ERROR"], new Error(
                    "500",
                    ex.Message));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.GetListView(objResponse);
                return true;
            }
        }

        public async Task<bool> GetSingle(Owin_UserPrefferencesSettingsRequest message, ICRUDRequestHandler<Owin_UserPrefferencesSettingsResponse> outputPort)
        {
            CancellationToken cancellationToken = new CancellationToken();
            try
            {
                owin_userprefferencessettingsEntity objSingle = await BFC.Core.FacadeCreatorObjects.Security.owin_userprefferencessettingsFCC.GetFacadeCreate(_contextAccessor)
                .GetSingle(message.Objowin_userprefferencessettings, cancellationToken);
                if (objSingle != null)
                {
                    outputPort.GetSingle(new Owin_UserPrefferencesSettingsResponse(objSingle, true));
                }
                else
                {
                    Owin_UserPrefferencesSettingsResponse objResponse = new Owin_UserPrefferencesSettingsResponse(false, _sharedLocalizer["NO_DATA_FOUND"], new Error(
                     "404",
                     _sharedLocalizer["NO_DATA_FOUND"]));
                    _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                    outputPort.GetSingle(objResponse);
                }
                return true;
            }
            catch (Exception ex)
            {
                Owin_UserPrefferencesSettingsResponse objResponse = new Owin_UserPrefferencesSettingsResponse(false, _sharedLocalizer["DATA_FETCH_ERROR"], new Error(
                    "500",
                    ex.Message));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.GetSingle(objResponse);
                return true;
            }
        }

        public async Task<bool> Save(Owin_UserPrefferencesSettingsRequest message, ICRUDRequestHandler<Owin_UserPrefferencesSettingsResponse> outputPort)
        {
            _logger.LogInformation(JsonConvert.SerializeObject(message));
            CancellationToken cancellationToken = new CancellationToken();
            long? i = null;
            try
            {
                i = await BFC.Core.FacadeCreatorObjects.Security.owin_userprefferencessettingsFCC.GetFacadeCreate(_contextAccessor)
                    .Add(message.Objowin_userprefferencessettings, cancellationToken);
                outputPort.Save(new Owin_UserPrefferencesSettingsResponse(true, _sharedLocalizer["DATA_SAVE_CONFIRMATION"], null));
                return true;
            }
            catch (Exception ex)
            {
                Owin_UserPrefferencesSettingsResponse objResponse = new Owin_UserPrefferencesSettingsResponse(false, _sharedLocalizer["DATA_SAVE_ERROR"], new Error(
                    "500",
                    ex.Message));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.Save(objResponse);
                return true;
            }
        }

        public async Task<bool> Update(Owin_UserPrefferencesSettingsRequest message, ICRUDRequestHandler<Owin_UserPrefferencesSettingsResponse> outputPort)
        {
            CancellationToken cancellationToken = new CancellationToken();
            long? i = null;
            try
            {
                i = await BFC.Core.FacadeCreatorObjects.Security.owin_userprefferencessettingsFCC.GetFacadeCreate(_contextAccessor)
                    .Update(message.Objowin_userprefferencessettings, cancellationToken);
                outputPort.Update(new Owin_UserPrefferencesSettingsResponse(true, _sharedLocalizer["DATA_UPDATE_CONFIRMATION"], null));
                return true;
            }
            catch (Exception ex)
            {
                Owin_UserPrefferencesSettingsResponse objResponse = new Owin_UserPrefferencesSettingsResponse(false, _sharedLocalizer["DATA_UPDATE_ERROR"], new Error(
                       "500",
                       ex.Message));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.Update(objResponse);
                return true;
            }
        }

        public async Task<bool> Delete(Owin_UserPrefferencesSettingsRequest message, ICRUDRequestHandler<Owin_UserPrefferencesSettingsResponse> outputPort)
        {
            CancellationToken cancellationToken = new CancellationToken();
            long? i = null;
            try
            {
                i = await BFC.Core.FacadeCreatorObjects.Security.owin_userprefferencessettingsFCC.GetFacadeCreate(_contextAccessor)
                    .Delete(message.Objowin_userprefferencessettings, cancellationToken);
                outputPort.Delete(new Owin_UserPrefferencesSettingsResponse(true, _sharedLocalizer["DATA_DELETE_CONFIRMATION"], null));
                return true;
            }
            catch (Exception ex)
            {
                Owin_UserPrefferencesSettingsResponse objResponse = new Owin_UserPrefferencesSettingsResponse(false, _sharedLocalizer["DATA_DELETE_ERROR"], new Error(
                         "500",
                         ex.Message));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.Delete(objResponse);
                return true;
            }
        }
    }
}
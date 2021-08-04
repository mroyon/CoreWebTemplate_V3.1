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

namespace Web.Core.Frame.UseCases
{
    public sealed class Gen_ImageGallaryCategoryUseCase : IGen_ImageGallaryCategoryUseCase
    {
        private readonly IHttpContextAccessor _contextAccessor;
        private readonly IJwtFactory _jwtFactory;
        private readonly IStringLocalizer _sharedLocalizer;
        private readonly ILogger<Gen_ImageGallaryCategoryUseCase> _logger;
        private readonly IHttpClientHR _ihttpclienthr;

        public Error _errors { get; set; }

        public Gen_ImageGallaryCategoryUseCase(
            IHttpContextAccessor contextAccessor,
            IJwtFactory jwtFactory,
            IStringLocalizerFactory factory,
            ILoggerFactory loggerFactory
            , IHttpClientHR ihttpclienthr)
        {
            _contextAccessor = contextAccessor;
            _jwtFactory = jwtFactory;
            _logger = loggerFactory.CreateLogger<Gen_ImageGallaryCategoryUseCase>();

            var type = typeof(SharedResource);
            var assemblyName = new AssemblyName(type.GetTypeInfo().Assembly.FullName);
            _sharedLocalizer = factory.Create("SharedResource", assemblyName.Name);
            _ihttpclienthr = ihttpclienthr;
        }

        public Task<bool> Handle(Gen_ImageGallaryCategoryRequest message, IOutputPort<Gen_ImageGallaryCategoryResponse> outputPort)
        {
            throw new Exception("Not Implemented");
        }

        public async Task<bool> GetAll(Gen_ImageGallaryCategoryRequest message, ICRUDRequestHandler<Gen_ImageGallaryCategoryResponse> outputPort)
        {
            CancellationToken cancellationToken = new CancellationToken();
            try
            {
                IList<gen_imagegallarycategoryEntity> oblist = await BFC.Core.FacadeCreatorObjects.General.gen_imagegallarycategoryFCC.GetFacadeCreate(_contextAccessor)
                .GetAll(new BDO.DataAccessObjects.Models.gen_imagegallarycategoryEntity(), cancellationToken);

                if (oblist != null && oblist.Count > 0)
                {
                    outputPort.GetAll(new Gen_ImageGallaryCategoryResponse(oblist.ToList(), true));
                }
                else
                {
                    Gen_ImageGallaryCategoryResponse objResponse = new Gen_ImageGallaryCategoryResponse(false, _sharedLocalizer["NO_DATA_FOUND"], new Error(
                     "404",
                     _sharedLocalizer["NO_DATA_FOUND"]));
                    _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                    outputPort.GetAll(objResponse);
                }
                return true;
            }
            catch (Exception ex)
            {
                Gen_ImageGallaryCategoryResponse objResponse = new Gen_ImageGallaryCategoryResponse(false, _sharedLocalizer["DATA_FETCH_ERROR"], new Error(
                    "500",
                    ex.Message));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.GetAll(objResponse);
                return true;
            }
        }

        public async Task<bool> GetAllPaged(Gen_ImageGallaryCategoryRequest message, ICRUDRequestHandler<Gen_ImageGallaryCategoryResponse> outputPort)
        {
            CancellationToken cancellationToken = new CancellationToken();
            try
            {
                IList<gen_imagegallarycategoryEntity> oblist = await BFC.Core.FacadeCreatorObjects.General.gen_imagegallarycategoryFCC.GetFacadeCreate(_contextAccessor)
                .GetAllByPages(message.Objgen_imagegallarycategory, cancellationToken);

                if (oblist != null && oblist.Count > 0)
                {
                    outputPort.GetAllPaged(new Gen_ImageGallaryCategoryResponse(oblist.ToList(), true));
                }
                else
                {
                    Gen_ImageGallaryCategoryResponse objResponse = new Gen_ImageGallaryCategoryResponse(false, _sharedLocalizer["NO_DATA_FOUND"], new Error(
                     "404",
                     _sharedLocalizer["NO_DATA_FOUND"]));
                    _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                    outputPort.GetAllPaged(objResponse);
                }
                return true;
            }
            catch (Exception ex)
            {
                Gen_ImageGallaryCategoryResponse objResponse = new Gen_ImageGallaryCategoryResponse(false, _sharedLocalizer["DATA_FETCH_ERROR"], new Error(
                    "500",
                    ex.Message));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.GetAllPaged(objResponse);
                return true;
            }
        }

        public async Task<bool> GetListView(Gen_ImageGallaryCategoryRequest message, ICRUDRequestHandler<Gen_ImageGallaryCategoryResponse> outputPort)
        {
            CancellationToken cancellationToken = new CancellationToken();
            try
            {

                IList<gen_imagegallarycategoryEntity> oblist = await BFC.Core.FacadeCreatorObjects.General.gen_imagegallarycategoryFCC.GetFacadeCreate(_contextAccessor)
                .GAPgListView(message.Objgen_imagegallarycategory, cancellationToken);
                if (oblist != null && oblist.Count > 0)
                {
                    outputPort.GetListView(new Gen_ImageGallaryCategoryResponse(oblist.ToList(), true));
                }
                else
                {
                    Gen_ImageGallaryCategoryResponse objResponse = new Gen_ImageGallaryCategoryResponse(false, _sharedLocalizer["NO_DATA_FOUND"], new Error(
                     "404",
                     _sharedLocalizer["NO_DATA_FOUND"]));
                    _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                    outputPort.GetListView(objResponse);
                }
                return true;
            }
            catch (Exception ex)
            {
                Gen_ImageGallaryCategoryResponse objResponse = new Gen_ImageGallaryCategoryResponse(false, _sharedLocalizer["DATA_FETCH_ERROR"], new Error(
                    "500",
                    ex.Message));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.GetListView(objResponse);
                return true;
            }
        }

        public async Task<bool> GetSingle(Gen_ImageGallaryCategoryRequest message, ICRUDRequestHandler<Gen_ImageGallaryCategoryResponse> outputPort)
        {
            CancellationToken cancellationToken = new CancellationToken();
            try
            {
                gen_imagegallarycategoryEntity objSingle = await BFC.Core.FacadeCreatorObjects.General.gen_imagegallarycategoryFCC.GetFacadeCreate(_contextAccessor)
                .GetSingle(message.Objgen_imagegallarycategory, cancellationToken);
                if (objSingle != null)
                {
                    outputPort.GetSingle(new Gen_ImageGallaryCategoryResponse(objSingle, true));
                }
                else
                {
                    Gen_ImageGallaryCategoryResponse objResponse = new Gen_ImageGallaryCategoryResponse(false, _sharedLocalizer["NO_DATA_FOUND"], new Error(
                     "404",
                     _sharedLocalizer["NO_DATA_FOUND"]));
                    _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                    outputPort.GetSingle(objResponse);
                }
                return true;
            }
            catch (Exception ex)
            {
                Gen_ImageGallaryCategoryResponse objResponse = new Gen_ImageGallaryCategoryResponse(false, _sharedLocalizer["DATA_FETCH_ERROR"], new Error(
                    "500",
                    ex.Message));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.GetSingle(objResponse);
                return true;
            }
        }

        public async Task<bool> Save(Gen_ImageGallaryCategoryRequest message, ICRUDRequestHandler<Gen_ImageGallaryCategoryResponse> outputPort)
        {
            _logger.LogInformation(JsonConvert.SerializeObject(message));
            CancellationToken cancellationToken = new CancellationToken();
            long? i = null;
            try
            {
                i = await BFC.Core.FacadeCreatorObjects.General.gen_imagegallarycategoryFCC.GetFacadeCreate(_contextAccessor)
                    .Add(message.Objgen_imagegallarycategory, cancellationToken);
                outputPort.Save(new Gen_ImageGallaryCategoryResponse(true, _sharedLocalizer["DATA_SAVE_CONFIRMATION"], null));
                return true;
            }
            catch (Exception ex)
            {
                Gen_ImageGallaryCategoryResponse objResponse = new Gen_ImageGallaryCategoryResponse(false, _sharedLocalizer["DATA_SAVE_ERROR"], new Error(
                    "500",
                    ex.Message));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.Save(objResponse);
                return true;
            }
        }

        public async Task<bool> Update(Gen_ImageGallaryCategoryRequest message, ICRUDRequestHandler<Gen_ImageGallaryCategoryResponse> outputPort)
        {
            CancellationToken cancellationToken = new CancellationToken();
            long? i = null;
            try
            {
                i = await BFC.Core.FacadeCreatorObjects.General.gen_imagegallarycategoryFCC.GetFacadeCreate(_contextAccessor)
                    .Update(message.Objgen_imagegallarycategory, cancellationToken);
                outputPort.Update(new Gen_ImageGallaryCategoryResponse(true, _sharedLocalizer["DATA_UPDATE_CONFIRMATION"], null));
                return true;
            }
            catch (Exception ex)
            {
                Gen_ImageGallaryCategoryResponse objResponse = new Gen_ImageGallaryCategoryResponse(false, _sharedLocalizer["DATA_UPDATE_ERROR"], new Error(
                       "500",
                       ex.Message));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.Update(objResponse);
                return true;
            }
        }

        public async Task<bool> Delete(Gen_ImageGallaryCategoryRequest message, ICRUDRequestHandler<Gen_ImageGallaryCategoryResponse> outputPort)
        {
            CancellationToken cancellationToken = new CancellationToken();
            long? i = null;
            try
            {
                i = await BFC.Core.FacadeCreatorObjects.General.gen_imagegallarycategoryFCC.GetFacadeCreate(_contextAccessor)
                    .Delete(message.Objgen_imagegallarycategory, cancellationToken);
                outputPort.Delete(new Gen_ImageGallaryCategoryResponse(true, _sharedLocalizer["DATA_DELETE_CONFIRMATION"], null));
                return true;
            }
            catch (Exception ex)
            {
                Gen_ImageGallaryCategoryResponse objResponse = new Gen_ImageGallaryCategoryResponse(false, _sharedLocalizer["DATA_DELETE_ERROR"], new Error(
                         "500",
                         ex.Message));
                _logger.LogInformation(JsonConvert.SerializeObject(objResponse));
                outputPort.Delete(objResponse);
                return true;
            }
        }
    }
}
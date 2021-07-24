using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Web.Core.Frame.RequestResponse.UseCaseRequests;
using Web.Core.Frame.Interfaces.UseCases;
using WebApi.Presenters;
using Microsoft.AspNetCore.Authorization;
using WebApi.Extensions;
using BDO.DataAccessObjects.ExtendedEntities;

namespace WebApi.Controllers
{
    /// <summary>
    /// GenServicesController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class GenServicesController : ControllerBase
    {
        private readonly IGen_ServicesUseCase _gen_ServicesUseCase;
        private readonly Gen_ServicesPresenter _gen_ServicesPresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// GenServicesController
        /// </summary>
        /// <param name="gen_ServicesUseCase"></param>
        /// <param name="gen_ServicesPresenter"></param>
        /// <param name="authSettings"></param>
        public GenServicesController(
            IGen_ServicesUseCase gen_ServicesUseCase,
            Gen_ServicesPresenter gen_ServicesPresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _gen_ServicesUseCase = gen_ServicesUseCase;
            _gen_ServicesPresenter = gen_ServicesPresenter;
        }


        /// <summary>
        /// GetAllGenServices
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllGenServices")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllGenServices()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_ServicesUseCase.GetAll(new Gen_ServicesRequest(new BDO.DataAccessObjects.Models.gen_servicesEntity()), _gen_ServicesPresenter);
            return _gen_ServicesPresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedGenServices
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedGenServices")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedGenServices([FromBody] BDO.DataAccessObjects.Models.gen_servicesEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_ServicesUseCase.GetAllPaged(new Gen_ServicesRequest(request), _gen_ServicesPresenter);
            return _gen_ServicesPresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewGenServices
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewGenServices")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewGenServices([FromBody] BDO.DataAccessObjects.Models.gen_servicesEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_ServicesUseCase.GetListView(new Gen_ServicesRequest(request), _gen_ServicesPresenter);
            return _gen_ServicesPresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleGenServices
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleGenServices")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleGenServices([FromBody] BDO.DataAccessObjects.Models.gen_servicesEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_ServicesUseCase.GetSingle(new Gen_ServicesRequest(request), _gen_ServicesPresenter);
            return _gen_ServicesPresenter.ContentResult;
        }

        /// <summary>
        /// SaveGenServices
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveGenServices")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveGenServices([FromBody] BDO.DataAccessObjects.Models.gen_servicesEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_ServicesUseCase.Save(new Gen_ServicesRequest(request), _gen_ServicesPresenter);
            return _gen_ServicesPresenter.ContentResult;
        }

        /// <summary>
        /// UpdateGenServices
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateGenServices")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateGenServices([FromBody] BDO.DataAccessObjects.Models.gen_servicesEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_ServicesUseCase.Update(new Gen_ServicesRequest(request), _gen_ServicesPresenter);
            return _gen_ServicesPresenter.ContentResult;
        }

        /// <summary>
        /// DeleteGenServices
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteGenServices")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteGenServices([FromBody] BDO.DataAccessObjects.Models.gen_servicesEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_ServicesUseCase.Delete(new Gen_ServicesRequest(request), _gen_ServicesPresenter);
            return _gen_ServicesPresenter.ContentResult;
        }
    }
}

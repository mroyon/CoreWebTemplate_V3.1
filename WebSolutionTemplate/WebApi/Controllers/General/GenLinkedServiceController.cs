using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Web.Core.Frame.RequestResponse.UseCaseRequests;
using Web.Core.Frame.Interfaces.UseCases;
using WebApi.Presenters;
using BDO.DataAccessObjects.ExtendedEntities;
using Microsoft.AspNetCore.Authorization;
using WebApi.Extensions;

namespace WebApi.Controllers
{
    /// <summary>
    /// GenLinkedServiceController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class GenLinkedServiceController : ControllerBase
    {
        private readonly IGen_LinkedServiceUseCase _gen_LinkedServiceUseCase;
        private readonly Gen_LinkedServicePresenter _gen_LinkedServicePresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// GenLinkedServiceController
        /// </summary>
        /// <param name="gen_LinkedServiceUseCase"></param>
        /// <param name="gen_LinkedServicePresenter"></param>
        /// <param name="authSettings"></param>
        public GenLinkedServiceController(
            IGen_LinkedServiceUseCase gen_LinkedServiceUseCase,
            Gen_LinkedServicePresenter gen_LinkedServicePresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _gen_LinkedServiceUseCase = gen_LinkedServiceUseCase;
            _gen_LinkedServicePresenter = gen_LinkedServicePresenter;
        }


        /// <summary>
        /// GetAllGenLinkedService
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllGenLinkedService")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllGenLinkedService()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_LinkedServiceUseCase.GetAll(new Gen_LinkedServiceRequest(new BDO.DataAccessObjects.Models.gen_linkedserviceEntity()), _gen_LinkedServicePresenter);
            return _gen_LinkedServicePresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedGenLinkedService
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedGenLinkedService")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedGenLinkedService([FromBody] BDO.DataAccessObjects.Models.gen_linkedserviceEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_LinkedServiceUseCase.GetAllPaged(new Gen_LinkedServiceRequest(request), _gen_LinkedServicePresenter);
            return _gen_LinkedServicePresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewGenLinkedService
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewGenLinkedService")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewGenLinkedService([FromBody] BDO.DataAccessObjects.Models.gen_linkedserviceEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_LinkedServiceUseCase.GetListView(new Gen_LinkedServiceRequest(request), _gen_LinkedServicePresenter);
            return _gen_LinkedServicePresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleGenLinkedService
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleGenLinkedService")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleGenLinkedService([FromBody] BDO.DataAccessObjects.Models.gen_linkedserviceEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_LinkedServiceUseCase.GetSingle(new Gen_LinkedServiceRequest(request), _gen_LinkedServicePresenter);
            return _gen_LinkedServicePresenter.ContentResult;
        }

        /// <summary>
        /// SaveGenLinkedService
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveGenLinkedService")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveGenLinkedService([FromBody] BDO.DataAccessObjects.Models.gen_linkedserviceEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_LinkedServiceUseCase.Save(new Gen_LinkedServiceRequest(request), _gen_LinkedServicePresenter);
            return _gen_LinkedServicePresenter.ContentResult;
        }

        /// <summary>
        /// UpdateGenLinkedService
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateGenLinkedService")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateGenLinkedService([FromBody] BDO.DataAccessObjects.Models.gen_linkedserviceEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_LinkedServiceUseCase.Update(new Gen_LinkedServiceRequest(request), _gen_LinkedServicePresenter);
            return _gen_LinkedServicePresenter.ContentResult;
        }

        /// <summary>
        /// DeleteGenLinkedService
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteGenLinkedService")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteGenLinkedService([FromBody] BDO.DataAccessObjects.Models.gen_linkedserviceEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_LinkedServiceUseCase.Delete(new Gen_LinkedServiceRequest(request), _gen_LinkedServicePresenter);
            return _gen_LinkedServicePresenter.ContentResult;
        }
    }
}

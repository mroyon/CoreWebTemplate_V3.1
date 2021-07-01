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
    /// GenDocTypeController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class GenDocTypeController : ControllerBase
    {
        private readonly IGen_DocTypeUseCase _gen_DocTypeUseCase;
        private readonly Gen_DocTypePresenter _gen_DocTypePresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// GenDocTypeController
        /// </summary>
        /// <param name="gen_DocTypeUseCase"></param>
        /// <param name="gen_DocTypePresenter"></param>
        /// <param name="authSettings"></param>
        public GenDocTypeController(
            IGen_DocTypeUseCase gen_DocTypeUseCase,
            Gen_DocTypePresenter gen_DocTypePresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _gen_DocTypeUseCase = gen_DocTypeUseCase;
            _gen_DocTypePresenter = gen_DocTypePresenter;
        }


        /// <summary>
        /// GetAllGenDocType
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllGenDocType")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllGenDocType()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_DocTypeUseCase.GetAll(new Gen_DocTypeRequest(new BDO.DataAccessObjects.Models.gen_doctypeEntity()), _gen_DocTypePresenter);
            return _gen_DocTypePresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedGenDocType
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedGenDocType")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedGenDocType([FromBody] BDO.DataAccessObjects.Models.gen_doctypeEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_DocTypeUseCase.GetAllPaged(new Gen_DocTypeRequest(request), _gen_DocTypePresenter);
            return _gen_DocTypePresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewGenDocType
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewGenDocType")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewGenDocType([FromBody] BDO.DataAccessObjects.Models.gen_doctypeEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_DocTypeUseCase.GetListView(new Gen_DocTypeRequest(request), _gen_DocTypePresenter);
            return _gen_DocTypePresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleGenDocType
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleGenDocType")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleGenDocType([FromBody] BDO.DataAccessObjects.Models.gen_doctypeEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_DocTypeUseCase.GetSingle(new Gen_DocTypeRequest(request), _gen_DocTypePresenter);
            return _gen_DocTypePresenter.ContentResult;
        }

        /// <summary>
        /// SaveGenDocType
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveGenDocType")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveGenDocType([FromBody] BDO.DataAccessObjects.Models.gen_doctypeEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_DocTypeUseCase.Save(new Gen_DocTypeRequest(request), _gen_DocTypePresenter);
            return _gen_DocTypePresenter.ContentResult;
        }

        /// <summary>
        /// UpdateGenDocType
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateGenDocType")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateGenDocType([FromBody] BDO.DataAccessObjects.Models.gen_doctypeEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_DocTypeUseCase.Update(new Gen_DocTypeRequest(request), _gen_DocTypePresenter);
            return _gen_DocTypePresenter.ContentResult;
        }

        /// <summary>
        /// DeleteGenDocType
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteGenDocType")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteGenDocType([FromBody] BDO.DataAccessObjects.Models.gen_doctypeEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_DocTypeUseCase.Delete(new Gen_DocTypeRequest(request), _gen_DocTypePresenter);
            return _gen_DocTypePresenter.ContentResult;
        }
    }
}

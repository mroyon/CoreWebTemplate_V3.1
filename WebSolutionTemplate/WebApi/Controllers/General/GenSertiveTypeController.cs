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
    /// GenSertiveTypeController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class GenSertiveTypeController : ControllerBase
    {
        private readonly IGen_SertiveTypeUseCase _gen_SertiveTypeUseCase;
        private readonly Gen_SertiveTypePresenter _gen_SertiveTypePresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// GenSertiveTypeController
        /// </summary>
        /// <param name="gen_SertiveTypeUseCase"></param>
        /// <param name="gen_SertiveTypePresenter"></param>
        /// <param name="authSettings"></param>
        public GenSertiveTypeController(
            IGen_SertiveTypeUseCase gen_SertiveTypeUseCase,
            Gen_SertiveTypePresenter gen_SertiveTypePresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _gen_SertiveTypeUseCase = gen_SertiveTypeUseCase;
            _gen_SertiveTypePresenter = gen_SertiveTypePresenter;
        }


        /// <summary>
        /// GetAllGenSertiveType
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllGenSertiveType")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllGenSertiveType()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_SertiveTypeUseCase.GetAll(new Gen_SertiveTypeRequest(new BDO.DataAccessObjects.Models.gen_sertivetypeEntity()), _gen_SertiveTypePresenter);
            return _gen_SertiveTypePresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedGenSertiveType
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedGenSertiveType")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedGenSertiveType([FromBody] BDO.DataAccessObjects.Models.gen_sertivetypeEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_SertiveTypeUseCase.GetAllPaged(new Gen_SertiveTypeRequest(request), _gen_SertiveTypePresenter);
            return _gen_SertiveTypePresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewGenSertiveType
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewGenSertiveType")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewGenSertiveType([FromBody] BDO.DataAccessObjects.Models.gen_sertivetypeEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_SertiveTypeUseCase.GetListView(new Gen_SertiveTypeRequest(request), _gen_SertiveTypePresenter);
            return _gen_SertiveTypePresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleGenSertiveType
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleGenSertiveType")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleGenSertiveType([FromBody] BDO.DataAccessObjects.Models.gen_sertivetypeEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_SertiveTypeUseCase.GetSingle(new Gen_SertiveTypeRequest(request), _gen_SertiveTypePresenter);
            return _gen_SertiveTypePresenter.ContentResult;
        }

        /// <summary>
        /// SaveGenSertiveType
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveGenSertiveType")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveGenSertiveType([FromBody] BDO.DataAccessObjects.Models.gen_sertivetypeEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_SertiveTypeUseCase.Save(new Gen_SertiveTypeRequest(request), _gen_SertiveTypePresenter);
            return _gen_SertiveTypePresenter.ContentResult;
        }

        /// <summary>
        /// UpdateGenSertiveType
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateGenSertiveType")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateGenSertiveType([FromBody] BDO.DataAccessObjects.Models.gen_sertivetypeEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_SertiveTypeUseCase.Update(new Gen_SertiveTypeRequest(request), _gen_SertiveTypePresenter);
            return _gen_SertiveTypePresenter.ContentResult;
        }

        /// <summary>
        /// DeleteGenSertiveType
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteGenSertiveType")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteGenSertiveType([FromBody] BDO.DataAccessObjects.Models.gen_sertivetypeEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_SertiveTypeUseCase.Delete(new Gen_SertiveTypeRequest(request), _gen_SertiveTypePresenter);
            return _gen_SertiveTypePresenter.ContentResult;
        }
    }
}

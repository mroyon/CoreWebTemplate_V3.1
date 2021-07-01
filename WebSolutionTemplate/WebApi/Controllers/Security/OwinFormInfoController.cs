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
    /// OwinFormInfoController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class OwinFormInfoController : ControllerBase
    {
        private readonly IOwin_FormInfoUseCase _owin_FormInfoUseCase;
        private readonly Owin_FormInfoPresenter _owin_FormInfoPresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// OwinFormInfoController
        /// </summary>
        /// <param name="owin_FormInfoUseCase"></param>
        /// <param name="owin_FormInfoPresenter"></param>
        /// <param name="authSettings"></param>
        public OwinFormInfoController(
            IOwin_FormInfoUseCase owin_FormInfoUseCase,
            Owin_FormInfoPresenter owin_FormInfoPresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _owin_FormInfoUseCase = owin_FormInfoUseCase;
            _owin_FormInfoPresenter = owin_FormInfoPresenter;
        }


        /// <summary>
        /// GetAllOwinFormInfo
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllOwinFormInfo")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllOwinFormInfo()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_FormInfoUseCase.GetAll(new Owin_FormInfoRequest(new BDO.DataAccessObjects.SecurityModule.owin_forminfoEntity()), _owin_FormInfoPresenter);
            return _owin_FormInfoPresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedOwinFormInfo
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedOwinFormInfo")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedOwinFormInfo([FromBody] BDO.DataAccessObjects.SecurityModule.owin_forminfoEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_FormInfoUseCase.GetAllPaged(new Owin_FormInfoRequest(request), _owin_FormInfoPresenter);
            return _owin_FormInfoPresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewOwinFormInfo
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewOwinFormInfo")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewOwinFormInfo([FromBody] BDO.DataAccessObjects.SecurityModule.owin_forminfoEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_FormInfoUseCase.GetListView(new Owin_FormInfoRequest(request), _owin_FormInfoPresenter);
            return _owin_FormInfoPresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleOwinFormInfo
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleOwinFormInfo")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleOwinFormInfo([FromBody] BDO.DataAccessObjects.SecurityModule.owin_forminfoEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_FormInfoUseCase.GetSingle(new Owin_FormInfoRequest(request), _owin_FormInfoPresenter);
            return _owin_FormInfoPresenter.ContentResult;
        }

        /// <summary>
        /// SaveOwinFormInfo
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveOwinFormInfo")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveOwinFormInfo([FromBody] BDO.DataAccessObjects.SecurityModule.owin_forminfoEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_FormInfoUseCase.Save(new Owin_FormInfoRequest(request), _owin_FormInfoPresenter);
            return _owin_FormInfoPresenter.ContentResult;
        }

        /// <summary>
        /// UpdateOwinFormInfo
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateOwinFormInfo")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateOwinFormInfo([FromBody] BDO.DataAccessObjects.SecurityModule.owin_forminfoEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_FormInfoUseCase.Update(new Owin_FormInfoRequest(request), _owin_FormInfoPresenter);
            return _owin_FormInfoPresenter.ContentResult;
        }

        /// <summary>
        /// DeleteOwinFormInfo
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteOwinFormInfo")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteOwinFormInfo([FromBody] BDO.DataAccessObjects.SecurityModule.owin_forminfoEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_FormInfoUseCase.Delete(new Owin_FormInfoRequest(request), _owin_FormInfoPresenter);
            return _owin_FormInfoPresenter.ContentResult;
        }
    }
}

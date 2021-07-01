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
    /// OwinFormActionController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class OwinFormActionController : ControllerBase
    {
        private readonly IOwin_FormActionUseCase _owin_FormActionUseCase;
        private readonly Owin_FormActionPresenter _owin_FormActionPresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// OwinFormActionController
        /// </summary>
        /// <param name="owin_FormActionUseCase"></param>
        /// <param name="owin_FormActionPresenter"></param>
        /// <param name="authSettings"></param>
        public OwinFormActionController(
            IOwin_FormActionUseCase owin_FormActionUseCase,
            Owin_FormActionPresenter owin_FormActionPresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _owin_FormActionUseCase = owin_FormActionUseCase;
            _owin_FormActionPresenter = owin_FormActionPresenter;
        }


        /// <summary>
        /// GetAllOwinFormAction
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllOwinFormAction")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllOwinFormAction()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_FormActionUseCase.GetAll(new Owin_FormActionRequest(new BDO.DataAccessObjects.SecurityModule.owin_formactionEntity()), _owin_FormActionPresenter);
            return _owin_FormActionPresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedOwinFormAction
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedOwinFormAction")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedOwinFormAction([FromBody] BDO.DataAccessObjects.SecurityModule.owin_formactionEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_FormActionUseCase.GetAllPaged(new Owin_FormActionRequest(request), _owin_FormActionPresenter);
            return _owin_FormActionPresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewOwinFormAction
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewOwinFormAction")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewOwinFormAction([FromBody] BDO.DataAccessObjects.SecurityModule.owin_formactionEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_FormActionUseCase.GetListView(new Owin_FormActionRequest(request), _owin_FormActionPresenter);
            return _owin_FormActionPresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleOwinFormAction
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleOwinFormAction")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleOwinFormAction([FromBody] BDO.DataAccessObjects.SecurityModule.owin_formactionEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_FormActionUseCase.GetSingle(new Owin_FormActionRequest(request), _owin_FormActionPresenter);
            return _owin_FormActionPresenter.ContentResult;
        }

        /// <summary>
        /// SaveOwinFormAction
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveOwinFormAction")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveOwinFormAction([FromBody] BDO.DataAccessObjects.SecurityModule.owin_formactionEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_FormActionUseCase.Save(new Owin_FormActionRequest(request), _owin_FormActionPresenter);
            return _owin_FormActionPresenter.ContentResult;
        }

        /// <summary>
        /// UpdateOwinFormAction
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateOwinFormAction")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateOwinFormAction([FromBody] BDO.DataAccessObjects.SecurityModule.owin_formactionEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_FormActionUseCase.Update(new Owin_FormActionRequest(request), _owin_FormActionPresenter);
            return _owin_FormActionPresenter.ContentResult;
        }

        /// <summary>
        /// DeleteOwinFormAction
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteOwinFormAction")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteOwinFormAction([FromBody] BDO.DataAccessObjects.SecurityModule.owin_formactionEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_FormActionUseCase.Delete(new Owin_FormActionRequest(request), _owin_FormActionPresenter);
            return _owin_FormActionPresenter.ContentResult;
        }
    }
}

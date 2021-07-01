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
    /// OwinUserStatusChangeHistoryController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class OwinUserStatusChangeHistoryController : ControllerBase
    {
        private readonly IOwin_UserStatusChangeHistoryUseCase _owin_UserStatusChangeHistoryUseCase;
        private readonly Owin_UserStatusChangeHistoryPresenter _owin_UserStatusChangeHistoryPresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// OwinUserStatusChangeHistoryController
        /// </summary>
        /// <param name="owin_UserStatusChangeHistoryUseCase"></param>
        /// <param name="owin_UserStatusChangeHistoryPresenter"></param>
        /// <param name="authSettings"></param>
        public OwinUserStatusChangeHistoryController(
            IOwin_UserStatusChangeHistoryUseCase owin_UserStatusChangeHistoryUseCase,
            Owin_UserStatusChangeHistoryPresenter owin_UserStatusChangeHistoryPresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _owin_UserStatusChangeHistoryUseCase = owin_UserStatusChangeHistoryUseCase;
            _owin_UserStatusChangeHistoryPresenter = owin_UserStatusChangeHistoryPresenter;
        }


        /// <summary>
        /// GetAllOwinUserStatusChangeHistory
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllOwinUserStatusChangeHistory")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllOwinUserStatusChangeHistory()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserStatusChangeHistoryUseCase.GetAll(new Owin_UserStatusChangeHistoryRequest(new BDO.DataAccessObjects.SecurityModule.owin_userstatuschangehistoryEntity()), _owin_UserStatusChangeHistoryPresenter);
            return _owin_UserStatusChangeHistoryPresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedOwinUserStatusChangeHistory
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedOwinUserStatusChangeHistory")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedOwinUserStatusChangeHistory([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userstatuschangehistoryEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserStatusChangeHistoryUseCase.GetAllPaged(new Owin_UserStatusChangeHistoryRequest(request), _owin_UserStatusChangeHistoryPresenter);
            return _owin_UserStatusChangeHistoryPresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewOwinUserStatusChangeHistory
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewOwinUserStatusChangeHistory")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewOwinUserStatusChangeHistory([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userstatuschangehistoryEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserStatusChangeHistoryUseCase.GetListView(new Owin_UserStatusChangeHistoryRequest(request), _owin_UserStatusChangeHistoryPresenter);
            return _owin_UserStatusChangeHistoryPresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleOwinUserStatusChangeHistory
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleOwinUserStatusChangeHistory")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleOwinUserStatusChangeHistory([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userstatuschangehistoryEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserStatusChangeHistoryUseCase.GetSingle(new Owin_UserStatusChangeHistoryRequest(request), _owin_UserStatusChangeHistoryPresenter);
            return _owin_UserStatusChangeHistoryPresenter.ContentResult;
        }

        /// <summary>
        /// SaveOwinUserStatusChangeHistory
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveOwinUserStatusChangeHistory")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveOwinUserStatusChangeHistory([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userstatuschangehistoryEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserStatusChangeHistoryUseCase.Save(new Owin_UserStatusChangeHistoryRequest(request), _owin_UserStatusChangeHistoryPresenter);
            return _owin_UserStatusChangeHistoryPresenter.ContentResult;
        }

        /// <summary>
        /// UpdateOwinUserStatusChangeHistory
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateOwinUserStatusChangeHistory")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateOwinUserStatusChangeHistory([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userstatuschangehistoryEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserStatusChangeHistoryUseCase.Update(new Owin_UserStatusChangeHistoryRequest(request), _owin_UserStatusChangeHistoryPresenter);
            return _owin_UserStatusChangeHistoryPresenter.ContentResult;
        }

        /// <summary>
        /// DeleteOwinUserStatusChangeHistory
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteOwinUserStatusChangeHistory")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteOwinUserStatusChangeHistory([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userstatuschangehistoryEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserStatusChangeHistoryUseCase.Delete(new Owin_UserStatusChangeHistoryRequest(request), _owin_UserStatusChangeHistoryPresenter);
            return _owin_UserStatusChangeHistoryPresenter.ContentResult;
        }
    }
}

using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Web.Core.Frame.RequestResponse.UseCaseRequests;
using Web.Core.Frame.Interfaces.UseCases;
using Web.Core.Frame.Presenters;
using BDO.DataAccessObjects.ExtendedEntities;
using Microsoft.AspNetCore.Authorization;
using WebApi.Extensions;

namespace WebApi.Controllers
{
    /// <summary>
    /// OwinUserPrefferencesSettingsController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class OwinUserPrefferencesSettingsController : ControllerBase
    {
        private readonly IOwin_UserPrefferencesSettingsUseCase _owin_UserPrefferencesSettingsUseCase;
        private readonly Owin_UserPrefferencesSettingsPresenter _owin_UserPrefferencesSettingsPresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// OwinUserPrefferencesSettingsController
        /// </summary>
        /// <param name="owin_UserPrefferencesSettingsUseCase"></param>
        /// <param name="owin_UserPrefferencesSettingsPresenter"></param>
        /// <param name="authSettings"></param>
        public OwinUserPrefferencesSettingsController(
            IOwin_UserPrefferencesSettingsUseCase owin_UserPrefferencesSettingsUseCase,
            Owin_UserPrefferencesSettingsPresenter owin_UserPrefferencesSettingsPresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _owin_UserPrefferencesSettingsUseCase = owin_UserPrefferencesSettingsUseCase;
            _owin_UserPrefferencesSettingsPresenter = owin_UserPrefferencesSettingsPresenter;
        }


        /// <summary>
        /// GetAllOwinUserPrefferencesSettings
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllOwinUserPrefferencesSettings")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllOwinUserPrefferencesSettings()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserPrefferencesSettingsUseCase.GetAll(new Owin_UserPrefferencesSettingsRequest(new BDO.DataAccessObjects.SecurityModule.owin_userprefferencessettingsEntity()), _owin_UserPrefferencesSettingsPresenter);
            return _owin_UserPrefferencesSettingsPresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedOwinUserPrefferencesSettings
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedOwinUserPrefferencesSettings")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedOwinUserPrefferencesSettings([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userprefferencessettingsEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserPrefferencesSettingsUseCase.GetAllPaged(new Owin_UserPrefferencesSettingsRequest(request), _owin_UserPrefferencesSettingsPresenter);
            return _owin_UserPrefferencesSettingsPresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewOwinUserPrefferencesSettings
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewOwinUserPrefferencesSettings")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewOwinUserPrefferencesSettings([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userprefferencessettingsEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserPrefferencesSettingsUseCase.GetListView(new Owin_UserPrefferencesSettingsRequest(request), _owin_UserPrefferencesSettingsPresenter);
            return _owin_UserPrefferencesSettingsPresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleOwinUserPrefferencesSettings
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleOwinUserPrefferencesSettings")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleOwinUserPrefferencesSettings([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userprefferencessettingsEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserPrefferencesSettingsUseCase.GetSingle(new Owin_UserPrefferencesSettingsRequest(request), _owin_UserPrefferencesSettingsPresenter);
            return _owin_UserPrefferencesSettingsPresenter.ContentResult;
        }

        /// <summary>
        /// SaveOwinUserPrefferencesSettings
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveOwinUserPrefferencesSettings")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveOwinUserPrefferencesSettings([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userprefferencessettingsEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserPrefferencesSettingsUseCase.Save(new Owin_UserPrefferencesSettingsRequest(request), _owin_UserPrefferencesSettingsPresenter);
            return _owin_UserPrefferencesSettingsPresenter.ContentResult;
        }

        /// <summary>
        /// UpdateOwinUserPrefferencesSettings
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateOwinUserPrefferencesSettings")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateOwinUserPrefferencesSettings([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userprefferencessettingsEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserPrefferencesSettingsUseCase.Update(new Owin_UserPrefferencesSettingsRequest(request), _owin_UserPrefferencesSettingsPresenter);
            return _owin_UserPrefferencesSettingsPresenter.ContentResult;
        }

        /// <summary>
        /// DeleteOwinUserPrefferencesSettings
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteOwinUserPrefferencesSettings")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteOwinUserPrefferencesSettings([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userprefferencessettingsEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserPrefferencesSettingsUseCase.Delete(new Owin_UserPrefferencesSettingsRequest(request), _owin_UserPrefferencesSettingsPresenter);
            return _owin_UserPrefferencesSettingsPresenter.ContentResult;
        }
    }
}

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
    /// OwinUserPasswordResetInfoController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class OwinUserPasswordResetInfoController : ControllerBase
    {
        private readonly IOwin_UserPasswordResetInfoUseCase _owin_UserPasswordResetInfoUseCase;
        private readonly Owin_UserPasswordResetInfoPresenter _owin_UserPasswordResetInfoPresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// OwinUserPasswordResetInfoController
        /// </summary>
        /// <param name="owin_UserPasswordResetInfoUseCase"></param>
        /// <param name="owin_UserPasswordResetInfoPresenter"></param>
        /// <param name="authSettings"></param>
        public OwinUserPasswordResetInfoController(
            IOwin_UserPasswordResetInfoUseCase owin_UserPasswordResetInfoUseCase,
            Owin_UserPasswordResetInfoPresenter owin_UserPasswordResetInfoPresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _owin_UserPasswordResetInfoUseCase = owin_UserPasswordResetInfoUseCase;
            _owin_UserPasswordResetInfoPresenter = owin_UserPasswordResetInfoPresenter;
        }


        /// <summary>
        /// GetAllOwinUserPasswordResetInfo
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllOwinUserPasswordResetInfo")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllOwinUserPasswordResetInfo()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserPasswordResetInfoUseCase.GetAll(new Owin_UserPasswordResetInfoRequest(new BDO.DataAccessObjects.SecurityModule.owin_userpasswordresetinfoEntity()), _owin_UserPasswordResetInfoPresenter);
            return _owin_UserPasswordResetInfoPresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedOwinUserPasswordResetInfo
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedOwinUserPasswordResetInfo")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedOwinUserPasswordResetInfo([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userpasswordresetinfoEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserPasswordResetInfoUseCase.GetAllPaged(new Owin_UserPasswordResetInfoRequest(request), _owin_UserPasswordResetInfoPresenter);
            return _owin_UserPasswordResetInfoPresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewOwinUserPasswordResetInfo
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewOwinUserPasswordResetInfo")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewOwinUserPasswordResetInfo([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userpasswordresetinfoEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserPasswordResetInfoUseCase.GetListView(new Owin_UserPasswordResetInfoRequest(request), _owin_UserPasswordResetInfoPresenter);
            return _owin_UserPasswordResetInfoPresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleOwinUserPasswordResetInfo
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleOwinUserPasswordResetInfo")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleOwinUserPasswordResetInfo([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userpasswordresetinfoEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserPasswordResetInfoUseCase.GetSingle(new Owin_UserPasswordResetInfoRequest(request), _owin_UserPasswordResetInfoPresenter);
            return _owin_UserPasswordResetInfoPresenter.ContentResult;
        }

        /// <summary>
        /// SaveOwinUserPasswordResetInfo
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveOwinUserPasswordResetInfo")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveOwinUserPasswordResetInfo([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userpasswordresetinfoEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserPasswordResetInfoUseCase.Save(new Owin_UserPasswordResetInfoRequest(request), _owin_UserPasswordResetInfoPresenter);
            return _owin_UserPasswordResetInfoPresenter.ContentResult;
        }

        /// <summary>
        /// UpdateOwinUserPasswordResetInfo
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateOwinUserPasswordResetInfo")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateOwinUserPasswordResetInfo([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userpasswordresetinfoEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserPasswordResetInfoUseCase.Update(new Owin_UserPasswordResetInfoRequest(request), _owin_UserPasswordResetInfoPresenter);
            return _owin_UserPasswordResetInfoPresenter.ContentResult;
        }

        /// <summary>
        /// DeleteOwinUserPasswordResetInfo
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteOwinUserPasswordResetInfo")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteOwinUserPasswordResetInfo([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userpasswordresetinfoEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserPasswordResetInfoUseCase.Delete(new Owin_UserPasswordResetInfoRequest(request), _owin_UserPasswordResetInfoPresenter);
            return _owin_UserPasswordResetInfoPresenter.ContentResult;
        }
    }
}

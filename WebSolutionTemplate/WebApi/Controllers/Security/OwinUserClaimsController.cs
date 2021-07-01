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
    /// OwinUserClaimsController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class OwinUserClaimsController : ControllerBase
    {
        private readonly IOwin_UserClaimsUseCase _owin_UserClaimsUseCase;
        private readonly Owin_UserClaimsPresenter _owin_UserClaimsPresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// OwinUserClaimsController
        /// </summary>
        /// <param name="owin_UserClaimsUseCase"></param>
        /// <param name="owin_UserClaimsPresenter"></param>
        /// <param name="authSettings"></param>
        public OwinUserClaimsController(
            IOwin_UserClaimsUseCase owin_UserClaimsUseCase,
            Owin_UserClaimsPresenter owin_UserClaimsPresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _owin_UserClaimsUseCase = owin_UserClaimsUseCase;
            _owin_UserClaimsPresenter = owin_UserClaimsPresenter;
        }


        /// <summary>
        /// GetAllOwinUserClaims
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllOwinUserClaims")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllOwinUserClaims()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserClaimsUseCase.GetAll(new Owin_UserClaimsRequest(new BDO.DataAccessObjects.SecurityModule.owin_userclaimsEntity()), _owin_UserClaimsPresenter);
            return _owin_UserClaimsPresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedOwinUserClaims
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedOwinUserClaims")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedOwinUserClaims([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userclaimsEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserClaimsUseCase.GetAllPaged(new Owin_UserClaimsRequest(request), _owin_UserClaimsPresenter);
            return _owin_UserClaimsPresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewOwinUserClaims
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewOwinUserClaims")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewOwinUserClaims([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userclaimsEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserClaimsUseCase.GetListView(new Owin_UserClaimsRequest(request), _owin_UserClaimsPresenter);
            return _owin_UserClaimsPresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleOwinUserClaims
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleOwinUserClaims")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleOwinUserClaims([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userclaimsEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserClaimsUseCase.GetSingle(new Owin_UserClaimsRequest(request), _owin_UserClaimsPresenter);
            return _owin_UserClaimsPresenter.ContentResult;
        }

        /// <summary>
        /// SaveOwinUserClaims
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveOwinUserClaims")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveOwinUserClaims([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userclaimsEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserClaimsUseCase.Save(new Owin_UserClaimsRequest(request), _owin_UserClaimsPresenter);
            return _owin_UserClaimsPresenter.ContentResult;
        }

        /// <summary>
        /// UpdateOwinUserClaims
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateOwinUserClaims")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateOwinUserClaims([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userclaimsEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserClaimsUseCase.Update(new Owin_UserClaimsRequest(request), _owin_UserClaimsPresenter);
            return _owin_UserClaimsPresenter.ContentResult;
        }

        /// <summary>
        /// DeleteOwinUserClaims
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteOwinUserClaims")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteOwinUserClaims([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userclaimsEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserClaimsUseCase.Delete(new Owin_UserClaimsRequest(request), _owin_UserClaimsPresenter);
            return _owin_UserClaimsPresenter.ContentResult;
        }
    }
}

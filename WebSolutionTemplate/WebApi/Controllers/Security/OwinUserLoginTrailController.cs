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
    /// OwinUserLoginTrailController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class OwinUserLoginTrailController : ControllerBase
    {
        private readonly IOwin_UserLoginTrailUseCase _owin_UserLoginTrailUseCase;
        private readonly Owin_UserLoginTrailPresenter _owin_UserLoginTrailPresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// OwinUserLoginTrailController
        /// </summary>
        /// <param name="owin_UserLoginTrailUseCase"></param>
        /// <param name="owin_UserLoginTrailPresenter"></param>
        /// <param name="authSettings"></param>
        public OwinUserLoginTrailController(
            IOwin_UserLoginTrailUseCase owin_UserLoginTrailUseCase,
            Owin_UserLoginTrailPresenter owin_UserLoginTrailPresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _owin_UserLoginTrailUseCase = owin_UserLoginTrailUseCase;
            _owin_UserLoginTrailPresenter = owin_UserLoginTrailPresenter;
        }


        /// <summary>
        /// GetAllOwinUserLoginTrail
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllOwinUserLoginTrail")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllOwinUserLoginTrail()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserLoginTrailUseCase.GetAll(new Owin_UserLoginTrailRequest(new BDO.DataAccessObjects.SecurityModule.owin_userlogintrailEntity()), _owin_UserLoginTrailPresenter);
            return _owin_UserLoginTrailPresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedOwinUserLoginTrail
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedOwinUserLoginTrail")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedOwinUserLoginTrail([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userlogintrailEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserLoginTrailUseCase.GetAllPaged(new Owin_UserLoginTrailRequest(request), _owin_UserLoginTrailPresenter);
            return _owin_UserLoginTrailPresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewOwinUserLoginTrail
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewOwinUserLoginTrail")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewOwinUserLoginTrail([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userlogintrailEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserLoginTrailUseCase.GetListView(new Owin_UserLoginTrailRequest(request), _owin_UserLoginTrailPresenter);
            return _owin_UserLoginTrailPresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleOwinUserLoginTrail
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleOwinUserLoginTrail")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleOwinUserLoginTrail([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userlogintrailEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserLoginTrailUseCase.GetSingle(new Owin_UserLoginTrailRequest(request), _owin_UserLoginTrailPresenter);
            return _owin_UserLoginTrailPresenter.ContentResult;
        }

        /// <summary>
        /// SaveOwinUserLoginTrail
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveOwinUserLoginTrail")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveOwinUserLoginTrail([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userlogintrailEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserLoginTrailUseCase.Save(new Owin_UserLoginTrailRequest(request), _owin_UserLoginTrailPresenter);
            return _owin_UserLoginTrailPresenter.ContentResult;
        }

        /// <summary>
        /// UpdateOwinUserLoginTrail
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateOwinUserLoginTrail")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateOwinUserLoginTrail([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userlogintrailEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserLoginTrailUseCase.Update(new Owin_UserLoginTrailRequest(request), _owin_UserLoginTrailPresenter);
            return _owin_UserLoginTrailPresenter.ContentResult;
        }

        /// <summary>
        /// DeleteOwinUserLoginTrail
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteOwinUserLoginTrail")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteOwinUserLoginTrail([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userlogintrailEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserLoginTrailUseCase.Delete(new Owin_UserLoginTrailRequest(request), _owin_UserLoginTrailPresenter);
            return _owin_UserLoginTrailPresenter.ContentResult;
        }
    }
}

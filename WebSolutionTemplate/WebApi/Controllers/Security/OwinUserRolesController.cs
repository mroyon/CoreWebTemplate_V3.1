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
    /// OwinUserRolesController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class OwinUserRolesController : ControllerBase
    {
        private readonly IOwin_UserRolesUseCase _owin_UserRolesUseCase;
        private readonly Owin_UserRolesPresenter _owin_UserRolesPresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// OwinUserRolesController
        /// </summary>
        /// <param name="owin_UserRolesUseCase"></param>
        /// <param name="owin_UserRolesPresenter"></param>
        /// <param name="authSettings"></param>
        public OwinUserRolesController(
            IOwin_UserRolesUseCase owin_UserRolesUseCase,
            Owin_UserRolesPresenter owin_UserRolesPresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _owin_UserRolesUseCase = owin_UserRolesUseCase;
            _owin_UserRolesPresenter = owin_UserRolesPresenter;
        }


        /// <summary>
        /// GetAllOwinUserRoles
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllOwinUserRoles")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllOwinUserRoles()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserRolesUseCase.GetAll(new Owin_UserRolesRequest(new BDO.DataAccessObjects.SecurityModule.owin_userrolesEntity()), _owin_UserRolesPresenter);
            return _owin_UserRolesPresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedOwinUserRoles
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedOwinUserRoles")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedOwinUserRoles([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userrolesEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserRolesUseCase.GetAllPaged(new Owin_UserRolesRequest(request), _owin_UserRolesPresenter);
            return _owin_UserRolesPresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewOwinUserRoles
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewOwinUserRoles")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewOwinUserRoles([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userrolesEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserRolesUseCase.GetListView(new Owin_UserRolesRequest(request), _owin_UserRolesPresenter);
            return _owin_UserRolesPresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleOwinUserRoles
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleOwinUserRoles")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleOwinUserRoles([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userrolesEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserRolesUseCase.GetSingle(new Owin_UserRolesRequest(request), _owin_UserRolesPresenter);
            return _owin_UserRolesPresenter.ContentResult;
        }

        /// <summary>
        /// SaveOwinUserRoles
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveOwinUserRoles")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveOwinUserRoles([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userrolesEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserRolesUseCase.Save(new Owin_UserRolesRequest(request), _owin_UserRolesPresenter);
            return _owin_UserRolesPresenter.ContentResult;
        }

        /// <summary>
        /// UpdateOwinUserRoles
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateOwinUserRoles")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateOwinUserRoles([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userrolesEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserRolesUseCase.Update(new Owin_UserRolesRequest(request), _owin_UserRolesPresenter);
            return _owin_UserRolesPresenter.ContentResult;
        }

        /// <summary>
        /// DeleteOwinUserRoles
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteOwinUserRoles")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteOwinUserRoles([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userrolesEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserRolesUseCase.Delete(new Owin_UserRolesRequest(request), _owin_UserRolesPresenter);
            return _owin_UserRolesPresenter.ContentResult;
        }
    }
}

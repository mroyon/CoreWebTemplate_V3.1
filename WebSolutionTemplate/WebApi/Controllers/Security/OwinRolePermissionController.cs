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
    /// OwinRolePermissionController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class OwinRolePermissionController : ControllerBase
    {
        private readonly IOwin_RolePermissionUseCase _owin_RolePermissionUseCase;
        private readonly Owin_RolePermissionPresenter _owin_RolePermissionPresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// OwinRolePermissionController
        /// </summary>
        /// <param name="owin_RolePermissionUseCase"></param>
        /// <param name="owin_RolePermissionPresenter"></param>
        /// <param name="authSettings"></param>
        public OwinRolePermissionController(
            IOwin_RolePermissionUseCase owin_RolePermissionUseCase,
            Owin_RolePermissionPresenter owin_RolePermissionPresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _owin_RolePermissionUseCase = owin_RolePermissionUseCase;
            _owin_RolePermissionPresenter = owin_RolePermissionPresenter;
        }


        /// <summary>
        /// GetAllOwinRolePermission
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllOwinRolePermission")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllOwinRolePermission()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_RolePermissionUseCase.GetAll(new Owin_RolePermissionRequest(new BDO.DataAccessObjects.SecurityModule.owin_rolepermissionEntity()), _owin_RolePermissionPresenter);
            return _owin_RolePermissionPresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedOwinRolePermission
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedOwinRolePermission")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedOwinRolePermission([FromBody] BDO.DataAccessObjects.SecurityModule.owin_rolepermissionEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_RolePermissionUseCase.GetAllPaged(new Owin_RolePermissionRequest(request), _owin_RolePermissionPresenter);
            return _owin_RolePermissionPresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewOwinRolePermission
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewOwinRolePermission")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewOwinRolePermission([FromBody] BDO.DataAccessObjects.SecurityModule.owin_rolepermissionEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_RolePermissionUseCase.GetListView(new Owin_RolePermissionRequest(request), _owin_RolePermissionPresenter);
            return _owin_RolePermissionPresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleOwinRolePermission
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleOwinRolePermission")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleOwinRolePermission([FromBody] BDO.DataAccessObjects.SecurityModule.owin_rolepermissionEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_RolePermissionUseCase.GetSingle(new Owin_RolePermissionRequest(request), _owin_RolePermissionPresenter);
            return _owin_RolePermissionPresenter.ContentResult;
        }

        /// <summary>
        /// SaveOwinRolePermission
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveOwinRolePermission")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveOwinRolePermission([FromBody] BDO.DataAccessObjects.SecurityModule.owin_rolepermissionEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_RolePermissionUseCase.Save(new Owin_RolePermissionRequest(request), _owin_RolePermissionPresenter);
            return _owin_RolePermissionPresenter.ContentResult;
        }

        /// <summary>
        /// UpdateOwinRolePermission
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateOwinRolePermission")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateOwinRolePermission([FromBody] BDO.DataAccessObjects.SecurityModule.owin_rolepermissionEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_RolePermissionUseCase.Update(new Owin_RolePermissionRequest(request), _owin_RolePermissionPresenter);
            return _owin_RolePermissionPresenter.ContentResult;
        }

        /// <summary>
        /// DeleteOwinRolePermission
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteOwinRolePermission")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteOwinRolePermission([FromBody] BDO.DataAccessObjects.SecurityModule.owin_rolepermissionEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_RolePermissionUseCase.Delete(new Owin_RolePermissionRequest(request), _owin_RolePermissionPresenter);
            return _owin_RolePermissionPresenter.ContentResult;
        }
    }
}

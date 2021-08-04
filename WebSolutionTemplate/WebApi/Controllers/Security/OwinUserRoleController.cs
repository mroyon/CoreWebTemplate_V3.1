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
    /// OwinUserRoleController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class OwinUserRoleController : ControllerBase
    {
        private readonly IOwin_UserRoleUseCase _owin_UserRoleUseCase;
        private readonly Owin_UserRolePresenter _owin_UserRolePresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// OwinUserRoleController
        /// </summary>
        /// <param name="owin_UserRoleUseCase"></param>
        /// <param name="owin_UserRolePresenter"></param>
        /// <param name="authSettings"></param>
        public OwinUserRoleController(
            IOwin_UserRoleUseCase owin_UserRoleUseCase,
            Owin_UserRolePresenter owin_UserRolePresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _owin_UserRoleUseCase = owin_UserRoleUseCase;
            _owin_UserRolePresenter = owin_UserRolePresenter;
        }


        /// <summary>
        /// GetAllOwinUserRole
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllOwinUserRole")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllOwinUserRole()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserRoleUseCase.GetAll(new Owin_UserRoleRequest(new BDO.DataAccessObjects.SecurityModule.owin_userroleEntity()), _owin_UserRolePresenter);
            return _owin_UserRolePresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedOwinUserRole
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedOwinUserRole")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedOwinUserRole([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userroleEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserRoleUseCase.GetAllPaged(new Owin_UserRoleRequest(request), _owin_UserRolePresenter);
            return _owin_UserRolePresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewOwinUserRole
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewOwinUserRole")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewOwinUserRole([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userroleEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserRoleUseCase.GetListView(new Owin_UserRoleRequest(request), _owin_UserRolePresenter);
            return _owin_UserRolePresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleOwinUserRole
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleOwinUserRole")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleOwinUserRole([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userroleEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserRoleUseCase.GetSingle(new Owin_UserRoleRequest(request), _owin_UserRolePresenter);
            return _owin_UserRolePresenter.ContentResult;
        }

        /// <summary>
        /// SaveOwinUserRole
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveOwinUserRole")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveOwinUserRole([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userroleEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserRoleUseCase.Save(new Owin_UserRoleRequest(request), _owin_UserRolePresenter);
            return _owin_UserRolePresenter.ContentResult;
        }

        /// <summary>
        /// UpdateOwinUserRole
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateOwinUserRole")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateOwinUserRole([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userroleEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserRoleUseCase.Update(new Owin_UserRoleRequest(request), _owin_UserRolePresenter);
            return _owin_UserRolePresenter.ContentResult;
        }

        /// <summary>
        /// DeleteOwinUserRole
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteOwinUserRole")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteOwinUserRole([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userroleEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserRoleUseCase.Delete(new Owin_UserRoleRequest(request), _owin_UserRolePresenter);
            return _owin_UserRolePresenter.ContentResult;
        }
    }
}

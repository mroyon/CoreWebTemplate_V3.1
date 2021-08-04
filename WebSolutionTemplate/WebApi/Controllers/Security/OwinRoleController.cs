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
    /// OwinRoleController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class OwinRoleController : ControllerBase
    {
        private readonly IOwin_RoleUseCase _owin_RoleUseCase;
        private readonly Owin_RolePresenter _owin_RolePresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// OwinRoleController
        /// </summary>
        /// <param name="owin_RoleUseCase"></param>
        /// <param name="owin_RolePresenter"></param>
        /// <param name="authSettings"></param>
        public OwinRoleController(
            IOwin_RoleUseCase owin_RoleUseCase,
            Owin_RolePresenter owin_RolePresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _owin_RoleUseCase = owin_RoleUseCase;
            _owin_RolePresenter = owin_RolePresenter;
        }


        /// <summary>
        /// GetAllOwinRole
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllOwinRole")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllOwinRole()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_RoleUseCase.GetAll(new Owin_RoleRequest(new BDO.DataAccessObjects.SecurityModule.owin_roleEntity()), _owin_RolePresenter);
            return _owin_RolePresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedOwinRole
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedOwinRole")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedOwinRole([FromBody] BDO.DataAccessObjects.SecurityModule.owin_roleEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_RoleUseCase.GetAllPaged(new Owin_RoleRequest(request), _owin_RolePresenter);
            return _owin_RolePresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewOwinRole
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewOwinRole")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewOwinRole([FromBody] BDO.DataAccessObjects.SecurityModule.owin_roleEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_RoleUseCase.GetListView(new Owin_RoleRequest(request), _owin_RolePresenter);
            return _owin_RolePresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleOwinRole
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleOwinRole")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleOwinRole([FromBody] BDO.DataAccessObjects.SecurityModule.owin_roleEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_RoleUseCase.GetSingle(new Owin_RoleRequest(request), _owin_RolePresenter);
            return _owin_RolePresenter.ContentResult;
        }

        /// <summary>
        /// SaveOwinRole
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveOwinRole")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveOwinRole([FromBody] BDO.DataAccessObjects.SecurityModule.owin_roleEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_RoleUseCase.Save(new Owin_RoleRequest(request), _owin_RolePresenter);
            return _owin_RolePresenter.ContentResult;
        }

        /// <summary>
        /// UpdateOwinRole
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateOwinRole")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateOwinRole([FromBody] BDO.DataAccessObjects.SecurityModule.owin_roleEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_RoleUseCase.Update(new Owin_RoleRequest(request), _owin_RolePresenter);
            return _owin_RolePresenter.ContentResult;
        }

        /// <summary>
        /// DeleteOwinRole
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteOwinRole")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteOwinRole([FromBody] BDO.DataAccessObjects.SecurityModule.owin_roleEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_RoleUseCase.Delete(new Owin_RoleRequest(request), _owin_RolePresenter);
            return _owin_RolePresenter.ContentResult;
        }
    }
}

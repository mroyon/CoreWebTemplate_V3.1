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
    /// OwinUserController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class OwinUserController : ControllerBase
    {
        private readonly IOwin_UserUseCase _owin_UserUseCase;
        private readonly Owin_UserPresenter _owin_UserPresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// OwinUserController
        /// </summary>
        /// <param name="owin_UserUseCase"></param>
        /// <param name="owin_UserPresenter"></param>
        /// <param name="authSettings"></param>
        public OwinUserController(
            IOwin_UserUseCase owin_UserUseCase,
            Owin_UserPresenter owin_UserPresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _owin_UserUseCase = owin_UserUseCase;
            _owin_UserPresenter = owin_UserPresenter;
        }


        /// <summary>
        /// GetAllOwinUser
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllOwinUser")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllOwinUser()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserUseCase.GetAll(new Owin_UserRequest(new BDO.DataAccessObjects.SecurityModule.owin_userEntity()), _owin_UserPresenter);
            return _owin_UserPresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedOwinUser
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedOwinUser")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedOwinUser([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserUseCase.GetAllPaged(new Owin_UserRequest(request), _owin_UserPresenter);
            return _owin_UserPresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewOwinUser
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewOwinUser")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewOwinUser([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserUseCase.GetListView(new Owin_UserRequest(request), _owin_UserPresenter);
            return _owin_UserPresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleOwinUser
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleOwinUser")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleOwinUser([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserUseCase.GetSingle(new Owin_UserRequest(request), _owin_UserPresenter);
            return _owin_UserPresenter.ContentResult;
        }

        /// <summary>
        /// SaveOwinUser
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveOwinUser")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveOwinUser([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserUseCase.Save(new Owin_UserRequest(request), _owin_UserPresenter);
            return _owin_UserPresenter.ContentResult;
        }

        /// <summary>
        /// UpdateOwinUser
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateOwinUser")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateOwinUser([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserUseCase.Update(new Owin_UserRequest(request), _owin_UserPresenter);
            return _owin_UserPresenter.ContentResult;
        }

        /// <summary>
        /// DeleteOwinUser
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteOwinUser")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteOwinUser([FromBody] BDO.DataAccessObjects.SecurityModule.owin_userEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_UserUseCase.Delete(new Owin_UserRequest(request), _owin_UserPresenter);
            return _owin_UserPresenter.ContentResult;
        }
    }
}

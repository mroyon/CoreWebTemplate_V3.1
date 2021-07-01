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
    /// OwinLastWorkingPageController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class OwinLastWorkingPageController : ControllerBase
    {
        private readonly IOwin_LastWorkingPageUseCase _owin_LastWorkingPageUseCase;
        private readonly Owin_LastWorkingPagePresenter _owin_LastWorkingPagePresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// OwinLastWorkingPageController
        /// </summary>
        /// <param name="owin_LastWorkingPageUseCase"></param>
        /// <param name="owin_LastWorkingPagePresenter"></param>
        /// <param name="authSettings"></param>
        public OwinLastWorkingPageController(
            IOwin_LastWorkingPageUseCase owin_LastWorkingPageUseCase,
            Owin_LastWorkingPagePresenter owin_LastWorkingPagePresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _owin_LastWorkingPageUseCase = owin_LastWorkingPageUseCase;
            _owin_LastWorkingPagePresenter = owin_LastWorkingPagePresenter;
        }


        /// <summary>
        /// GetAllOwinLastWorkingPage
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllOwinLastWorkingPage")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllOwinLastWorkingPage()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_LastWorkingPageUseCase.GetAll(new Owin_LastWorkingPageRequest(new BDO.DataAccessObjects.SecurityModule.owin_lastworkingpageEntity()), _owin_LastWorkingPagePresenter);
            return _owin_LastWorkingPagePresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedOwinLastWorkingPage
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedOwinLastWorkingPage")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedOwinLastWorkingPage([FromBody] BDO.DataAccessObjects.SecurityModule.owin_lastworkingpageEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_LastWorkingPageUseCase.GetAllPaged(new Owin_LastWorkingPageRequest(request), _owin_LastWorkingPagePresenter);
            return _owin_LastWorkingPagePresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewOwinLastWorkingPage
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewOwinLastWorkingPage")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewOwinLastWorkingPage([FromBody] BDO.DataAccessObjects.SecurityModule.owin_lastworkingpageEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_LastWorkingPageUseCase.GetListView(new Owin_LastWorkingPageRequest(request), _owin_LastWorkingPagePresenter);
            return _owin_LastWorkingPagePresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleOwinLastWorkingPage
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleOwinLastWorkingPage")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleOwinLastWorkingPage([FromBody] BDO.DataAccessObjects.SecurityModule.owin_lastworkingpageEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_LastWorkingPageUseCase.GetSingle(new Owin_LastWorkingPageRequest(request), _owin_LastWorkingPagePresenter);
            return _owin_LastWorkingPagePresenter.ContentResult;
        }

        /// <summary>
        /// SaveOwinLastWorkingPage
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveOwinLastWorkingPage")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveOwinLastWorkingPage([FromBody] BDO.DataAccessObjects.SecurityModule.owin_lastworkingpageEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_LastWorkingPageUseCase.Save(new Owin_LastWorkingPageRequest(request), _owin_LastWorkingPagePresenter);
            return _owin_LastWorkingPagePresenter.ContentResult;
        }

        /// <summary>
        /// UpdateOwinLastWorkingPage
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateOwinLastWorkingPage")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateOwinLastWorkingPage([FromBody] BDO.DataAccessObjects.SecurityModule.owin_lastworkingpageEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_LastWorkingPageUseCase.Update(new Owin_LastWorkingPageRequest(request), _owin_LastWorkingPagePresenter);
            return _owin_LastWorkingPagePresenter.ContentResult;
        }

        /// <summary>
        /// DeleteOwinLastWorkingPage
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteOwinLastWorkingPage")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteOwinLastWorkingPage([FromBody] BDO.DataAccessObjects.SecurityModule.owin_lastworkingpageEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _owin_LastWorkingPageUseCase.Delete(new Owin_LastWorkingPageRequest(request), _owin_LastWorkingPagePresenter);
            return _owin_LastWorkingPagePresenter.ContentResult;
        }
    }
}

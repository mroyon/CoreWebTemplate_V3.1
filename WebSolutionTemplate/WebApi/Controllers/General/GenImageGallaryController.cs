using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Web.Core.Frame.RequestResponse.UseCaseRequests;
using Web.Core.Frame.Interfaces.UseCases;
using WebApi.Presenters;
using Microsoft.AspNetCore.Authorization;
using WebApi.Extensions;
using BDO.DataAccessObjects.ExtendedEntities;

namespace WebApi.Controllers
{
    /// <summary>
    /// GenImageGallaryController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class GenImageGallaryController : ControllerBase
    {
        private readonly IGen_ImageGallaryUseCase _gen_ImageGallaryUseCase;
        private readonly Gen_ImageGallaryPresenter _gen_ImageGallaryPresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// GenImageGallaryController
        /// </summary>
        /// <param name="gen_ImageGallaryUseCase"></param>
        /// <param name="gen_ImageGallaryPresenter"></param>
        /// <param name="authSettings"></param>
        public GenImageGallaryController(
            IGen_ImageGallaryUseCase gen_ImageGallaryUseCase,
            Gen_ImageGallaryPresenter gen_ImageGallaryPresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _gen_ImageGallaryUseCase = gen_ImageGallaryUseCase;
            _gen_ImageGallaryPresenter = gen_ImageGallaryPresenter;
        }


        /// <summary>
        /// GetAllGenImageGallary
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllGenImageGallary")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllGenImageGallary()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_ImageGallaryUseCase.GetAll(new Gen_ImageGallaryRequest(new BDO.DataAccessObjects.Models.gen_imagegallaryEntity()), _gen_ImageGallaryPresenter);
            return _gen_ImageGallaryPresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedGenImageGallary
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedGenImageGallary")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedGenImageGallary([FromBody] BDO.DataAccessObjects.Models.gen_imagegallaryEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_ImageGallaryUseCase.GetAllPaged(new Gen_ImageGallaryRequest(request), _gen_ImageGallaryPresenter);
            return _gen_ImageGallaryPresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewGenImageGallary
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewGenImageGallary")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewGenImageGallary([FromBody] BDO.DataAccessObjects.Models.gen_imagegallaryEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_ImageGallaryUseCase.GetListView(new Gen_ImageGallaryRequest(request), _gen_ImageGallaryPresenter);
            return _gen_ImageGallaryPresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleGenImageGallary
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleGenImageGallary")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleGenImageGallary([FromBody] BDO.DataAccessObjects.Models.gen_imagegallaryEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_ImageGallaryUseCase.GetSingle(new Gen_ImageGallaryRequest(request), _gen_ImageGallaryPresenter);
            return _gen_ImageGallaryPresenter.ContentResult;
        }

        /// <summary>
        /// SaveGenImageGallary
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveGenImageGallary")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveGenImageGallary([FromBody] BDO.DataAccessObjects.Models.gen_imagegallaryEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_ImageGallaryUseCase.Save(new Gen_ImageGallaryRequest(request), _gen_ImageGallaryPresenter);
            return _gen_ImageGallaryPresenter.ContentResult;
        }

        /// <summary>
        /// UpdateGenImageGallary
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateGenImageGallary")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateGenImageGallary([FromBody] BDO.DataAccessObjects.Models.gen_imagegallaryEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_ImageGallaryUseCase.Update(new Gen_ImageGallaryRequest(request), _gen_ImageGallaryPresenter);
            return _gen_ImageGallaryPresenter.ContentResult;
        }

        /// <summary>
        /// DeleteGenImageGallary
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteGenImageGallary")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteGenImageGallary([FromBody] BDO.DataAccessObjects.Models.gen_imagegallaryEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_ImageGallaryUseCase.Delete(new Gen_ImageGallaryRequest(request), _gen_ImageGallaryPresenter);
            return _gen_ImageGallaryPresenter.ContentResult;
        }
    }
}

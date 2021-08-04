using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Web.Core.Frame.RequestResponse.UseCaseRequests;
using Web.Core.Frame.Interfaces.UseCases;
using Web.Core.Frame.Presenters;
using Microsoft.AspNetCore.Authorization;
using WebApi.Extensions;
using BDO.DataAccessObjects.ExtendedEntities;

namespace WebApi.Controllers
{
    /// <summary>
    /// GenImageGallaryCategoryController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class GenImageGallaryCategoryController : ControllerBase
    {
        private readonly IGen_ImageGallaryCategoryUseCase _gen_ImageGallaryCategoryUseCase;
        private readonly Gen_ImageGallaryCategoryPresenter _gen_ImageGallaryCategoryPresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// GenImageGallaryCategoryController
        /// </summary>
        /// <param name="gen_ImageGallaryCategoryUseCase"></param>
        /// <param name="gen_ImageGallaryCategoryPresenter"></param>
        /// <param name="authSettings"></param>
        public GenImageGallaryCategoryController(
            IGen_ImageGallaryCategoryUseCase gen_ImageGallaryCategoryUseCase,
            Gen_ImageGallaryCategoryPresenter gen_ImageGallaryCategoryPresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _gen_ImageGallaryCategoryUseCase = gen_ImageGallaryCategoryUseCase;
            _gen_ImageGallaryCategoryPresenter = gen_ImageGallaryCategoryPresenter;
        }


        /// <summary>
        /// GetAllGenImageGallaryCategory
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllGenImageGallaryCategory")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllGenImageGallaryCategory()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_ImageGallaryCategoryUseCase.GetAll(new Gen_ImageGallaryCategoryRequest(new BDO.DataAccessObjects.Models.gen_imagegallarycategoryEntity()), _gen_ImageGallaryCategoryPresenter);
            return _gen_ImageGallaryCategoryPresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedGenImageGallaryCategory
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedGenImageGallaryCategory")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedGenImageGallaryCategory([FromBody] BDO.DataAccessObjects.Models.gen_imagegallarycategoryEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_ImageGallaryCategoryUseCase.GetAllPaged(new Gen_ImageGallaryCategoryRequest(request), _gen_ImageGallaryCategoryPresenter);
            return _gen_ImageGallaryCategoryPresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewGenImageGallaryCategory
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewGenImageGallaryCategory")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewGenImageGallaryCategory([FromBody] BDO.DataAccessObjects.Models.gen_imagegallarycategoryEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_ImageGallaryCategoryUseCase.GetListView(new Gen_ImageGallaryCategoryRequest(request), _gen_ImageGallaryCategoryPresenter);
            return _gen_ImageGallaryCategoryPresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleGenImageGallaryCategory
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleGenImageGallaryCategory")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleGenImageGallaryCategory([FromBody] BDO.DataAccessObjects.Models.gen_imagegallarycategoryEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_ImageGallaryCategoryUseCase.GetSingle(new Gen_ImageGallaryCategoryRequest(request), _gen_ImageGallaryCategoryPresenter);
            return _gen_ImageGallaryCategoryPresenter.ContentResult;
        }

        /// <summary>
        /// SaveGenImageGallaryCategory
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveGenImageGallaryCategory")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveGenImageGallaryCategory([FromBody] BDO.DataAccessObjects.Models.gen_imagegallarycategoryEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_ImageGallaryCategoryUseCase.Save(new Gen_ImageGallaryCategoryRequest(request), _gen_ImageGallaryCategoryPresenter);
            return _gen_ImageGallaryCategoryPresenter.ContentResult;
        }

        /// <summary>
        /// UpdateGenImageGallaryCategory
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateGenImageGallaryCategory")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateGenImageGallaryCategory([FromBody] BDO.DataAccessObjects.Models.gen_imagegallarycategoryEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_ImageGallaryCategoryUseCase.Update(new Gen_ImageGallaryCategoryRequest(request), _gen_ImageGallaryCategoryPresenter);
            return _gen_ImageGallaryCategoryPresenter.ContentResult;
        }

        /// <summary>
        /// DeleteGenImageGallaryCategory
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteGenImageGallaryCategory")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteGenImageGallaryCategory([FromBody] BDO.DataAccessObjects.Models.gen_imagegallarycategoryEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_ImageGallaryCategoryUseCase.Delete(new Gen_ImageGallaryCategoryRequest(request), _gen_ImageGallaryCategoryPresenter);
            return _gen_ImageGallaryCategoryPresenter.ContentResult;
        }
    }
}

using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Web.Api.Infrastructure;
using Web.Core.Frame.Interfaces.UseCases;
using WebApi.Presenters;
using BDO.DataAccessObjects.ExtendedEntities;
using Microsoft.AspNetCore.Authorization;
using WebApi.Extensions;
using Web.Core.Frame.RequestResponse.UseCaseRequests;

namespace WebApi.Controllers
{
    /// <summary>
    /// GenFAQCategoryController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class GenFAQCategoryController : ControllerBase
    {
        private readonly IGen_FAQCategoryUseCase _gen_FAQCategoryUseCase;
        private readonly Gen_FAQCategoryPresenter _gen_FAQCategoryPresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// GenFAQCategoryController
        /// </summary>
        /// <param name="gen_FAQCategoryUseCase"></param>
        /// <param name="gen_FAQCategoryPresenter"></param>
        /// <param name="authSettings"></param>
        public GenFAQCategoryController(
            IGen_FAQCategoryUseCase gen_FAQCategoryUseCase,
            Gen_FAQCategoryPresenter gen_FAQCategoryPresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _gen_FAQCategoryUseCase = gen_FAQCategoryUseCase;
            _gen_FAQCategoryPresenter = gen_FAQCategoryPresenter;
        }


        /// <summary>
        /// GetAllGenFAQCategory
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllGenFAQCategory")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllGenFAQCategory()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FAQCategoryUseCase.GetAll(new Gen_FAQCategoryRequest(new BDO.DataAccessObjects.Models.gen_faqcategoryEntity()), _gen_FAQCategoryPresenter);
            return _gen_FAQCategoryPresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedGenFAQCategory
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedGenFAQCategory")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedGenFAQCategory([FromBody] BDO.DataAccessObjects.Models.gen_faqcategoryEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FAQCategoryUseCase.GetAllPaged(new Gen_FAQCategoryRequest(request), _gen_FAQCategoryPresenter);
            return _gen_FAQCategoryPresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewGenFAQCategory
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewGenFAQCategory")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewGenFAQCategory([FromBody] BDO.DataAccessObjects.Models.gen_faqcategoryEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FAQCategoryUseCase.GetListView(new Gen_FAQCategoryRequest(request), _gen_FAQCategoryPresenter);
            return _gen_FAQCategoryPresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleGenFAQCategory
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleGenFAQCategory")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleGenFAQCategory([FromBody] BDO.DataAccessObjects.Models.gen_faqcategoryEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FAQCategoryUseCase.GetSingle(new Gen_FAQCategoryRequest(request), _gen_FAQCategoryPresenter);
            return _gen_FAQCategoryPresenter.ContentResult;
        }

        /// <summary>
        /// SaveGenFAQCategory
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveGenFAQCategory")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveGenFAQCategory([FromBody] BDO.DataAccessObjects.Models.gen_faqcategoryEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FAQCategoryUseCase.Save(new Gen_FAQCategoryRequest(request), _gen_FAQCategoryPresenter);
            return _gen_FAQCategoryPresenter.ContentResult;
        }

        /// <summary>
        /// UpdateGenFAQCategory
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateGenFAQCategory")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateGenFAQCategory([FromBody] BDO.DataAccessObjects.Models.gen_faqcategoryEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FAQCategoryUseCase.Update(new Gen_FAQCategoryRequest(request), _gen_FAQCategoryPresenter);
            return _gen_FAQCategoryPresenter.ContentResult;
        }

        /// <summary>
        /// DeleteGenFAQCategory
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteGenFAQCategory")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteGenFAQCategory([FromBody] BDO.DataAccessObjects.Models.gen_faqcategoryEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FAQCategoryUseCase.Delete(new Gen_FAQCategoryRequest(request), _gen_FAQCategoryPresenter);
            return _gen_FAQCategoryPresenter.ContentResult;
        }
    }
}

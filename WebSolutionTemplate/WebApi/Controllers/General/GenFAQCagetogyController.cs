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
    /// GenFAQCagetogyController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class GenFAQCagetogyController : ControllerBase
    {
        private readonly IGen_FAQCagetogyUseCase _gen_FAQCagetogyUseCase;
        private readonly Gen_FAQCagetogyPresenter _gen_FAQCagetogyPresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// GenFAQCagetogyController
        /// </summary>
        /// <param name="gen_FAQCagetogyUseCase"></param>
        /// <param name="gen_FAQCagetogyPresenter"></param>
        /// <param name="authSettings"></param>
        public GenFAQCagetogyController(
            IGen_FAQCagetogyUseCase gen_FAQCagetogyUseCase,
            Gen_FAQCagetogyPresenter gen_FAQCagetogyPresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _gen_FAQCagetogyUseCase = gen_FAQCagetogyUseCase;
            _gen_FAQCagetogyPresenter = gen_FAQCagetogyPresenter;
        }


        /// <summary>
        /// GetAllGenFAQCagetogy
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllGenFAQCagetogy")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllGenFAQCagetogy()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FAQCagetogyUseCase.GetAll(new Gen_FAQCagetogyRequest(new BDO.DataAccessObjects.Models.gen_faqcagetogyEntity()), _gen_FAQCagetogyPresenter);
            return _gen_FAQCagetogyPresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedGenFAQCagetogy
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedGenFAQCagetogy")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedGenFAQCagetogy([FromBody] BDO.DataAccessObjects.Models.gen_faqcagetogyEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FAQCagetogyUseCase.GetAllPaged(new Gen_FAQCagetogyRequest(request), _gen_FAQCagetogyPresenter);
            return _gen_FAQCagetogyPresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewGenFAQCagetogy
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewGenFAQCagetogy")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewGenFAQCagetogy([FromBody] BDO.DataAccessObjects.Models.gen_faqcagetogyEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FAQCagetogyUseCase.GetListView(new Gen_FAQCagetogyRequest(request), _gen_FAQCagetogyPresenter);
            return _gen_FAQCagetogyPresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleGenFAQCagetogy
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleGenFAQCagetogy")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleGenFAQCagetogy([FromBody] BDO.DataAccessObjects.Models.gen_faqcagetogyEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FAQCagetogyUseCase.GetSingle(new Gen_FAQCagetogyRequest(request), _gen_FAQCagetogyPresenter);
            return _gen_FAQCagetogyPresenter.ContentResult;
        }

        /// <summary>
        /// SaveGenFAQCagetogy
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveGenFAQCagetogy")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveGenFAQCagetogy([FromBody] BDO.DataAccessObjects.Models.gen_faqcagetogyEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FAQCagetogyUseCase.Save(new Gen_FAQCagetogyRequest(request), _gen_FAQCagetogyPresenter);
            return _gen_FAQCagetogyPresenter.ContentResult;
        }

        /// <summary>
        /// UpdateGenFAQCagetogy
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateGenFAQCagetogy")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateGenFAQCagetogy([FromBody] BDO.DataAccessObjects.Models.gen_faqcagetogyEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FAQCagetogyUseCase.Update(new Gen_FAQCagetogyRequest(request), _gen_FAQCagetogyPresenter);
            return _gen_FAQCagetogyPresenter.ContentResult;
        }

        /// <summary>
        /// DeleteGenFAQCagetogy
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteGenFAQCagetogy")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteGenFAQCagetogy([FromBody] BDO.DataAccessObjects.Models.gen_faqcagetogyEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FAQCagetogyUseCase.Delete(new Gen_FAQCagetogyRequest(request), _gen_FAQCagetogyPresenter);
            return _gen_FAQCagetogyPresenter.ContentResult;
        }
    }
}

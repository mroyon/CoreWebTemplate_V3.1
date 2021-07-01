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
    /// GenFAQController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class GenFAQController : ControllerBase
    {
        private readonly IGen_FAQUseCase _gen_FAQUseCase;
        private readonly Gen_FAQPresenter _gen_FAQPresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// GenFAQController
        /// </summary>
        /// <param name="gen_FAQUseCase"></param>
        /// <param name="gen_FAQPresenter"></param>
        /// <param name="authSettings"></param>
        public GenFAQController(
            IGen_FAQUseCase gen_FAQUseCase,
            Gen_FAQPresenter gen_FAQPresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _gen_FAQUseCase = gen_FAQUseCase;
            _gen_FAQPresenter = gen_FAQPresenter;
        }


        /// <summary>
        /// GetAllGenFAQ
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllGenFAQ")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllGenFAQ()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FAQUseCase.GetAll(new Gen_FAQRequest(new BDO.DataAccessObjects.Models.gen_faqEntity()), _gen_FAQPresenter);
            return _gen_FAQPresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedGenFAQ
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedGenFAQ")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedGenFAQ([FromBody] BDO.DataAccessObjects.Models.gen_faqEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FAQUseCase.GetAllPaged(new Gen_FAQRequest(request), _gen_FAQPresenter);
            return _gen_FAQPresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewGenFAQ
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewGenFAQ")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewGenFAQ([FromBody] BDO.DataAccessObjects.Models.gen_faqEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FAQUseCase.GetListView(new Gen_FAQRequest(request), _gen_FAQPresenter);
            return _gen_FAQPresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleGenFAQ
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleGenFAQ")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleGenFAQ([FromBody] BDO.DataAccessObjects.Models.gen_faqEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FAQUseCase.GetSingle(new Gen_FAQRequest(request), _gen_FAQPresenter);
            return _gen_FAQPresenter.ContentResult;
        }

        /// <summary>
        /// SaveGenFAQ
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveGenFAQ")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveGenFAQ([FromBody] BDO.DataAccessObjects.Models.gen_faqEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FAQUseCase.Save(new Gen_FAQRequest(request), _gen_FAQPresenter);
            return _gen_FAQPresenter.ContentResult;
        }

        /// <summary>
        /// UpdateGenFAQ
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateGenFAQ")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateGenFAQ([FromBody] BDO.DataAccessObjects.Models.gen_faqEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FAQUseCase.Update(new Gen_FAQRequest(request), _gen_FAQPresenter);
            return _gen_FAQPresenter.ContentResult;
        }

        /// <summary>
        /// DeleteGenFAQ
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteGenFAQ")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteGenFAQ([FromBody] BDO.DataAccessObjects.Models.gen_faqEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FAQUseCase.Delete(new Gen_FAQRequest(request), _gen_FAQPresenter);
            return _gen_FAQPresenter.ContentResult;
        }
    }
}

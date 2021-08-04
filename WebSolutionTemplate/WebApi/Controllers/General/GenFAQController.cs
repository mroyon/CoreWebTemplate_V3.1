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
    /// GenFaqController
    /// </summary>
    [Authorize(Policy = "ApiUser")]
    [Route("api/[controller]")]
    [ApiController]
    public class GenFaqController : ControllerBase
    {
        private readonly IGen_FaqUseCase _gen_FaqUseCase;
        private readonly Gen_FaqPresenter _gen_FaqPresenter;
        private readonly AuthSettings _authSettings;

        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }

        /// <summary>
        /// GenFaqController
        /// </summary>
        /// <param name="gen_FaqUseCase"></param>
        /// <param name="gen_FaqPresenter"></param>
        /// <param name="authSettings"></param>
        public GenFaqController(
            IGen_FaqUseCase gen_FaqUseCase,
            Gen_FaqPresenter gen_FaqPresenter,
            IOptions<AuthSettings> authSettings)
        {
            _authSettings = authSettings.Value;
            _gen_FaqUseCase = gen_FaqUseCase;
            _gen_FaqPresenter = gen_FaqPresenter;
        }


        /// <summary>
        /// GetAllGenFaq
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetAllGenFaq")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllGenFaq()
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FaqUseCase.GetAll(new Gen_FaqRequest(new BDO.DataAccessObjects.Models.gen_faqEntity()), _gen_FaqPresenter);
            return _gen_FaqPresenter.ContentResult;
        }

        /// <summary>
        /// GetAllPagedGenFaq
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetAllPagedGenFaq")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetAllPagedGenFaq([FromBody] BDO.DataAccessObjects.Models.gen_faqEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FaqUseCase.GetAllPaged(new Gen_FaqRequest(request), _gen_FaqPresenter);
            return _gen_FaqPresenter.ContentResult;
        }

        /// <summary>
        /// GetListViewGenFaq
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetListViewGenFaq")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetListViewGenFaq([FromBody] BDO.DataAccessObjects.Models.gen_faqEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FaqUseCase.GetListView(new Gen_FaqRequest(request), _gen_FaqPresenter);
            return _gen_FaqPresenter.ContentResult;
        }

        /// <summary>
        /// GetSingleGenFaq
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetSingleGenFaq")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> GetSingleGenFaq([FromBody] BDO.DataAccessObjects.Models.gen_faqEntity request)
        {
            //if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FaqUseCase.GetSingle(new Gen_FaqRequest(request), _gen_FaqPresenter);
            return _gen_FaqPresenter.ContentResult;
        }

        /// <summary>
        /// SaveGenFaq
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("SaveGenFaq")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> SaveGenFaq([FromBody] BDO.DataAccessObjects.Models.gen_faqEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FaqUseCase.Save(new Gen_FaqRequest(request), _gen_FaqPresenter);
            return _gen_FaqPresenter.ContentResult;
        }

        /// <summary>
        /// UpdateGenFaq
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("UpdateGenFaq")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> UpdateGenFaq([FromBody] BDO.DataAccessObjects.Models.gen_faqEntity request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FaqUseCase.Update(new Gen_FaqRequest(request), _gen_FaqPresenter);
            return _gen_FaqPresenter.ContentResult;
        }

        /// <summary>
        /// DeleteGenFaq
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("DeleteGenFaq")]
        [ServiceFilter(typeof(ApiSecurityFillerAttribute))]
        public async Task<ActionResult> DeleteGenFaq([FromBody] BDO.DataAccessObjects.Models.gen_faqEntity request)
        {
            ModelState.Remove("PriorityName");
            ModelState.Remove("PriorityOrder");
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            await _gen_FaqUseCase.Delete(new Gen_FaqRequest(request), _gen_FaqPresenter);
            return _gen_FaqPresenter.ContentResult;
        }
    }
}

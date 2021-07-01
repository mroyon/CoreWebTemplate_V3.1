using BDO.DataAccessObjects.Models;
using System.Collections.Generic;
using Web.Core.Frame.Dto;
using Web.Core.Frame.Interfaces;

namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Gen_FAQResponse : UseCaseResponseMessage
    {
        public gen_faqEntity _gen_FAQ { get; }

        public IEnumerable<gen_faqEntity> _gen_FAQList { get; }

        public Error Errors { get; }


        public Gen_FAQResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Gen_FAQResponse(IEnumerable<gen_faqEntity> gen_FAQList, bool success = false, string message = null) : base(success, message)
        {
            _gen_FAQList = gen_FAQList;
        }
        
        public Gen_FAQResponse(gen_faqEntity gen_FAQ, bool success = false, string message = null) : base(success, message)
        {
            _gen_FAQ = gen_FAQ;
        }
    }
}

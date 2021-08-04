using BDO.DataAccessObjects.ExtendedEntities;
using BDO.DataAccessObjects.Models;
using System.Collections.Generic;
using Web.Core.Frame.Dto;
using Web.Core.Frame.Interfaces;

namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Gen_FAQCagetogyResponse : UseCaseResponseMessage
    {
        public gen_faqcagetogyEntity _gen_FAQCagetogy { get; }

        public IEnumerable<gen_faqcagetogyEntity> _gen_FAQCagetogyList { get; }

        public Error Errors { get; }


        public Gen_FAQCagetogyResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Gen_FAQCagetogyResponse(IEnumerable<gen_faqcagetogyEntity> gen_FAQCagetogyList, bool success = false, string message = null) : base(success, message)
        {
            _gen_FAQCagetogyList = gen_FAQCagetogyList;
        }
        
        public Gen_FAQCagetogyResponse(gen_faqcagetogyEntity gen_FAQCagetogy, bool success = false, string message = null) : base(success, message)
        {
            _gen_FAQCagetogy = gen_FAQCagetogy;
        }
    }
}

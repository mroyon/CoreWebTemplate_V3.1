using Web.Core.Frame.Dto;
using BDO.DataAccessObjects.Models;
using System.Collections.Generic;
using Web.Core.Frame.Interfaces;

namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Gen_FAQCategoryResponse : UseCaseResponseMessage
    {
        public gen_faqcategoryEntity _gen_FAQCategory { get; }

        public IEnumerable<gen_faqcategoryEntity> _gen_FAQCategoryList { get; }

        public Error Errors { get; }


        public Gen_FAQCategoryResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Gen_FAQCategoryResponse(IEnumerable<gen_faqcategoryEntity> gen_FAQCategoryList, bool success = false, string message = null) : base(success, message)
        {
            _gen_FAQCategoryList = gen_FAQCategoryList;
        }
        
        public Gen_FAQCategoryResponse(gen_faqcategoryEntity gen_FAQCategory, bool success = false, string message = null) : base(success, message)
        {
            _gen_FAQCategory = gen_FAQCategory;
        }
    }
}

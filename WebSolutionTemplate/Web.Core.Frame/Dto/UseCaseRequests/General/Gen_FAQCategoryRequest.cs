using Web.Core.Frame.RequestResponse.UseCaseResponses;
using Web.Core.Frame.Interfaces;
using BDO.DataAccessObjects.Models;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Gen_FAQCategoryRequest : IUseCaseRequest<Gen_FAQCategoryResponse>
    {
        public gen_faqcategoryEntity Objgen_faqcategory { get; }
        public string RemoteIpAddress { get; }

        public Gen_FAQCategoryRequest(gen_faqcategoryEntity objgen_faqcategory)
        {
            Objgen_faqcategory = objgen_faqcategory;
        }
    }
}

using Web.Core.Frame.RequestResponse.UseCaseResponses;
using Web.Core.Frame.Interfaces;
using BDO.DataAccessObjects.Models;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Gen_FAQCagetogyRequest : IUseCaseRequest<Gen_FAQCagetogyResponse>
    {
        public gen_faqcagetogyEntity Objgen_faqcagetogy { get; }
        public string RemoteIpAddress { get; }

        public Gen_FAQCagetogyRequest(gen_faqcagetogyEntity objgen_faqcagetogy)
        {
            Objgen_faqcagetogy = objgen_faqcagetogy;
        }
    }
}

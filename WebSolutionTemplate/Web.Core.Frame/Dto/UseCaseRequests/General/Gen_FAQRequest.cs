using Web.Core.Frame.RequestResponse.UseCaseResponses;
using Web.Core.Frame.Interfaces;
using BDO.DataAccessObjects.Models;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Gen_FaqRequest : IUseCaseRequest<Gen_FaqResponse>
    {
        public gen_faqEntity Objgen_faq { get; }
        public string RemoteIpAddress { get; }

        public Gen_FaqRequest(gen_faqEntity objgen_faq)
        {
            Objgen_faq = objgen_faq;
        }
    }
}

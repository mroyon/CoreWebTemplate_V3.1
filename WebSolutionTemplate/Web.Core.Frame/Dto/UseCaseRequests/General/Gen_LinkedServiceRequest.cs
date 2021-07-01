using Web.Core.Frame.RequestResponse.UseCaseResponses;
using Web.Core.Frame.Interfaces;
using BDO.DataAccessObjects.Models;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Gen_LinkedServiceRequest : IUseCaseRequest<Gen_LinkedServiceResponse>
    {
        public gen_linkedserviceEntity Objgen_linkedservice { get; }
        public string RemoteIpAddress { get; }

        public Gen_LinkedServiceRequest(gen_linkedserviceEntity objgen_linkedservice)
        {
            Objgen_linkedservice = objgen_linkedservice;
        }
    }
}

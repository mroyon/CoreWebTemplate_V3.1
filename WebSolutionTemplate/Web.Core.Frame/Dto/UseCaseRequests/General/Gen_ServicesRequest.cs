using Web.Core.Frame.RequestResponse.UseCaseResponses;
using Web.Core.Frame.Interfaces;
using BDO.DataAccessObjects.Models;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Gen_ServicesRequest : IUseCaseRequest<Gen_ServicesResponse>
    {
        public gen_servicesEntity Objgen_services { get; }
        public string RemoteIpAddress { get; }

        public Gen_ServicesRequest(gen_servicesEntity objgen_services)
        {
            Objgen_services = objgen_services;
        }
    }
}

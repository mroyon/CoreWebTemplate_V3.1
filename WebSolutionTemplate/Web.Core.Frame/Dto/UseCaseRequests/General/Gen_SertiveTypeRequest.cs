using Web.Core.Frame.RequestResponse.UseCaseResponses;
using Web.Core.Frame.Interfaces;
using BDO.DataAccessObjects.Models;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Gen_SertiveTypeRequest : IUseCaseRequest<Gen_SertiveTypeResponse>
    {
        public gen_sertivetypeEntity Objgen_sertivetype { get; }
        public string RemoteIpAddress { get; }

        public Gen_SertiveTypeRequest(gen_sertivetypeEntity objgen_sertivetype)
        {
            Objgen_sertivetype = objgen_sertivetype;
        }
    }
}

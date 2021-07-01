using Web.Core.Frame.RequestResponse.UseCaseResponses;
using Web.Core.Frame.Interfaces;
using BDO.DataAccessObjects.Models;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Gen_DocTypeRequest : IUseCaseRequest<Gen_DocTypeResponse>
    {
        public gen_doctypeEntity Objgen_doctype { get; }
        public string RemoteIpAddress { get; }

        public Gen_DocTypeRequest(gen_doctypeEntity objgen_doctype)
        {
            Objgen_doctype = objgen_doctype;
        }
    }
}

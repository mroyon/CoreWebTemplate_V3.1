using Web.Core.Frame.RequestResponse.UseCaseResponses;
using Web.Core.Frame.Interfaces;
using BDO.DataAccessObjects.SecurityModule;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Owin_FormActionRequest : IUseCaseRequest<Owin_FormActionResponse>
    {
        public owin_formactionEntity Objowin_formaction { get; }
        public string RemoteIpAddress { get; }

        public Owin_FormActionRequest(owin_formactionEntity objowin_formaction)
        {
            Objowin_formaction = objowin_formaction;
        }
    }
}

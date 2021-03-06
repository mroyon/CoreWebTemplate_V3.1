using BDO.DataAccessObjects.SecurityModule;
using Web.Core.Frame.Interfaces;
using Web.Core.Frame.RequestResponse.UseCaseResponses;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Owin_LastWorkingPageRequest : IUseCaseRequest<Owin_LastWorkingPageResponse>
    {
        public owin_lastworkingpageEntity Objowin_lastworkingpage { get; }
        public string RemoteIpAddress { get; }

        public Owin_LastWorkingPageRequest(owin_lastworkingpageEntity objowin_lastworkingpage)
        {
            Objowin_lastworkingpage = objowin_lastworkingpage;
        }
    }
}

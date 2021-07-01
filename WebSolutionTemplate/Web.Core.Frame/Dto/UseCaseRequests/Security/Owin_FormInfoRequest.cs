using Web.Core.Frame.RequestResponse.UseCaseResponses;
using Web.Core.Frame.Interfaces;
using BDO.DataAccessObjects.SecurityModule;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Owin_FormInfoRequest : IUseCaseRequest<Owin_FormInfoResponse>
    {
        public owin_forminfoEntity Objowin_forminfo { get; }
        public string RemoteIpAddress { get; }

        public Owin_FormInfoRequest(owin_forminfoEntity objowin_forminfo)
        {
            Objowin_forminfo = objowin_forminfo;
        }
    }
}

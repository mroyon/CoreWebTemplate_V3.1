using BDO.DataAccessObjects.SecurityModule;
using Web.Core.Frame.Interfaces;
using Web.Core.Frame.RequestResponse.UseCaseResponses;

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

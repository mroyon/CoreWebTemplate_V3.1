using BDO.DataAccessObjects.SecurityModule;
using Web.Core.Frame.Interfaces;
using Web.Core.Frame.RequestResponse.UseCaseResponses;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Owin_UserClaimsRequest : IUseCaseRequest<Owin_UserClaimsResponse>
    {
        public owin_userclaimsEntity Objowin_userclaims { get; }
        public string RemoteIpAddress { get; }

        public Owin_UserClaimsRequest(owin_userclaimsEntity objowin_userclaims)
        {
            Objowin_userclaims = objowin_userclaims;
        }
    }
}

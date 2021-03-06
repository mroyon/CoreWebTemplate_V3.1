using BDO.DataAccessObjects.SecurityModule;
using Web.Core.Frame.Interfaces;
using Web.Core.Frame.RequestResponse.UseCaseResponses;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Owin_UserLoginTrailRequest : IUseCaseRequest<Owin_UserLoginTrailResponse>
    {
        public owin_userlogintrailEntity Objowin_userlogintrail { get; }
        public string RemoteIpAddress { get; }

        public Owin_UserLoginTrailRequest(owin_userlogintrailEntity objowin_userlogintrail)
        {
            Objowin_userlogintrail = objowin_userlogintrail;
        }
    }
}

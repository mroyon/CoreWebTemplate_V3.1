using BDO.DataAccessObjects.SecurityModule;
using Web.Core.Frame.Interfaces;
using Web.Core.Frame.RequestResponse.UseCaseResponses;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Owin_UserRolesRequest : IUseCaseRequest<Owin_UserRolesResponse>
    {
        public owin_userrolesEntity Objowin_userroles { get; }
        public string RemoteIpAddress { get; }

        public Owin_UserRolesRequest(owin_userrolesEntity objowin_userroles)
        {
            Objowin_userroles = objowin_userroles;
        }
    }
}

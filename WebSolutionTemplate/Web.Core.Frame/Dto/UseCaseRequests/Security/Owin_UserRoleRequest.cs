using Web.Core.Frame.RequestResponse.UseCaseResponses;
using Web.Core.Frame.Interfaces;
using BDO.DataAccessObjects.SecurityModule;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Owin_UserRoleRequest : IUseCaseRequest<Owin_UserRoleResponse>
    {
        public owin_userroleEntity Objowin_userrole { get; }
        public string RemoteIpAddress { get; }

        public Owin_UserRoleRequest(owin_userroleEntity objowin_userrole)
        {
            Objowin_userrole = objowin_userrole;
        }
    }
}

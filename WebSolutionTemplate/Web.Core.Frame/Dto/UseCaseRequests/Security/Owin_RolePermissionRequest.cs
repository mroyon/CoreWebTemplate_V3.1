using BDO.DataAccessObjects.SecurityModule;
using Web.Core.Frame.Interfaces;
using Web.Core.Frame.RequestResponse.UseCaseResponses;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Owin_RolePermissionRequest : IUseCaseRequest<Owin_RolePermissionResponse>
    {
        public owin_rolepermissionEntity Objowin_rolepermission { get; }
        public string RemoteIpAddress { get; }

        public Owin_RolePermissionRequest(owin_rolepermissionEntity objowin_rolepermission)
        {
            Objowin_rolepermission = objowin_rolepermission;
        }
    }
}

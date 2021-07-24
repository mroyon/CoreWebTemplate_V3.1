using BDO.DataAccessObjects.SecurityModule;
using Web.Core.Frame.Interfaces;
using Web.Core.Frame.RequestResponse.UseCaseResponses;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Owin_UserRequest : IUseCaseRequest<Owin_UserResponse>
    {
        public owin_userEntity Objowin_user { get; }
        public string RemoteIpAddress { get; }

        public Owin_UserRequest(owin_userEntity objowin_user)
        {
            Objowin_user = objowin_user;
        }
    }
}

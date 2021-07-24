using BDO.DataAccessObjects.SecurityModule;
using Web.Core.Frame.Interfaces;
using Web.Core.Frame.RequestResponse.UseCaseResponses;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Owin_UserPasswordResetInfoRequest : IUseCaseRequest<Owin_UserPasswordResetInfoResponse>
    {
        public owin_userpasswordresetinfoEntity Objowin_userpasswordresetinfo { get; }
        public string RemoteIpAddress { get; }

        public Owin_UserPasswordResetInfoRequest(owin_userpasswordresetinfoEntity objowin_userpasswordresetinfo)
        {
            Objowin_userpasswordresetinfo = objowin_userpasswordresetinfo;
        }
    }
}

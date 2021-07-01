using BDO.DataAccessObjects.SecurityModule;
using Web.Core.Frame.Interfaces;
using Web.Core.Frame.RequestResponse.UseCaseResponses;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Tran_LoginRequest : IUseCaseRequest<Tran_LoginResponse>
    {
        public tran_loginEntity Objtran_login { get; }
        public string RemoteIpAddress { get; }

        public Tran_LoginRequest(tran_loginEntity objtran_login)
        {
            Objtran_login = objtran_login;
        }
    }
}

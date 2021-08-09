using System.Threading.Tasks;
using Web.Core.Frame.RequestResponse.UseCaseRequests;
using Web.Core.Frame.RequestResponse.UseCaseResponses;

namespace Web.Core.Frame.Interfaces.UseCases
{
    public interface IAuth_UseCase : IUseCaseRequestHandler<Auth_Request, Auth_Response>
    {
        Task<bool> ForgetPasswordRequest(Auth_Request message, IOutputPort_Auth<Auth_Response> outputPort);

        Task<bool> PasswordRequestAuthTokenValidated(Auth_Request message, IOutputPort_Auth<Auth_Response> outputPort);
    }
}

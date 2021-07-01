using System.Threading.Tasks;
using Web.Core.Frame.RequestResponse.UseCaseRequests;
using Web.Core.Frame.RequestResponse.UseCaseResponses;

namespace Web.Core.Frame.Interfaces.UseCases
{
    public interface IOwin_UserUseCase : IUseCaseRequestHandler<Owin_UserRequest, Owin_UserResponse>
    {
        Task<bool> Save(Owin_UserRequest message, ICRUDRequestHandler<Owin_UserResponse> outputPort);

        Task<bool> Update(Owin_UserRequest message, ICRUDRequestHandler<Owin_UserResponse> outputPort);

        Task<bool> Delete(Owin_UserRequest message, ICRUDRequestHandler<Owin_UserResponse> outputPort);


        Task<bool> GetSingle(Owin_UserRequest message, ICRUDRequestHandler<Owin_UserResponse> outputPort);

        Task<bool> GetAll(Owin_UserRequest message, ICRUDRequestHandler<Owin_UserResponse> outputPort);


        Task<bool> GetAllPaged(Owin_UserRequest message, ICRUDRequestHandler<Owin_UserResponse> outputPort);

        Task<bool> GetListView(Owin_UserRequest message, ICRUDRequestHandler<Owin_UserResponse> outputPort);
    }
}

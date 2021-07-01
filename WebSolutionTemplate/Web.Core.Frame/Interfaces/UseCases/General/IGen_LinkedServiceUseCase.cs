using System.Threading.Tasks;
using Web.Core.Frame.RequestResponse.UseCaseRequests;
using Web.Core.Frame.RequestResponse.UseCaseResponses;

namespace Web.Core.Frame.Interfaces.UseCases
{
    public interface IGen_LinkedServiceUseCase : IUseCaseRequestHandler<Gen_LinkedServiceRequest, Gen_LinkedServiceResponse>
    {
        Task<bool> Save(Gen_LinkedServiceRequest message, ICRUDRequestHandler<Gen_LinkedServiceResponse> outputPort);

        Task<bool> Update(Gen_LinkedServiceRequest message, ICRUDRequestHandler<Gen_LinkedServiceResponse> outputPort);

        Task<bool> Delete(Gen_LinkedServiceRequest message, ICRUDRequestHandler<Gen_LinkedServiceResponse> outputPort);


        Task<bool> GetSingle(Gen_LinkedServiceRequest message, ICRUDRequestHandler<Gen_LinkedServiceResponse> outputPort);

        Task<bool> GetAll(Gen_LinkedServiceRequest message, ICRUDRequestHandler<Gen_LinkedServiceResponse> outputPort);


        Task<bool> GetAllPaged(Gen_LinkedServiceRequest message, ICRUDRequestHandler<Gen_LinkedServiceResponse> outputPort);

        Task<bool> GetListView(Gen_LinkedServiceRequest message, ICRUDRequestHandler<Gen_LinkedServiceResponse> outputPort);
    }
}

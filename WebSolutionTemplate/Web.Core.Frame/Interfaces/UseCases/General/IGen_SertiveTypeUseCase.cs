using System.Threading.Tasks;
using Web.Core.Frame.RequestResponse.UseCaseRequests;
using Web.Core.Frame.RequestResponse.UseCaseResponses;

namespace Web.Core.Frame.Interfaces.UseCases
{
    public interface IGen_SertiveTypeUseCase : IUseCaseRequestHandler<Gen_SertiveTypeRequest, Gen_SertiveTypeResponse>
    {
        Task<bool> Save(Gen_SertiveTypeRequest message, ICRUDRequestHandler<Gen_SertiveTypeResponse> outputPort);

        Task<bool> Update(Gen_SertiveTypeRequest message, ICRUDRequestHandler<Gen_SertiveTypeResponse> outputPort);

        Task<bool> Delete(Gen_SertiveTypeRequest message, ICRUDRequestHandler<Gen_SertiveTypeResponse> outputPort);


        Task<bool> GetSingle(Gen_SertiveTypeRequest message, ICRUDRequestHandler<Gen_SertiveTypeResponse> outputPort);

        Task<bool> GetAll(Gen_SertiveTypeRequest message, ICRUDRequestHandler<Gen_SertiveTypeResponse> outputPort);


        Task<bool> GetAllPaged(Gen_SertiveTypeRequest message, ICRUDRequestHandler<Gen_SertiveTypeResponse> outputPort);

        Task<bool> GetListView(Gen_SertiveTypeRequest message, ICRUDRequestHandler<Gen_SertiveTypeResponse> outputPort);
    }
}

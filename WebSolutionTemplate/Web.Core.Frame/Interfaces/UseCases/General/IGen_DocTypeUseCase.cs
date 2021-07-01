using System.Threading.Tasks;
using Web.Core.Frame.RequestResponse.UseCaseRequests;
using Web.Core.Frame.RequestResponse.UseCaseResponses;

namespace Web.Core.Frame.Interfaces.UseCases
{
    public interface IGen_DocTypeUseCase : IUseCaseRequestHandler<Gen_DocTypeRequest, Gen_DocTypeResponse>
    {
        Task<bool> Save(Gen_DocTypeRequest message, ICRUDRequestHandler<Gen_DocTypeResponse> outputPort);

        Task<bool> Update(Gen_DocTypeRequest message, ICRUDRequestHandler<Gen_DocTypeResponse> outputPort);

        Task<bool> Delete(Gen_DocTypeRequest message, ICRUDRequestHandler<Gen_DocTypeResponse> outputPort);


        Task<bool> GetSingle(Gen_DocTypeRequest message, ICRUDRequestHandler<Gen_DocTypeResponse> outputPort);

        Task<bool> GetAll(Gen_DocTypeRequest message, ICRUDRequestHandler<Gen_DocTypeResponse> outputPort);


        Task<bool> GetAllPaged(Gen_DocTypeRequest message, ICRUDRequestHandler<Gen_DocTypeResponse> outputPort);

        Task<bool> GetListView(Gen_DocTypeRequest message, ICRUDRequestHandler<Gen_DocTypeResponse> outputPort);
    }
}

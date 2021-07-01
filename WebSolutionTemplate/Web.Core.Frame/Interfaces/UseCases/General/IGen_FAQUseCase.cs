using System.Threading.Tasks;
using Web.Core.Frame.RequestResponse.UseCaseRequests;
using Web.Core.Frame.RequestResponse.UseCaseResponses;

namespace Web.Core.Frame.Interfaces.UseCases
{
    public interface IGen_FAQUseCase : IUseCaseRequestHandler<Gen_FAQRequest, Gen_FAQResponse>
    {
        Task<bool> Save(Gen_FAQRequest message, ICRUDRequestHandler<Gen_FAQResponse> outputPort);

        Task<bool> Update(Gen_FAQRequest message, ICRUDRequestHandler<Gen_FAQResponse> outputPort);

        Task<bool> Delete(Gen_FAQRequest message, ICRUDRequestHandler<Gen_FAQResponse> outputPort);


        Task<bool> GetSingle(Gen_FAQRequest message, ICRUDRequestHandler<Gen_FAQResponse> outputPort);

        Task<bool> GetAll(Gen_FAQRequest message, ICRUDRequestHandler<Gen_FAQResponse> outputPort);


        Task<bool> GetAllPaged(Gen_FAQRequest message, ICRUDRequestHandler<Gen_FAQResponse> outputPort);

        Task<bool> GetListView(Gen_FAQRequest message, ICRUDRequestHandler<Gen_FAQResponse> outputPort);
    }
}

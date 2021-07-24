using System.Threading.Tasks;
using Web.Core.Frame.RequestResponse.UseCaseRequests;
using Web.Core.Frame.RequestResponse.UseCaseResponses;

namespace Web.Core.Frame.Interfaces.UseCases
{
    public interface IGen_FAQCagetogyUseCase : IUseCaseRequestHandler<Gen_FAQCagetogyRequest, Gen_FAQCagetogyResponse>
    {
        Task<bool> Save(Gen_FAQCagetogyRequest message, ICRUDRequestHandler<Gen_FAQCagetogyResponse> outputPort);

        Task<bool> Update(Gen_FAQCagetogyRequest message, ICRUDRequestHandler<Gen_FAQCagetogyResponse> outputPort);

        Task<bool> Delete(Gen_FAQCagetogyRequest message, ICRUDRequestHandler<Gen_FAQCagetogyResponse> outputPort);


        Task<bool> GetSingle(Gen_FAQCagetogyRequest message, ICRUDRequestHandler<Gen_FAQCagetogyResponse> outputPort);

        Task<bool> GetAll(Gen_FAQCagetogyRequest message, ICRUDRequestHandler<Gen_FAQCagetogyResponse> outputPort);


        Task<bool> GetAllPaged(Gen_FAQCagetogyRequest message, ICRUDRequestHandler<Gen_FAQCagetogyResponse> outputPort);

        Task<bool> GetListView(Gen_FAQCagetogyRequest message, ICRUDRequestHandler<Gen_FAQCagetogyResponse> outputPort);
    }
}

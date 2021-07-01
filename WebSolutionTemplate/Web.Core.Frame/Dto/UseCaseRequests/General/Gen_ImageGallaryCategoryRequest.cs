using BDO.DataAccessObjects.Models;
using Web.Core.Frame.RequestResponse.UseCaseResponses;
using Web.Core.Frame.Interfaces;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Gen_ImageGallaryCategoryRequest : IUseCaseRequest<Gen_ImageGallaryCategoryResponse>
    {
        public gen_imagegallarycategoryEntity Objgen_imagegallarycategory { get; }
        public string RemoteIpAddress { get; }

        public Gen_ImageGallaryCategoryRequest(gen_imagegallarycategoryEntity objgen_imagegallarycategory)
        {
            Objgen_imagegallarycategory = objgen_imagegallarycategory;
        }
    }
}

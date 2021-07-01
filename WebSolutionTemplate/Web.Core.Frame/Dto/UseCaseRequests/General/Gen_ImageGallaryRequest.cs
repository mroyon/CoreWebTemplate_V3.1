using Web.Core.Frame.RequestResponse.UseCaseResponses;
using Web.Core.Frame.Interfaces;
using BDO.DataAccessObjects.Models;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Gen_ImageGallaryRequest : IUseCaseRequest<Gen_ImageGallaryResponse>
    {
        public gen_imagegallaryEntity Objgen_imagegallary { get; }
        public string RemoteIpAddress { get; }

        public Gen_ImageGallaryRequest(gen_imagegallaryEntity objgen_imagegallary)
        {
            Objgen_imagegallary = objgen_imagegallary;
        }
    }
}

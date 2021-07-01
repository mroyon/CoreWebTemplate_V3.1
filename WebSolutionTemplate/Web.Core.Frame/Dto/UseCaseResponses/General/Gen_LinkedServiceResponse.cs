using Web.Core.Frame.Dto;
using BDO.DataAccessObjects.Models;
using System.Collections.Generic;
using Web.Core.Frame.Interfaces;

namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Gen_LinkedServiceResponse : UseCaseResponseMessage
    {
        public gen_linkedserviceEntity _gen_LinkedService { get; }

        public IEnumerable<gen_linkedserviceEntity> _gen_LinkedServiceList { get; }

        public Error Errors { get; }


        public Gen_LinkedServiceResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Gen_LinkedServiceResponse(IEnumerable<gen_linkedserviceEntity> gen_LinkedServiceList, bool success = false, string message = null) : base(success, message)
        {
            _gen_LinkedServiceList = gen_LinkedServiceList;
        }
        
        public Gen_LinkedServiceResponse(gen_linkedserviceEntity gen_LinkedService, bool success = false, string message = null) : base(success, message)
        {
            _gen_LinkedService = gen_LinkedService;
        }
    }
}

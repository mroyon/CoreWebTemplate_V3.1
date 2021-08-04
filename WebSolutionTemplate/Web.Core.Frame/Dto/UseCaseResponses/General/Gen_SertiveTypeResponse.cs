using BDO.DataAccessObjects.Models;
using System.Collections.Generic;
using Web.Core.Frame.Dto;
using Web.Core.Frame.Interfaces;
using BDO.DataAccessObjects.ExtendedEntities;

namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Gen_SertiveTypeResponse : UseCaseResponseMessage
    {
        public gen_sertivetypeEntity _gen_SertiveType { get; }

        public IEnumerable<gen_sertivetypeEntity> _gen_SertiveTypeList { get; }

        public Error Errors { get; }


        public Gen_SertiveTypeResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Gen_SertiveTypeResponse(IEnumerable<gen_sertivetypeEntity> gen_SertiveTypeList, bool success = false, string message = null) : base(success, message)
        {
            _gen_SertiveTypeList = gen_SertiveTypeList;
        }
        
        public Gen_SertiveTypeResponse(gen_sertivetypeEntity gen_SertiveType, bool success = false, string message = null) : base(success, message)
        {
            _gen_SertiveType = gen_SertiveType;
        }
    }
}

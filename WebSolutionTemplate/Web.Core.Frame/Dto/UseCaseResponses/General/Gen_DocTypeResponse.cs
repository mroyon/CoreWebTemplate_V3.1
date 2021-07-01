using BDO.DataAccessObjects.Models;
using System.Collections.Generic;
using Web.Core.Frame.Dto;
using Web.Core.Frame.Interfaces;

namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Gen_DocTypeResponse : UseCaseResponseMessage
    {
        public gen_doctypeEntity _gen_DocType { get; }

        public IEnumerable<gen_doctypeEntity> _gen_DocTypeList { get; }

        public Error Errors { get; }


        public Gen_DocTypeResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Gen_DocTypeResponse(IEnumerable<gen_doctypeEntity> gen_DocTypeList, bool success = false, string message = null) : base(success, message)
        {
            _gen_DocTypeList = gen_DocTypeList;
        }
        
        public Gen_DocTypeResponse(gen_doctypeEntity gen_DocType, bool success = false, string message = null) : base(success, message)
        {
            _gen_DocType = gen_DocType;
        }
    }
}

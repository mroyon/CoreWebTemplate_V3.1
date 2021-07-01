using BDO.DataAccessObjects.SecurityModule;
using System.Collections.Generic;
using Web.Core.Frame.Dto;
using Web.Core.Frame.Interfaces;

namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Owin_FormActionResponse : UseCaseResponseMessage
    {
        public owin_formactionEntity _owin_FormAction { get; }

        public IEnumerable<owin_formactionEntity> _owin_FormActionList { get; }

        public Error Errors { get; }


        public Owin_FormActionResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Owin_FormActionResponse(IEnumerable<owin_formactionEntity> owin_FormActionList, bool success = false, string message = null) : base(success, message)
        {
            _owin_FormActionList = owin_FormActionList;
        }
        
        public Owin_FormActionResponse(owin_formactionEntity owin_FormAction, bool success = false, string message = null) : base(success, message)
        {
            _owin_FormAction = owin_FormAction;
        }
    }
}

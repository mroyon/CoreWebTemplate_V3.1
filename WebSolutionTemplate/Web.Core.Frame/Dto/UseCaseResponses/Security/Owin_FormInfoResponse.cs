using Web.Core.Frame.Dto;
using BDO.DataAccessObjects.SecurityModule;
using Web.Core.Frame.Interfaces;
using System.Collections.Generic;
using BDO.DataAccessObjects.ExtendedEntities;


namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Owin_FormInfoResponse : UseCaseResponseMessage
    {
        public owin_forminfoEntity _owin_FormInfo { get; }

        public IEnumerable<owin_forminfoEntity> _owin_FormInfoList { get; }

        public Error Errors { get; }


        public Owin_FormInfoResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Owin_FormInfoResponse(IEnumerable<owin_forminfoEntity> owin_FormInfoList, bool success = false, string message = null) : base(success, message)
        {
            _owin_FormInfoList = owin_FormInfoList;
        }
        
        public Owin_FormInfoResponse(owin_forminfoEntity owin_FormInfo, bool success = false, string message = null) : base(success, message)
        {
            _owin_FormInfo = owin_FormInfo;
        }
    }
}

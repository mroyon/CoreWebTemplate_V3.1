using Web.Core.Frame.Dto;
using BDO.DataAccessObjects.SecurityModule;
using Web.Core.Frame.Interfaces;
using System.Collections.Generic;


namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Owin_LastWorkingPageResponse : UseCaseResponseMessage
    {
        public owin_lastworkingpageEntity _owin_LastWorkingPage { get; }

        public IEnumerable<owin_lastworkingpageEntity> _owin_LastWorkingPageList { get; }

        public Error Errors { get; }


        public Owin_LastWorkingPageResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Owin_LastWorkingPageResponse(IEnumerable<owin_lastworkingpageEntity> owin_LastWorkingPageList, bool success = false, string message = null) : base(success, message)
        {
            _owin_LastWorkingPageList = owin_LastWorkingPageList;
        }
        
        public Owin_LastWorkingPageResponse(owin_lastworkingpageEntity owin_LastWorkingPage, bool success = false, string message = null) : base(success, message)
        {
            _owin_LastWorkingPage = owin_LastWorkingPage;
        }
    }
}

using Web.Core.Frame.Dto;
using BDO.DataAccessObjects.SecurityModule;
using Web.Core.Frame.Interfaces;
using System.Collections.Generic;


namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Owin_UserLoginTrailResponse : UseCaseResponseMessage
    {
        public owin_userlogintrailEntity _owin_UserLoginTrail { get; }

        public IEnumerable<owin_userlogintrailEntity> _owin_UserLoginTrailList { get; }

        public Error Errors { get; }


        public Owin_UserLoginTrailResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Owin_UserLoginTrailResponse(IEnumerable<owin_userlogintrailEntity> owin_UserLoginTrailList, bool success = false, string message = null) : base(success, message)
        {
            _owin_UserLoginTrailList = owin_UserLoginTrailList;
        }
        
        public Owin_UserLoginTrailResponse(owin_userlogintrailEntity owin_UserLoginTrail, bool success = false, string message = null) : base(success, message)
        {
            _owin_UserLoginTrail = owin_UserLoginTrail;
        }
    }
}

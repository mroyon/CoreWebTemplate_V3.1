using Web.Core.Frame.Dto;
using BDO.DataAccessObjects.SecurityModule;
using System.Collections.Generic;
using Web.Core.Frame.Interfaces;

namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Owin_UserResponse : UseCaseResponseMessage
    {
        public owin_userEntity _owin_User { get; }

        public IEnumerable<owin_userEntity> _owin_UserList { get; }

        public Error Errors { get; }


        public Owin_UserResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Owin_UserResponse(IEnumerable<owin_userEntity> owin_UserList, bool success = false, string message = null) : base(success, message)
        {
            _owin_UserList = owin_UserList;
        }
        
        public Owin_UserResponse(owin_userEntity owin_User, bool success = false, string message = null) : base(success, message)
        {
            _owin_User = owin_User;
        }
    }
}

using Web.Core.Frame.Dto;
using BDO.DataAccessObjects.SecurityModule;
using Web.Core.Frame.Interfaces;
using System.Collections.Generic;

using BDO.DataAccessObjects.ExtendedEntities;

namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Owin_UserRoleResponse : UseCaseResponseMessage
    {
        public owin_userroleEntity _owin_UserRole { get; }

        public IEnumerable<owin_userroleEntity> _owin_UserRoleList { get; }

        public Error Errors { get; }


        public Owin_UserRoleResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Owin_UserRoleResponse(IEnumerable<owin_userroleEntity> owin_UserRoleList, bool success = false, string message = null) : base(success, message)
        {
            _owin_UserRoleList = owin_UserRoleList;
        }
        
        public Owin_UserRoleResponse(owin_userroleEntity owin_UserRole, bool success = false, string message = null) : base(success, message)
        {
            _owin_UserRole = owin_UserRole;
        }
    }
}

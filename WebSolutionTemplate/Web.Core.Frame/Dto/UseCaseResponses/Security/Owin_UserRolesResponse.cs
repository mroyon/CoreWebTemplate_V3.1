using Web.Core.Frame.Dto;
using BDO.DataAccessObjects.SecurityModule;
using System.Collections.Generic;
using Web.Core.Frame.Interfaces;

namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Owin_UserRolesResponse : UseCaseResponseMessage
    {
        public owin_userrolesEntity _owin_UserRoles { get; }

        public IEnumerable<owin_userrolesEntity> _owin_UserRolesList { get; }

        public Error Errors { get; }


        public Owin_UserRolesResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Owin_UserRolesResponse(IEnumerable<owin_userrolesEntity> owin_UserRolesList, bool success = false, string message = null) : base(success, message)
        {
            _owin_UserRolesList = owin_UserRolesList;
        }
        
        public Owin_UserRolesResponse(owin_userrolesEntity owin_UserRoles, bool success = false, string message = null) : base(success, message)
        {
            _owin_UserRoles = owin_UserRoles;
        }
    }
}

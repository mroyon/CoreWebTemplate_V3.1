using Web.Core.Frame.Dto;
using BDO.DataAccessObjects.SecurityModule;
using Web.Core.Frame.Interfaces;
using System.Collections.Generic;


namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Owin_RoleResponse : UseCaseResponseMessage
    {
        public owin_roleEntity _owin_Role { get; }

        public IEnumerable<owin_roleEntity> _owin_RoleList { get; }

        public Error Errors { get; }


        public Owin_RoleResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Owin_RoleResponse(IEnumerable<owin_roleEntity> owin_RoleList, bool success = false, string message = null) : base(success, message)
        {
            _owin_RoleList = owin_RoleList;
        }
        
        public Owin_RoleResponse(owin_roleEntity owin_Role, bool success = false, string message = null) : base(success, message)
        {
            _owin_Role = owin_Role;
        }
    }
}

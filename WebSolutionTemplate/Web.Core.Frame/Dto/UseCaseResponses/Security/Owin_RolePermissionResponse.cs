using Web.Core.Frame.Dto;
using BDO.DataAccessObjects.SecurityModule;
using Web.Core.Frame.Interfaces;
using System.Collections.Generic;
using BDO.DataAccessObjects.ExtendedEntities;

namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Owin_RolePermissionResponse : UseCaseResponseMessage
    {
        public owin_rolepermissionEntity _owin_RolePermission { get; }

        public IEnumerable<owin_rolepermissionEntity> _owin_RolePermissionList { get; }

        public Error Errors { get; }


        public Owin_RolePermissionResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Owin_RolePermissionResponse(IEnumerable<owin_rolepermissionEntity> owin_RolePermissionList, bool success = false, string message = null) : base(success, message)
        {
            _owin_RolePermissionList = owin_RolePermissionList;
        }
        
        public Owin_RolePermissionResponse(owin_rolepermissionEntity owin_RolePermission, bool success = false, string message = null) : base(success, message)
        {
            _owin_RolePermission = owin_RolePermission;
        }
    }
}

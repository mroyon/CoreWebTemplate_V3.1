using Web.Core.Frame.Dto;
using BDO.DataAccessObjects.SecurityModule;
using Web.Core.Frame.Interfaces;
using System.Collections.Generic;
using BDO.DataAccessObjects.ExtendedEntities;


namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Owin_UserClaimsResponse : UseCaseResponseMessage
    {
        public owin_userclaimsEntity _owin_UserClaims { get; }

        public IEnumerable<owin_userclaimsEntity> _owin_UserClaimsList { get; }

        public Error Errors { get; }


        public Owin_UserClaimsResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Owin_UserClaimsResponse(IEnumerable<owin_userclaimsEntity> owin_UserClaimsList, bool success = false, string message = null) : base(success, message)
        {
            _owin_UserClaimsList = owin_UserClaimsList;
        }
        
        public Owin_UserClaimsResponse(owin_userclaimsEntity owin_UserClaims, bool success = false, string message = null) : base(success, message)
        {
            _owin_UserClaims = owin_UserClaims;
        }
    }
}

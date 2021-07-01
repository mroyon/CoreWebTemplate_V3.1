using Web.Core.Frame.Dto;
using BDO.DataAccessObjects.SecurityModule;
using System.Collections.Generic;
using Web.Core.Frame.Interfaces;

namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Owin_UserPasswordResetInfoResponse : UseCaseResponseMessage
    {
        public owin_userpasswordresetinfoEntity _owin_UserPasswordResetInfo { get; }

        public IEnumerable<owin_userpasswordresetinfoEntity> _owin_UserPasswordResetInfoList { get; }

        public Error Errors { get; }


        public Owin_UserPasswordResetInfoResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Owin_UserPasswordResetInfoResponse(IEnumerable<owin_userpasswordresetinfoEntity> owin_UserPasswordResetInfoList, bool success = false, string message = null) : base(success, message)
        {
            _owin_UserPasswordResetInfoList = owin_UserPasswordResetInfoList;
        }
        
        public Owin_UserPasswordResetInfoResponse(owin_userpasswordresetinfoEntity owin_UserPasswordResetInfo, bool success = false, string message = null) : base(success, message)
        {
            _owin_UserPasswordResetInfo = owin_UserPasswordResetInfo;
        }
    }
}

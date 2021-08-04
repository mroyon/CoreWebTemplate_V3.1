using Web.Core.Frame.Dto;
using BDO.DataAccessObjects.SecurityModule;
using Web.Core.Frame.Interfaces;
using System.Collections.Generic;
using BDO.DataAccessObjects.ExtendedEntities;


namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Owin_UserStatusChangeHistoryResponse : UseCaseResponseMessage
    {
        public owin_userstatuschangehistoryEntity _owin_UserStatusChangeHistory { get; }

        public IEnumerable<owin_userstatuschangehistoryEntity> _owin_UserStatusChangeHistoryList { get; }

        public Error Errors { get; }


        public Owin_UserStatusChangeHistoryResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Owin_UserStatusChangeHistoryResponse(IEnumerable<owin_userstatuschangehistoryEntity> owin_UserStatusChangeHistoryList, bool success = false, string message = null) : base(success, message)
        {
            _owin_UserStatusChangeHistoryList = owin_UserStatusChangeHistoryList;
        }
        
        public Owin_UserStatusChangeHistoryResponse(owin_userstatuschangehistoryEntity owin_UserStatusChangeHistory, bool success = false, string message = null) : base(success, message)
        {
            _owin_UserStatusChangeHistory = owin_UserStatusChangeHistory;
        }
    }
}

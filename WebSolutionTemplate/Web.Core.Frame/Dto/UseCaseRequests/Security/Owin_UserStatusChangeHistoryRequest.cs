﻿using Web.Core.Frame.RequestResponse.UseCaseResponses;
using Web.Core.Frame.Interfaces;
using BDO.DataAccessObjects.SecurityModule;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Owin_UserStatusChangeHistoryRequest : IUseCaseRequest<Owin_UserStatusChangeHistoryResponse>
    {
        public owin_userstatuschangehistoryEntity Objowin_userstatuschangehistory { get; }
        public string RemoteIpAddress { get; }

        public Owin_UserStatusChangeHistoryRequest(owin_userstatuschangehistoryEntity objowin_userstatuschangehistory)
        {
            Objowin_userstatuschangehistory = objowin_userstatuschangehistory;
        }
    }
}

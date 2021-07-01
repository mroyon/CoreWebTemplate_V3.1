﻿using Web.Core.Frame.RequestResponse.UseCaseResponses;
using Web.Core.Frame.Interfaces;
using BDO.DataAccessObjects.SecurityModule;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Owin_RoleRequest : IUseCaseRequest<Owin_RoleResponse>
    {
        public owin_roleEntity Objowin_role { get; }
        public string RemoteIpAddress { get; }

        public Owin_RoleRequest(owin_roleEntity objowin_role)
        {
            Objowin_role = objowin_role;
        }
    }
}

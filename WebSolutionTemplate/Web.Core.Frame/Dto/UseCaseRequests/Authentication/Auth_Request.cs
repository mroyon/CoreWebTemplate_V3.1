﻿using Web.Core.Frame.RequestResponse.UseCaseResponses;
using Web.Core.Frame.Interfaces;
using BDO.DataAccessObjects.SecurityModule;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Auth_Request : IUseCaseRequest<Auth_Response>
    {
        public owin_userEntity Obj_owin_user { get; }
        public string RemoteIpAddress { get; }

        public Auth_Request(owin_userEntity obj_owin_user)
        {
            Obj_owin_user = obj_owin_user;
        }
    }
}

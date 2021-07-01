﻿using BDO.DataAccessObjects.ExtendedEntities;
using System.Net;
using Web.Core.Frame.Dto;

namespace Web.Api.Infrastructure.Helpers
{
    public static class httpStatusCodeParser
    {
        public static HttpStatusCode SetHttpStatusCode(Error error)
        {
            switch (error.Code)
            {
                case "401": return HttpStatusCode.Unauthorized;
                case "500": return HttpStatusCode.InternalServerError;
                case "404": return HttpStatusCode.NotFound;
                default: return HttpStatusCode.OK;
            }
        }
    }
}

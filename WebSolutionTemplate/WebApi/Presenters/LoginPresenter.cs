﻿using System.Net;
using Web.Core.Frame.Interfaces;
using Web.Core.Frame.Dto.UseCaseResponses;
using Web.Api.Infrastructure.Serialization;

namespace WebApi.Presenters
{
    /// <summary>
    /// 
    /// </summary>
    public sealed class LoginPresenter : IOutputPort<LoginResponse>
    {
        public JsonContentResult ContentResult { get; }

        public LoginPresenter()
        {
            ContentResult = new JsonContentResult();
        }

        public void Handle(LoginResponse response)
        {
            ContentResult.StatusCode = (int)(response.Success ? HttpStatusCode.OK : HttpStatusCode.Unauthorized);
            ContentResult.Content = response.Success ? JsonSerializer.SerializeObject(new LoginResponse(response.AccessToken, response.RefreshToken)) : JsonSerializer.SerializeObject(response.Errors);
        }
    }
}

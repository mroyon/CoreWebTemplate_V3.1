

using Web.Core.Frame.Dto;

namespace WebApi.Models.Response
{
    public class LoginResponse
    {
        public AccessToken AccessToken { get; }
        public string RefreshToken { get; }

        public LoginResponse(AccessToken accessToken, string refreshToken)
        {
            AccessToken = accessToken;
            RefreshToken = refreshToken;
        }
    }
}

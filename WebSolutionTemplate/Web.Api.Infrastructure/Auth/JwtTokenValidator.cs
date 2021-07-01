using System.Security.Claims;
using System.Text;
using Microsoft.IdentityModel.Tokens;
using Web.Core.Frame.Interfaces.Services;
using Web.Api.Infrastructure.Interfaces;
using Microsoft.Extensions.Configuration;
using BDO.DataAccessObjects.ExtendedEntities;

namespace Web.Api.Infrastructure.Auth
{
    internal sealed class JwtTokenValidator : IJwtTokenValidator
    {
        private readonly IJwtTokenHandler _jwtTokenHandler;
        private readonly IConfiguration _config;

        internal JwtTokenValidator(IJwtTokenHandler jwtTokenHandler, IConfiguration config)
        {
            _jwtTokenHandler = jwtTokenHandler;
            _config = config;
        }

        public ClaimsPrincipal GetPrincipalFromToken(string token)
        {
            var authSettings = _config.GetSection(nameof(AuthSettings)).Get<AuthSettings>();
            var signingKey = new Microsoft.IdentityModel.Tokens.SymmetricSecurityKey(Encoding.ASCII.GetBytes(authSettings.SecretKey));
            var jwtIssuerOptions = _config.GetSection(nameof(JwtIssuerOptions)).Get<JwtIssuerOptions>();


            return _jwtTokenHandler.ValidateToken(token, new TokenValidationParameters
            {
                ValidateIssuer = true,
                ValidIssuer = jwtIssuerOptions.Issuer,

                ValidateAudience = true,
                ValidAudience = jwtIssuerOptions.Audience,

                ValidateIssuerSigningKey = true,
                IssuerSigningKey = signingKey,

                //RequireExpirationTime = true,
                ValidateLifetime = true
            });
        }

        public System.DateTime? GetValidFromTimeFromToken(string token)
        {
            var authSettings = _config.GetSection(nameof(AuthSettings)).Get<AuthSettings>();
            var signingKey = new Microsoft.IdentityModel.Tokens.SymmetricSecurityKey(Encoding.ASCII.GetBytes(authSettings.SecretKey));
            var jwtIssuerOptions = _config.GetSection(nameof(JwtIssuerOptions)).Get<JwtIssuerOptions>();


            return _jwtTokenHandler.tokenValidFromTime(token, new TokenValidationParameters
            {
                ValidateIssuer = true,
                ValidIssuer = jwtIssuerOptions.Issuer,

                ValidateAudience = true,
                ValidAudience = jwtIssuerOptions.Audience,

                ValidateIssuerSigningKey = true,
                IssuerSigningKey = signingKey,

                //RequireExpirationTime = true,
                ValidateLifetime = true
            });
        }

        public System.DateTime? GetValidToTimeFromToken(string token)
        {
            var authSettings = _config.GetSection(nameof(AuthSettings)).Get<AuthSettings>();
            var signingKey = new Microsoft.IdentityModel.Tokens.SymmetricSecurityKey(Encoding.ASCII.GetBytes(authSettings.SecretKey));
            var jwtIssuerOptions = _config.GetSection(nameof(JwtIssuerOptions)).Get<JwtIssuerOptions>();


            return _jwtTokenHandler.tokenValidToTime(token, new TokenValidationParameters
            {
                ValidateIssuer = true,
                ValidIssuer = jwtIssuerOptions.Issuer,

                ValidateAudience = true,
                ValidAudience = jwtIssuerOptions.Audience,

                ValidateIssuerSigningKey = true,
                IssuerSigningKey = signingKey,

                //RequireExpirationTime = true,
                ValidateLifetime = true
            });
        }
    }
}

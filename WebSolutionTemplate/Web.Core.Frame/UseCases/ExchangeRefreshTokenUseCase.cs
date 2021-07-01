using BDO.DataAccessObjects.SecurityModule;
using CLL.Localization;
using Microsoft.Extensions.Localization;
using Microsoft.Extensions.Logging;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using Web.Core.Frame.CustomIdentityManagers;
using Web.Core.Frame.Dto.UseCaseRequests;
using Web.Core.Frame.Dto.UseCaseResponses;
using Web.Core.Frame.Interfaces;
using Web.Core.Frame.Interfaces.Gateways.Repositories;
using Web.Core.Frame.Interfaces.Services;
using Web.Core.Frame.Interfaces.UseCases;
using Web.Core.Frame.Specifications;


namespace Web.Core.Frame.UseCases
{
    public sealed class ExchangeRefreshTokenUseCase : IExchangeRefreshTokenUseCase
    {
        private readonly IJwtTokenValidator _jwtTokenValidator;
        private readonly ApplicationUserManager<owin_userEntity> _userManager;
        private readonly ILogger<ExchangeRefreshTokenUseCase> _logger;
        private readonly IStringLocalizer _sharedLocalizer;
        private readonly IJwtFactory _jwtFactory;
        private readonly IHttpClientHR _ihttpclienthr;


        public ExchangeRefreshTokenUseCase(
            IJwtTokenValidator jwtTokenValidator,
            ApplicationUserManager<owin_userEntity> userManager,
            IJwtFactory jwtFactory
            , IHttpClientHR ihttpclienthr, IStringLocalizerFactory factory,
            ILoggerFactory loggerFactory)
        {
            _jwtTokenValidator = jwtTokenValidator;
            _userManager = userManager;
            _jwtFactory = jwtFactory;
            _ihttpclienthr = ihttpclienthr;
            _logger = loggerFactory.CreateLogger<ExchangeRefreshTokenUseCase>();
            var type = typeof(SharedResource);
            var assemblyName = new AssemblyName(type.GetTypeInfo().Assembly.FullName);
            _sharedLocalizer = factory.Create("SharedResource", assemblyName.Name);
        }

        public async Task<bool> Handle(ExchangeRefreshTokenRequest message, IOutputPort<ExchangeRefreshTokenResponse> outputPort)
        {
            var cp = _jwtTokenValidator.GetPrincipalFromToken(message.AccessToken);
            // invalid token/signing key was passed and we can't extract user claims
            if (cp != null)
            {
                var id = cp.Claims.First(c => c.Type == "id").Value;
                var username = cp.Claims.First(c => c.Type == "CreatedByUserName").Value;

                //var username = cp.Claims.First(c => c.Type == "CreatedByUserName").Value;

                owin_userEntity user = new owin_userEntity();
                user.userid = new System.Guid(id.ToString());
                user.username = username;
                user._refreshTokens = _userManager.LoadAsyncRefreshToken(user).Result;

                //user._RefreshTokens = message.RefreshToken;

                if (user.HasValidRefreshToken(message.RefreshToken))
                {
                    var jwtToken = await _jwtFactory.GenerateEncodedToken(user.userid.ToString(), user.username);
                    var refreshToken = _jwtFactory.GenerateToken();
                    user.RemoveRefreshToken(message.RefreshToken); // delete the token we've exchanged
                    user.AddRefreshToken(refreshToken, user.userid.GetValueOrDefault(), message.RemoteIPAddress); // add the new one

                    await _userManager.SaveLoginTrain(jwtToken, refreshToken, message.RemoteIPAddress, user);

                    //await _userManager.UpdateAsync(user);

                    outputPort.Handle(new ExchangeRefreshTokenResponse(jwtToken, refreshToken, true));
                    return true;
                }
            }
            outputPort.Handle(new ExchangeRefreshTokenResponse(false, "Invalid token."));
            return false;
        }
    }
}

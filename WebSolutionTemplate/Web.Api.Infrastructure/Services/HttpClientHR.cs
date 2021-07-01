using BDO.DataAccessObjects.CommonEntities;
using BDO.DataAccessObjects.ExtendedEntities;
using Microsoft.Extensions.Configuration;
using System;
using System.Net.Http;
using System.Threading.Tasks;
using Web.Core.Frame.Interfaces.Services;

namespace Web.Api.Infrastructure.Services
{

    internal sealed class HttpClientHR : IHttpClientHR
    {
        private readonly IConfiguration _config;
        private readonly HttpClient _client;
        private IHttpClientFactory _IHttpClienFactory;


        internal HttpClientHR(IConfiguration config
            ,IHttpClientFactory IHttpClienFactory
            )
        {
            _config = config;
            _IHttpClienFactory = IHttpClienFactory;

            var _hrwebapiconnectionsettings = _config.GetSection(nameof(hrwebapiconnectionsettings)).Get<hrwebapiconnectionsettings>();
            string username = _hrwebapiconnectionsettings.username;
            string password = _hrwebapiconnectionsettings.password;
            
            HttpClient client = _IHttpClienFactory.CreateClient();
            client.BaseAddress = new Uri(_hrwebapiconnectionsettings.DefaultConnection);
            client.DefaultRequestHeaders.Add("Accept", "application/vnd.github.v3+json");
            client.DefaultRequestHeaders.Add("User-Agent", "CoreCors");
            _client = client;
        }

        public async Task<string> CheckUserExists(string adUserAccountName)
        {
            var ss = await _client.GetStringAsync("weatherforecast");
            return ss;
        }


    }
}

﻿using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;


namespace WebAdmin.Services
{
    /// <summary>
    /// RedisCacheInstaller
    /// </summary>
    public class RedisCacheInstaller : IInstaller
    {
        /// <summary>
        /// InstallServices
        /// </summary>
        /// <param name="services"></param>
        /// <param name="configuration"></param>
        public void InstallServices(IServiceCollection services, IConfiguration configuration)
        {
            //var conStr = configuration["RedisConnectionStrings:RedisCache"];
            //services.AddRedisCacheOutput(conStr);
        }
    }
}

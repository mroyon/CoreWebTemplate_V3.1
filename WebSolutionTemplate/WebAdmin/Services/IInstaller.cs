

using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace WebAdmin.Services
{
    /// <summary>
    /// IInstaller
    /// </summary>
    public interface IInstaller
    {
        /// <summary>
        /// InstallServices
        /// </summary>
        /// <param name="services"></param>
        /// <param name="configuration"></param>
        void InstallServices(IServiceCollection services, IConfiguration configuration);
    }
}

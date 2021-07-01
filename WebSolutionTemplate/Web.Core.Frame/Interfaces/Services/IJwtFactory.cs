using BDO.DataAccessObjects.ExtendedEntities;
using System.Threading.Tasks;
using Web.Core.Frame.Dto;

namespace Web.Core.Frame.Interfaces.Services
{
    public interface IJwtFactory
    {
        Task<AccessToken> GenerateEncodedToken(string id, string userName);
        string GenerateToken(int size = 32);
    }
}

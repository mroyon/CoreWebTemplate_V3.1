using Microsoft.IdentityModel.Tokens;
using System.Text;

namespace WebAdmin.Providers
{
    /// <summary>
    /// JWTSigningConfigurations
    /// </summary>
    public class JWTSigningConfigurations
    {
        /// <summary>
        /// SecurityKey
        /// </summary>
        public SecurityKey SecurityKey { get; }
        /// <summary>
        /// SigningCredentials
        /// </summary>
        public SigningCredentials SigningCredentials { get; }

        /// <summary>
        /// JWTSigningConfigurations
        /// </summary>
        /// <param name="key"></param>
        public JWTSigningConfigurations(string key)
        {
            var keyBytes = Encoding.ASCII.GetBytes(key);

            SecurityKey = new SymmetricSecurityKey(keyBytes);
            SigningCredentials = new SigningCredentials(SecurityKey, SecurityAlgorithms.HmacSha256Signature);

        }
    }
}

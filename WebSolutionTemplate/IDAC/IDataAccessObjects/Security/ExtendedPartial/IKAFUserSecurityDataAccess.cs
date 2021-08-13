using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using BDO.DataAccessObjects.SecurityModule;

namespace IDAC.Core.IDataAccessObjects.Security.ExtendedPartial
{
    public interface IKAFUserSecurityDataAccess
    {

        #region Identity Service Implementation
        Task<owin_userEntity> GetUserByUserName(owin_userEntity objEntity, CancellationToken cancellationToken);

        Task<owin_userEntity> GetUserByParams(owin_userEntity objEntity, CancellationToken cancellationToken);

        Task<owin_userEntity> UserSignInAsync(owin_userEntity objEntity, CancellationToken cancellationToken);
        Task<long> UserSignInLogUpdateAsync(owin_userEntity objEntity, CancellationToken cancellationToken);

        Task<long> UserResetPasswordAsync(owin_userEntity objEntity, CancellationToken cancellationToken);

        Task<long> UserEmailAddressConfirmed(owin_userEntity objEntity, CancellationToken cancellationToken);

        Task<long> UserPhoneNumberConfirmed(owin_userEntity objEntity, CancellationToken cancellationToken);

        Task<IList<owin_userEntity>> GetUsersInRoleAsync(owin_userEntity objEntity, CancellationToken cancellationToken);
        Task<long> RemoveFromRoleAsync(owin_userEntity user, owin_roleEntity role, CancellationToken cancellationToken);
        Task<long> SetEmailAsync(owin_userEntity user, CancellationToken cancellationToken);


        Task<long?> ForgetPasswordRequest(owin_userpasswordresetinfoEntity user, CancellationToken cancellationToken);

        Task<owin_userEntity> ChangePasswordRequest(owin_userEntity user, CancellationToken cancellationToken);


        #endregion Identity Service Implementation

    }
}

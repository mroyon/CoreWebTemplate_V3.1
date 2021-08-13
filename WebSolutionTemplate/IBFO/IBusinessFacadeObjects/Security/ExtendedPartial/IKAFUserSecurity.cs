using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.Threading;
using System.Threading.Tasks;
using BDO.DataAccessObjects.SecurityModule;

namespace IBFO.Core.IBusinessFacadeObjects.Security.ExtendedPartial
{
    [ServiceContract(Name = "IKAFUserSecurity")]
    public interface IKAFUserSecurity : IDisposable
    {



        #region Identity Service Implementation


        [OperationContract]
        Task<owin_userEntity> GetUserByParams(owin_userEntity objEntity, CancellationToken cancellationToken);
        [OperationContract]
        Task<owin_userEntity> UserSignInAsync(owin_userEntity objEntity, CancellationToken cancellationToken);
        [OperationContract]
        Task<long> UserSignInLogUpdateAsync(owin_userEntity objEntity, CancellationToken cancellationToken);
        [OperationContract]
        Task<long> UserResetPasswordAsync(owin_userEntity objEntity, CancellationToken cancellationToken);
        [OperationContract]
        Task<long> UserEmailAddressConfirmed(owin_userEntity objEntity, CancellationToken cancellationToken);
        [OperationContract]
        Task<long> UserPhoneNumberConfirmed(owin_userEntity objEntity, CancellationToken cancellationToken);

        [OperationContract]
        Task<IList<owin_userEntity>> GetUsersInRoleAsync(owin_userEntity objEntity, CancellationToken cancellationToken);


        [OperationContract]
        Task<long> RemoveFromRoleAsync(owin_userEntity user, owin_roleEntity role, CancellationToken cancellationToken);

        [OperationContract]
        Task<long> SetEmailAsync(owin_userEntity user, CancellationToken cancellationToken);

        [OperationContract]
        Task<string> ForgetPasswordRequest(owin_userEntity user, CancellationToken cancellationToken);

        [OperationContract]
        Task<owin_userEntity> ChangePasswordRequest(owin_userEntity user, CancellationToken cancellationToken);

        #endregion Identity Service Implementation


    }
}

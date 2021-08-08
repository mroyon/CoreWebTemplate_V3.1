using Autofac;
using BDO.DataAccessObjects.SecurityModule;
using Web.Core.Frame.Interfaces.UseCases;
using Web.Core.Frame.Presenters;
using Web.Core.Frame.UseCases;

namespace Web.Core.Frame
{
    public partial class CorePresenter : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<Auth_Presenter>().InstancePerLifetimeScope();

            builder.RegisterType<Gen_FAQCagetogyPresenter>().InstancePerLifetimeScope();
            builder.RegisterType<Gen_FaqPresenter>().InstancePerLifetimeScope();
            builder.RegisterType<Gen_ImageGallaryCategoryPresenter>().InstancePerLifetimeScope();
            builder.RegisterType<Gen_ImageGallaryPresenter>().InstancePerLifetimeScope();
            builder.RegisterType<Gen_SertiveTypePresenter>().InstancePerLifetimeScope();
            builder.RegisterType<Gen_ServicesPresenter>().InstancePerLifetimeScope();

            builder.RegisterType<Owin_FormActionPresenter>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_FormInfoPresenter>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_LastWorkingPagePresenter>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_RolePermissionPresenter>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_RolePresenter>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_UserClaimsPresenter>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_UserLoginTrailPresenter>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_UserPasswordResetInfoPresenter>().InstancePerLifetimeScope();

            builder.RegisterType<Owin_UserPrefferencesSettingsPresenter>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_UserPresenter>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_UserRolePresenter>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_UserRolesPresenter>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_UserStatusChangeHistoryPresenter>().InstancePerLifetimeScope();
            builder.RegisterType<ExchangeRefreshTokenPresenter>().InstancePerLifetimeScope();
            builder.RegisterType<LoginPresenter>().InstancePerLifetimeScope();
            builder.RegisterType<RegisterUserPresenter>().InstancePerLifetimeScope();
        }
    }
}

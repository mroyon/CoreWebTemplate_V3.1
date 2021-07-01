using Autofac;
using Web.Core.Frame.Interfaces.UseCases;
using Web.Core.Frame.UseCases;

namespace Web.Core.Frame
{
    public partial class CoreModuleExtended : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<Gen_DocTypeUseCase>().As<IGen_DocTypeUseCase>().InstancePerLifetimeScope();
            builder.RegisterType<Gen_FAQUseCase>().As<IGen_FAQUseCase>().InstancePerLifetimeScope();
            builder.RegisterType<Gen_FAQCategoryUseCase>().As<IGen_FAQCategoryUseCase>().InstancePerLifetimeScope();
            builder.RegisterType<Gen_ImageGallaryUseCase>().As<IGen_ImageGallaryUseCase>().InstancePerLifetimeScope();
            builder.RegisterType<Gen_ImageGallaryCategoryUseCase>().As<IGen_ImageGallaryCategoryUseCase>().InstancePerLifetimeScope();
            builder.RegisterType<Gen_LinkedServiceUseCase>().As<IGen_LinkedServiceUseCase>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_FormActionUseCase>().As<IOwin_FormActionUseCase>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_FormInfoUseCase>().As<IOwin_FormInfoUseCase>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_LastWorkingPageUseCase>().As<IOwin_LastWorkingPageUseCase>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_RoleUseCase>().As<IOwin_RoleUseCase>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_RolePermissionUseCase>().As<IOwin_RolePermissionUseCase>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_UserUseCase>().As<IOwin_UserUseCase>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_UserClaimsUseCase>().As<IOwin_UserClaimsUseCase>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_UserLoginTrailUseCase>().As<IOwin_UserLoginTrailUseCase>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_UserPasswordResetInfoUseCase>().As<IOwin_UserPasswordResetInfoUseCase>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_UserPrefferencesSettingsUseCase>().As<IOwin_UserPrefferencesSettingsUseCase>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_UserRoleUseCase>().As<IOwin_UserRoleUseCase>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_UserRolesUseCase>().As<IOwin_UserRolesUseCase>().InstancePerLifetimeScope();
            builder.RegisterType<Owin_UserStatusChangeHistoryUseCase>().As<IOwin_UserStatusChangeHistoryUseCase>().InstancePerLifetimeScope();
            builder.RegisterType<Tran_LoginUseCase>().As<ITran_LoginUseCase>().InstancePerLifetimeScope();

        }
    }
}
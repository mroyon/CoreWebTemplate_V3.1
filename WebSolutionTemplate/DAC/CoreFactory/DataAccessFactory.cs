using AppConfig.ConfigDAAC;
using DAC.Core.DataAccessObjects.General;
using DAC.Core.DataAccessObjects.Security;
using DAC.Core.DataAccessObjects.Security.ExtendedPartial;
using IDAC.Core.IDataAccessObjects.General;
using IDAC.Core.IDataAccessObjects.Security;
using IDAC.Core.IDataAccessObjects.Security.ExtendedPartial;
using System.Diagnostics;

namespace DAC.Core.CoreFactory
{
    [DebuggerStepThrough()]
    public partial class DataAccessFactory : BaseDataAccessFactory
    {
        #region Constructer
        public DataAccessFactory(Context context)
            : base(context)
        {
        }

        public DataAccessFactory()
            : base()
        {
        }
		#endregion

		#region Factory Methods 


        #endregion Factory Methods 

        #region Extended 
        #region SecKAFUserSecurityDataAccess
        [DebuggerStepThrough()]
        public override IKAFUserSecurityDataAccess CreateKAFUserSecurityDataAccess()
        {
            string type = typeof(KAFUserSecurityDataAccess).ToString();
            if (!CurrentContext.Contains(type))
            {
                CurrentContext[type] = new KAFUserSecurityDataAccess(CurrentContext);
            }
            return (IKAFUserSecurityDataAccess)CurrentContext[type];
        }
		#endregion SecKAFUserSecurityDataAccess
		#endregion

		#region Factory Methods 


		#region gen_faq
		[DebuggerStepThrough()]
		public override Igen_faqDataAccessObjects Creategen_faqDataAccess()
		{
			string type = typeof(gen_faqDataAccessObjects).ToString();
			if (!CurrentContext.Contains(type))
			{
				CurrentContext[type] = new gen_faqDataAccessObjects(CurrentContext);
			}
			return (Igen_faqDataAccessObjects)CurrentContext[type];
		}
		#endregion gen_faq


		#region gen_faqcagetogy
		[DebuggerStepThrough()]
		public override Igen_faqcagetogyDataAccessObjects Creategen_faqcagetogyDataAccess()
		{
			string type = typeof(gen_faqcagetogyDataAccessObjects).ToString();
			if (!CurrentContext.Contains(type))
			{
				CurrentContext[type] = new gen_faqcagetogyDataAccessObjects(CurrentContext);
			}
			return (Igen_faqcagetogyDataAccessObjects)CurrentContext[type];
		}
		#endregion gen_faqcagetogy


		#region gen_imagegallary
		[DebuggerStepThrough()]
		public override Igen_imagegallaryDataAccessObjects Creategen_imagegallaryDataAccess()
		{
			string type = typeof(gen_imagegallaryDataAccessObjects).ToString();
			if (!CurrentContext.Contains(type))
			{
				CurrentContext[type] = new gen_imagegallaryDataAccessObjects(CurrentContext);
			}
			return (Igen_imagegallaryDataAccessObjects)CurrentContext[type];
		}
		#endregion gen_imagegallary


		#region gen_imagegallarycategory
		[DebuggerStepThrough()]
		public override Igen_imagegallarycategoryDataAccessObjects Creategen_imagegallarycategoryDataAccess()
		{
			string type = typeof(gen_imagegallarycategoryDataAccessObjects).ToString();
			if (!CurrentContext.Contains(type))
			{
				CurrentContext[type] = new gen_imagegallarycategoryDataAccessObjects(CurrentContext);
			}
			return (Igen_imagegallarycategoryDataAccessObjects)CurrentContext[type];
		}
		#endregion gen_imagegallarycategory


		#region gen_sertivetype
		[DebuggerStepThrough()]
		public override Igen_sertivetypeDataAccessObjects Creategen_sertivetypeDataAccess()
		{
			string type = typeof(gen_sertivetypeDataAccessObjects).ToString();
			if (!CurrentContext.Contains(type))
			{
				CurrentContext[type] = new gen_sertivetypeDataAccessObjects(CurrentContext);
			}
			return (Igen_sertivetypeDataAccessObjects)CurrentContext[type];
		}
		#endregion gen_sertivetype


		#region gen_services
		[DebuggerStepThrough()]
		public override Igen_servicesDataAccessObjects Creategen_servicesDataAccess()
		{
			string type = typeof(gen_servicesDataAccessObjects).ToString();
			if (!CurrentContext.Contains(type))
			{
				CurrentContext[type] = new gen_servicesDataAccessObjects(CurrentContext);
			}
			return (Igen_servicesDataAccessObjects)CurrentContext[type];
		}
		#endregion gen_services


		#region owin_formaction
		[DebuggerStepThrough()]
		public override Iowin_formactionDataAccessObjects Createowin_formactionDataAccess()
		{
			string type = typeof(owin_formactionDataAccessObjects).ToString();
			if (!CurrentContext.Contains(type))
			{
				CurrentContext[type] = new owin_formactionDataAccessObjects(CurrentContext);
			}
			return (Iowin_formactionDataAccessObjects)CurrentContext[type];
		}
		#endregion owin_formaction


		#region owin_forminfo
		[DebuggerStepThrough()]
		public override Iowin_forminfoDataAccessObjects Createowin_forminfoDataAccess()
		{
			string type = typeof(owin_forminfoDataAccessObjects).ToString();
			if (!CurrentContext.Contains(type))
			{
				CurrentContext[type] = new owin_forminfoDataAccessObjects(CurrentContext);
			}
			return (Iowin_forminfoDataAccessObjects)CurrentContext[type];
		}
		#endregion owin_forminfo


		#region owin_lastworkingpage
		[DebuggerStepThrough()]
		public override Iowin_lastworkingpageDataAccessObjects Createowin_lastworkingpageDataAccess()
		{
			string type = typeof(owin_lastworkingpageDataAccessObjects).ToString();
			if (!CurrentContext.Contains(type))
			{
				CurrentContext[type] = new owin_lastworkingpageDataAccessObjects(CurrentContext);
			}
			return (Iowin_lastworkingpageDataAccessObjects)CurrentContext[type];
		}
		#endregion owin_lastworkingpage


		#region owin_role
		[DebuggerStepThrough()]
		public override Iowin_roleDataAccessObjects Createowin_roleDataAccess()
		{
			string type = typeof(owin_roleDataAccessObjects).ToString();
			if (!CurrentContext.Contains(type))
			{
				CurrentContext[type] = new owin_roleDataAccessObjects(CurrentContext);
			}
			return (Iowin_roleDataAccessObjects)CurrentContext[type];
		}
		#endregion owin_role


		#region owin_rolepermission
		[DebuggerStepThrough()]
		public override Iowin_rolepermissionDataAccessObjects Createowin_rolepermissionDataAccess()
		{
			string type = typeof(owin_rolepermissionDataAccessObjects).ToString();
			if (!CurrentContext.Contains(type))
			{
				CurrentContext[type] = new owin_rolepermissionDataAccessObjects(CurrentContext);
			}
			return (Iowin_rolepermissionDataAccessObjects)CurrentContext[type];
		}
		#endregion owin_rolepermission


		#region owin_user
		[DebuggerStepThrough()]
		public override Iowin_userDataAccessObjects Createowin_userDataAccess()
		{
			string type = typeof(owin_userDataAccessObjects).ToString();
			if (!CurrentContext.Contains(type))
			{
				CurrentContext[type] = new owin_userDataAccessObjects(CurrentContext);
			}
			return (Iowin_userDataAccessObjects)CurrentContext[type];
		}
		#endregion owin_user


		#region owin_userclaims
		[DebuggerStepThrough()]
		public override Iowin_userclaimsDataAccessObjects Createowin_userclaimsDataAccess()
		{
			string type = typeof(owin_userclaimsDataAccessObjects).ToString();
			if (!CurrentContext.Contains(type))
			{
				CurrentContext[type] = new owin_userclaimsDataAccessObjects(CurrentContext);
			}
			return (Iowin_userclaimsDataAccessObjects)CurrentContext[type];
		}
		#endregion owin_userclaims


		#region owin_userlogintrail
		[DebuggerStepThrough()]
		public override Iowin_userlogintrailDataAccessObjects Createowin_userlogintrailDataAccess()
		{
			string type = typeof(owin_userlogintrailDataAccessObjects).ToString();
			if (!CurrentContext.Contains(type))
			{
				CurrentContext[type] = new owin_userlogintrailDataAccessObjects(CurrentContext);
			}
			return (Iowin_userlogintrailDataAccessObjects)CurrentContext[type];
		}
		#endregion owin_userlogintrail


		#region owin_userpasswordresetinfo
		[DebuggerStepThrough()]
		public override Iowin_userpasswordresetinfoDataAccessObjects Createowin_userpasswordresetinfoDataAccess()
		{
			string type = typeof(owin_userpasswordresetinfoDataAccessObjects).ToString();
			if (!CurrentContext.Contains(type))
			{
				CurrentContext[type] = new owin_userpasswordresetinfoDataAccessObjects(CurrentContext);
			}
			return (Iowin_userpasswordresetinfoDataAccessObjects)CurrentContext[type];
		}
		#endregion owin_userpasswordresetinfo


		#region owin_userprefferencessettings
		[DebuggerStepThrough()]
		public override Iowin_userprefferencessettingsDataAccessObjects Createowin_userprefferencessettingsDataAccess()
		{
			string type = typeof(owin_userprefferencessettingsDataAccessObjects).ToString();
			if (!CurrentContext.Contains(type))
			{
				CurrentContext[type] = new owin_userprefferencessettingsDataAccessObjects(CurrentContext);
			}
			return (Iowin_userprefferencessettingsDataAccessObjects)CurrentContext[type];
		}
		#endregion owin_userprefferencessettings


		#region owin_userrole
		[DebuggerStepThrough()]
		public override Iowin_userroleDataAccessObjects Createowin_userroleDataAccess()
		{
			string type = typeof(owin_userroleDataAccessObjects).ToString();
			if (!CurrentContext.Contains(type))
			{
				CurrentContext[type] = new owin_userroleDataAccessObjects(CurrentContext);
			}
			return (Iowin_userroleDataAccessObjects)CurrentContext[type];
		}
		#endregion owin_userrole


		#region owin_userroles
		[DebuggerStepThrough()]
		public override Iowin_userrolesDataAccessObjects Createowin_userrolesDataAccess()
		{
			string type = typeof(owin_userrolesDataAccessObjects).ToString();
			if (!CurrentContext.Contains(type))
			{
				CurrentContext[type] = new owin_userrolesDataAccessObjects(CurrentContext);
			}
			return (Iowin_userrolesDataAccessObjects)CurrentContext[type];
		}
		#endregion owin_userroles


		#region owin_userstatuschangehistory
		[DebuggerStepThrough()]
		public override Iowin_userstatuschangehistoryDataAccessObjects Createowin_userstatuschangehistoryDataAccess()
		{
			string type = typeof(owin_userstatuschangehistoryDataAccessObjects).ToString();
			if (!CurrentContext.Contains(type))
			{
				CurrentContext[type] = new owin_userstatuschangehistoryDataAccessObjects(CurrentContext);
			}
			return (Iowin_userstatuschangehistoryDataAccessObjects)CurrentContext[type];
		}
		#endregion owin_userstatuschangehistory

		#endregion Factory Methods 
	}
}

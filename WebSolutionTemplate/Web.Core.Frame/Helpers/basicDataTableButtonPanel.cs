using AppConfig.EncryptionHandler;
using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization.Json;
using System.Security.Claims;
using System.Text;
using static AppConfig.HelperClasses.applicationEnamNConstants;

namespace AppConfig.HelperClasses
{
    public class basicDataTableButtonPanel : IDisposable
    {
        #region IDisposable Members

        private bool isDisposed = false;

        ~basicDataTableButtonPanel()
        {
            Dispose(false);
        }

        protected void Dispose(bool disposing)
        {
            if (disposing)
            {
                // Code to dispose the managed resources of the class
            }
            // Code to dispose the un-managed resources of the class

            isDisposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        public basicDataTableButtonPanel()
        {
        }
        #endregion



        public string getBasicBtnPanelForDataTable(
            long _primarykey, 
            string primarykeyname,
            ClaimsIdentity claimsIdentity,
            Dictionary<basicCRUDButtons, string> btnActionMethodList)
            //basicCRUDButtons[] objActionList)
        {
            basicButtonModelList obj = new basicButtonModelList(btnActionMethodList);
            var btnlist = obj.btnlist;

            clsPrivateKeys objClsPrivate = new clsPrivateKeys();
            string strValue = string.Empty;
            string strJson = string.Empty;
            try
            {
                foreach (basicButtonModel objsingle in btnlist)
                {
                    strJson += objsingle.btnname;
                }
            }
            catch (Exception ex)
            {
                strValue = ex.Message;
            }
            return strValue;
        }

    }
}

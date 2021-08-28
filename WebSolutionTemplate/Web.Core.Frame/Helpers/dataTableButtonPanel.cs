using AppConfig.HelperClasses;
using System;
using System.Collections.Generic;
using System.Security.Claims;

namespace Web.Core.Frame.Helpers
{
    public class dataTableButtonPanel : IDisposable
    {
        #region IDisposable Members

        private bool isDisposed = false;

        ~dataTableButtonPanel()
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
        public dataTableButtonPanel()
        {
        }
        #endregion

        /// <summary>
        /// Basic button panel code: edit delete and view
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <param name="primaryKeyName"></param>
        /// <param name="claimsIdentity"></param>
        /// <returns></returns>
        public string genDTBtnPanel<T>(string controllerName, T primaryKey, string primaryKeyName, ClaimsIdentity claimsIdentity,
            List<dataTableButtonModel> btnActionList)
        {
            clsPrivateKeys objClsPrivate = new clsPrivateKeys();
            string strJson = string.Empty;
            try
            {
                if (claimsIdentity != null)
                {
                    strJson += "<div class='btn-toolbar pull-right' role='toolbar'>";
                    string btnclass = string.Empty;
                    //List<Owin_ProcessGetFormActionistEntity_Ext> itemList = Newtonsoft.Json.JsonConvert.DeserializeObject<List<Owin_ProcessGetFormActionistEntity_Ext>>(HttpContext.Current.Session["jsonList"].ToString());
                    foreach (dataTableButtonModel objsingButton in btnActionList)
                    {
                        strJson += "<button type='button' class=\"" + objsingButton.btnclass + "\" onclick=\"location.href='/'" + objsingButton.btnmethodname.Replace("{controllername}", controllerName) + "'\">" + objsingButton.btnicon + objsingButton.btnname + "</button>";

                        //strJson += "<button class='"+ objsingButton.btnclass+ "' onclick ='" + editMethodName + "(&quot;" + objClsPrivate.BuildUrlMVCOnlyParams(menuName, menuId.ToString()) + "&quot;)'> <i class='fa fa-edit'> </i> " + KAF.MsgContainer._Common._btnUpdate + "</button> ";
                    }
                    strJson += "</div>";
                }
                else
                    throw new Exception("Login required");
            }
            catch (Exception ex)
            {
                strJson = ex.Message;
            }
            return strJson;
        }

    }
}

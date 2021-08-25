using AppConfig.EncryptionHandler;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Reflection;
using System.Resources;
using System.Runtime.Serialization.Json;
using System.Text;
using static AppConfig.HelperClasses.applicationEnamNConstants;

namespace AppConfig.HelperClasses
{
    public class basicButtonModel 
    {

        //Dictionary<basicCRUDButtons, string> btnActionMethodList = new Dictionary<basicCRUDButtons, string>()  {{ basicCRUDButtons.ADD , "" }, { basicCRUDButtons.EDIT, "" }, { basicCRUDButtons.CUSTOM, "hello" } } ;

        protected basicCRUDButtons _btnid;
        protected string _btnname;
        protected string _btnmethodname;

        public basicCRUDButtons btnid
        {
            get { return _btnid; }
            set { _btnid = value; OnChnaged(); }
        }

        public string btnname
        {
            get { return _btnname; }
            set { _btnname = value; }
        }
        public string btnmethodname
        {
            get { return _btnmethodname; }
        }

        private void OnChnaged()
        {
            var rm = new ResourceManager(typeof(CLL.Localization.SharedResource));
            _btnname = string.IsNullOrEmpty(_btnname) == true ? rm.GetString(((basicCRUDButtons)_btnid).ToString(), CultureInfo.CurrentUICulture) : _btnname;
        }
    }
    public class basicButtonModelList
    {
        public basicButtonModelList(basicCRUDButtons[] objList) 
        {
            _btnlist = new List<basicButtonModel>();
            foreach (basicCRUDButtons objSingle in objList)
            {
                _btnlist.Add(new basicButtonModel() { btnid = objSingle });
            }
        }

        public basicButtonModelList(Dictionary<basicCRUDButtons, string> btnActionMethodList)
        {
            _btnlist = new List<basicButtonModel>();
            foreach (var objSingle in btnActionMethodList)
            {
                if(c == basicCRUDButtons.CUSTOM)
                    _btnlist.Add(new basicButtonModel() { btnname = objSingle.Value, btnid = objSingle.Key });
                else
                    _btnlist.Add(new basicButtonModel() { btnid = objSingle.Key });
            }
            //this.btnActionMethodList = btnActionMethodList;
        }

        protected List<basicButtonModel> _btnlist;
        public List<basicButtonModel> btnlist
        {
            get { return _btnlist; }
            set {_btnlist = value; }
        }

    }

}

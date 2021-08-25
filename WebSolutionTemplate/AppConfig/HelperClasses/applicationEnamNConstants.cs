using AppConfig.EncryptionHandler;
using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization.Json;
using System.Text;

namespace AppConfig.HelperClasses
{
    public class applicationEnamNConstants
    {

        public enum basicCRUDButtons
        {
            ADD = 1,
            EDIT = 2,
            VIEW = 3,
            DELETE = 4,
            CUSTOM = 5
        }

        public enum basicCRUDButtonsMethodName
        {
            ADDGET = 1,
            ADDPOST = 2,
            EDITGET = 3,
            EDITPOST = 4,
            DELETEGET = 5,
            DELETEPOST = 6,
            VIEWGET =7  
        }
    }
}

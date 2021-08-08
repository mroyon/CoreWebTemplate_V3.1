using System;
using System.Collections.Generic;
using System.Text;

namespace BDO.DataAccessObjects.ExtendedEntities
{
    public class AjaxResponse
    {
        public string responsecode { get; }
        public string responsetext { get; }
        public string responsestatus { get; }
        public string responsetitle { get; }
        public string responseredirecturl { get; }
        
        public AjaxResponse(string _responsecode, string _responsetext, string _responsestatus, string _responsetitle, string _responseredirecturl)
        {
            responsecode = _responsecode;
            responsetext = _responsetext;
            responsestatus = string.IsNullOrEmpty(_responsestatus) == true ? CLL.LLClasses._Status._statusSuccess  : _responsestatus;
            responsetitle = _responsetitle;
            responseredirecturl = _responseredirecturl;
        }
        

    }
}

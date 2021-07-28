using System;
using System.Runtime.Serialization;

namespace WebAdmin.Models
{
    /// <summary>
    /// testmodel
    /// </summary>
    [Serializable]
    [DataContract(Name = "testmodel", Namespace = "http://www.KAF.com/types")]
    public class testmodel
    {
        protected string _culture;
        protected string _returnUrl;
        [DataMember]
        public string culture
        {
            get { return _culture; }
            set { _culture = value; }
        }
        [DataMember]
        public string returnUrl
        {
            get { return _returnUrl; }
            set { _returnUrl = value; }
        }

    }
}


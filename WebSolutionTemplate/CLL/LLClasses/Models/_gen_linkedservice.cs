using System;
using System.Globalization;
using System.IO;
using CLL.Abstract;

namespace CLL.LLClasses.Models
{
    
    public  class _gen_linkedservice : _Common
    {
         private static IResourceProvider resourceProvider_gen_linkedservice = new XmlResourceProvider(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"LanguagesFiles/_gen_linkedservice.xml"));//DbResourceProvider(); //  
         
         
        public static string linkedserviceList
        {
            get
            {
                return resourceProvider_gen_linkedservice.GetResource("linkedserviceList", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        public static string linkedserviceCreate
        {
            get
            {
                return resourceProvider_gen_linkedservice.GetResource("linkedserviceCreate", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        public static string linkedserviceUpdate
        {
            get
            {
                return resourceProvider_gen_linkedservice.GetResource("linkedserviceUpdate", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        public static string linkedserviceDetails
        {
            get
            {
                return resourceProvider_gen_linkedservice.GetResource("linkedserviceDetails", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
         
     
         public static string linkedservicenameen
        {
            get
            {
                return resourceProvider_gen_linkedservice.GetResource("linkedservicenameen", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
         public static string linkedservicenamear
        {
            get
            {
                return resourceProvider_gen_linkedservice.GetResource("linkedservicenamear", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        public static string linkedservicenamearRequired
        {
            get
            {
                return resourceProvider_gen_linkedservice.GetResource("linkedservicenamearRequired", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
         public static string linkservicelogopath
        {
            get
            {
                return resourceProvider_gen_linkedservice.GetResource("linkservicelogopath", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
         public static string linkedservicehyperlink
        {
            get
            {
                return resourceProvider_gen_linkedservice.GetResource("linkedservicehyperlink", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
         public static string urlopentarget
        {
            get
            {
                return resourceProvider_gen_linkedservice.GetResource("urlopentarget", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        
      
    }
}

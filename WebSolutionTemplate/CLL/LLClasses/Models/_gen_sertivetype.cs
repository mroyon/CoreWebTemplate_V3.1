using System;
using System.Globalization;
using System.IO;
using CLL.Abstract;

namespace CLL.LLClasses.Models
{
    
    public  class _gen_sertivetype : _Common
    {
         private static IResourceProvider resourceProvider_gen_sertivetype = new XmlResourceProvider(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"LanguagesFiles/_gen_sertivetype.xml"));//DbResourceProvider(); //  
         
         
        public static string sertivetypeList
        {
            get
            {
                return resourceProvider_gen_sertivetype.GetResource("sertivetypeList", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        public static string sertivetypeCreate
        {
            get
            {
                return resourceProvider_gen_sertivetype.GetResource("sertivetypeCreate", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        public static string sertivetypeUpdate
        {
            get
            {
                return resourceProvider_gen_sertivetype.GetResource("sertivetypeUpdate", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        public static string sertivetypeDetails
        {
            get
            {
                return resourceProvider_gen_sertivetype.GetResource("sertivetypeDetails", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
         
     
         public static string servicetype
        {
            get
            {
                return resourceProvider_gen_sertivetype.GetResource("servicetype", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        public static string servicetypeRequired
        {
            get
            {
                return resourceProvider_gen_sertivetype.GetResource("servicetypeRequired", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
         public static string description
        {
            get
            {
                return resourceProvider_gen_sertivetype.GetResource("description", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        
      
    }
}

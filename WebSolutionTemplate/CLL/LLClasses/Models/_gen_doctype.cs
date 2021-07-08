
using System;
using System.Globalization;
using System.IO;
using CLL.Abstract;

namespace CLL.LLClasses.Models
{
    
    public  class _gen_doctype : _Common
    {
         private static IResourceProvider resourceProvider_gen_doctype = new XmlResourceProvider(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"LanguagesFiles/_gen_doctype.xml"));//DbResourceProvider(); //  
         
         
        public static string doctypeList
        {
            get
            {
                return resourceProvider_gen_doctype.GetResource("doctypeList", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        public static string doctypeCreate
        {
            get
            {
                return resourceProvider_gen_doctype.GetResource("doctypeCreate", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        public static string doctypeUpdate
        {
            get
            {
                return resourceProvider_gen_doctype.GetResource("doctypeUpdate", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        public static string doctypeDetails
        {
            get
            {
                return resourceProvider_gen_doctype.GetResource("doctypeDetails", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
         
     
         public static string docname
        {
            get
            {
                return resourceProvider_gen_doctype.GetResource("docname", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        public static string docnameRequired
        {
            get
            {
                return resourceProvider_gen_doctype.GetResource("docnameRequired", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
         public static string docpriority
        {
            get
            {
                return resourceProvider_gen_doctype.GetResource("docpriority", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
         public static string remarks
        {
            get
            {
                return resourceProvider_gen_doctype.GetResource("remarks", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        
      
    }
}

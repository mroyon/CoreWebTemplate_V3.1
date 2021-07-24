using System;
using System.Globalization;
using System.IO;
using CLL.Abstract;

namespace CLL.LLClasses.Models
{
    
    public  class _gen_faqcagetogy : _Common
    {
         private static IResourceProvider resourceProvider_gen_faqcagetogy = new XmlResourceProvider(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"LanguagesFiles\_gen_faqcagetogy.xml"));//DbResourceProvider(); //  
         
         
        public static string faqcagetogyList
        {
            get
            {
                return resourceProvider_gen_faqcagetogy.GetResource("faqcagetogyList", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        public static string faqcagetogyCreate
        {
            get
            {
                return resourceProvider_gen_faqcagetogy.GetResource("faqcagetogyCreate", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        public static string faqcagetogyUpdate
        {
            get
            {
                return resourceProvider_gen_faqcagetogy.GetResource("faqcagetogyUpdate", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        public static string faqcagetogyDetails
        {
            get
            {
                return resourceProvider_gen_faqcagetogy.GetResource("faqcagetogyDetails", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
         
     
         public static string faqcateogry
        {
            get
            {
                return resourceProvider_gen_faqcagetogy.GetResource("faqcateogry", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        public static string faqcateogryRequired
        {
            get
            {
                return resourceProvider_gen_faqcagetogy.GetResource("faqcateogryRequired", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        
      
    }
}

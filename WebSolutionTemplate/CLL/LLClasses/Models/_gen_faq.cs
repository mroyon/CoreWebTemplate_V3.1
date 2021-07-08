using System;
using System.Globalization;
using System.IO;
using CLL.Abstract;

namespace CLL.LLClasses.Models
{
    
    public  class _gen_faq : _Common
    {
         private static IResourceProvider resourceProvider_gen_faq = new XmlResourceProvider(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"LanguagesFiles/_gen_faq.xml"));//DbResourceProvider(); //  
         
         
        public static string faqList
        {
            get
            {
                return resourceProvider_gen_faq.GetResource("faqList", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        public static string faqCreate
        {
            get
            {
                return resourceProvider_gen_faq.GetResource("faqCreate", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        public static string faqUpdate
        {
            get
            {
                return resourceProvider_gen_faq.GetResource("faqUpdate", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        public static string faqDetails
        {
            get
            {
                return resourceProvider_gen_faq.GetResource("faqDetails", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
         
     
         public static string faqcategoryid
        {
            get
            {
                return resourceProvider_gen_faq.GetResource("faqcategoryid", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        public static string faqcategoryidRequired
        {
            get
            {
                return resourceProvider_gen_faq.GetResource("faqcategoryidRequired", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
         public static string faqquestion
        {
            get
            {
                return resourceProvider_gen_faq.GetResource("faqquestion", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        public static string faqquestionRequired
        {
            get
            {
                return resourceProvider_gen_faq.GetResource("faqquestionRequired", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
         public static string faqanswer
        {
            get
            {
                return resourceProvider_gen_faq.GetResource("faqanswer", CultureInfo.CurrentUICulture.Name) as String;
            }
        }
        
      
    }
}

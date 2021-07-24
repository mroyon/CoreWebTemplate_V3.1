using BFO.Core.BusinessFacadeObjects.General;
using IBFO.Core.IBusinessFacadeObjects.General;
using Microsoft.AspNetCore.Http;

namespace BFC.Core.FacadeCreatorObjects.General
{
    public class gen_faqcagetogyFCC
    { 
	
		public gen_faqcagetogyFCC()
        {
		
        }
		
		public static Igen_faqcagetogyFacadeObjects GetFacadeCreate(IHttpContextAccessor httpContextAccessor)
        {
			Igen_faqcagetogyFacadeObjects facade = null;
            var context = httpContextAccessor.HttpContext;
            if (context != null)
            {
                facade = context.Items["Igen_faqcagetogyFacadeObjects"] as Igen_faqcagetogyFacadeObjects;
    
                if (facade == null)
                {
                    facade = new gen_faqcagetogyFacadeObjects();
                    context.Items["Igen_faqcagetogyFacadeObjects"] = facade;
                }
            }
            else
            {
                facade = new gen_faqcagetogyFacadeObjects();
                return facade;
            }
            return facade;
        }
		
		
	}
}
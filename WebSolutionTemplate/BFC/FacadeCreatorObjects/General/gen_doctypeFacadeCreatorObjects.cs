using BFO.Core.BusinessFacadeObjects.General;
using IBFO.Core.IBusinessFacadeObjects.General;
using Microsoft.AspNetCore.Http;

namespace BFC.Core.FacadeCreatorObjects.General
{
    public class gen_doctypeFCC
    { 
	
		public gen_doctypeFCC()
        {
		
        }
		
		public static Igen_doctypeFacadeObjects GetFacadeCreate(IHttpContextAccessor httpContextAccessor)
        {
            var context = httpContextAccessor.HttpContext;
            Igen_doctypeFacadeObjects facade = null;
            if (context != null)
            {
                facade = context.Items["Igen_doctypeFacadeObjects"] as Igen_doctypeFacadeObjects;
    
                if (facade == null)
                {
                    facade = new gen_doctypeFacadeObjects();
                    context.Items["Igen_doctypeFacadeObjects"] = facade;
                }
            }
            else
            {
                facade = new gen_doctypeFacadeObjects();
                return facade;
            }
            return facade;
        }
		
		
	}
}
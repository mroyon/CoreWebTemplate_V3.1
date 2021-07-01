using BFO.Core.BusinessFacadeObjects.General;
using IBFO.Core.IBusinessFacadeObjects.General;
using Microsoft.AspNetCore.Http;

namespace BFC.Core.FacadeCreatorObjects.General
{
    public class gen_linkedserviceFCC
    { 
	
		public gen_linkedserviceFCC()
        {
		
        }
		
		public static Igen_linkedserviceFacadeObjects GetFacadeCreate(IHttpContextAccessor httpContextAccessor)
        {
			Igen_linkedserviceFacadeObjects facade = null;
            var context = httpContextAccessor.HttpContext;
            if (context != null)
            {
                facade = context.Items["Igen_linkedserviceFacadeObjects"] as Igen_linkedserviceFacadeObjects;
    
                if (facade == null)
                {
                    facade = new gen_linkedserviceFacadeObjects();
                    context.Items["Igen_linkedserviceFacadeObjects"] = facade;
                }
            }
            else
            {
                facade = new gen_linkedserviceFacadeObjects();
                return facade;
            }
            return facade;
        }
		
		
	}
}
using BFO.Core.BusinessFacadeObjects.General;
using IBFO.Core.IBusinessFacadeObjects.General;
using Microsoft.AspNetCore.Http;

namespace BFC.Core.FacadeCreatorObjects.General
{
    public class gen_sertivetypeFCC
    { 
	
		public gen_sertivetypeFCC()
        {
		
        }
		
		public static Igen_sertivetypeFacadeObjects GetFacadeCreate(IHttpContextAccessor httpContextAccessor)
        {
			Igen_sertivetypeFacadeObjects facade = null;
            var context = httpContextAccessor.HttpContext;
            if (context != null)
            {
                facade = context.Items["Igen_sertivetypeFacadeObjects"] as Igen_sertivetypeFacadeObjects;
    
                if (facade == null)
                {
                    facade = new gen_sertivetypeFacadeObjects();
                    context.Items["Igen_sertivetypeFacadeObjects"] = facade;
                }
            }
            else
            {
                facade = new gen_sertivetypeFacadeObjects();
                return facade;
            }
            return facade;
        }
		
		
	}
}
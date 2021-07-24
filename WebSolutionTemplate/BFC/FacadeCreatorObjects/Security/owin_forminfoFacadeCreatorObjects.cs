


using BFO.Core.BusinessFacadeObjects.Security;
using IBFO.Core.IBusinessFacadeObjects.Security;
using Microsoft.AspNetCore.Http;

namespace BFC.Core.FacadeCreatorObjects.Security
{
    public class owin_forminfoFCC
    { 
	
		public owin_forminfoFCC()
        {
		
        }
		
		public static Iowin_forminfoFacadeObjects GetFacadeCreate(IHttpContextAccessor httpContextAccessor)
        {
			Iowin_forminfoFacadeObjects facade = null;
            var context = httpContextAccessor.HttpContext;
            if (context != null)
            {
                facade = context.Items["Iowin_forminfoFacadeObjects"] as Iowin_forminfoFacadeObjects;
    
                if (facade == null)
                {
                    facade = new owin_forminfoFacadeObjects();
                    context.Items["Iowin_forminfoFacadeObjects"] = facade;
                }
            }
            else
            {
                facade = new owin_forminfoFacadeObjects();
                return facade;
            }
            return facade;
        }
		
		
	}
}
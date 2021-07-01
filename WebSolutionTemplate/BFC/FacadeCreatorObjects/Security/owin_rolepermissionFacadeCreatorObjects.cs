using BFO.Core.BusinessFacadeObjects.Security;
using IBFO.Core.IBusinessFacadeObjects.Security;
using Microsoft.AspNetCore.Http;

namespace BFC.Core.FacadeCreatorObjects.Security
{
    public class owin_rolepermissionFCC
    { 
	
		public owin_rolepermissionFCC()
        {
		
        }
		
		public static Iowin_rolepermissionFacadeObjects GetFacadeCreate(IHttpContextAccessor httpContextAccessor)
        {
            var context = httpContextAccessor.HttpContext;
            Iowin_rolepermissionFacadeObjects facade = null;
            if (context != null)
            {
                facade = context.Items["Iowin_rolepermissionFacadeObjects"] as Iowin_rolepermissionFacadeObjects;

                if (facade == null)
                {
                    facade = new owin_rolepermissionFacadeObjects();
                    context.Items["Iowin_rolepermissionFacadeObjects"] = facade;
                }
            }
            else
            {
                facade = new owin_rolepermissionFacadeObjects();
                return facade;
            }
            return facade;

        }
		
		
	}
}
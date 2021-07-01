using BFO.Core.BusinessFacadeObjects.Security;
using IBFO.Core.IBusinessFacadeObjects.Security;
using Microsoft.AspNetCore.Http;

namespace BFC.Core.FacadeCreatorObjects.Security
{
    public class owin_userstatuschangehistoryFCC
    { 
	
		public owin_userstatuschangehistoryFCC()
        {
		
        }
		
		public static Iowin_userstatuschangehistoryFacadeObjects GetFacadeCreate(IHttpContextAccessor httpContextAccessor)
        {
            var context = httpContextAccessor.HttpContext;
            Iowin_userstatuschangehistoryFacadeObjects facade = null;
            if (context != null)
            {
                facade = context.Items["Iowin_userstatuschangehistoryFacadeObjects"] as Iowin_userstatuschangehistoryFacadeObjects;

                if (facade == null)
                {
                    facade = new owin_userstatuschangehistoryFacadeObjects();
                    context.Items["Iowin_userstatuschangehistoryFacadeObjects"] = facade;
                }
            }
            else
            {
                facade = new owin_userstatuschangehistoryFacadeObjects();
                return facade;
            }
            return facade;
        }
		
		
	}
}
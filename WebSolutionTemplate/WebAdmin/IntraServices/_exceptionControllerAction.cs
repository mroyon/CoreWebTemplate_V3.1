using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAdmin.IntraServices
{
    /// <summary>
    /// ControllerAction
    /// </summary>
    public class ControllerAction
    {
        /// <summary>
        /// Controller
        /// </summary>
        public string Controller { get; set; }

        /// <summary>
        /// Action
        /// </summary>
        public string Action { get; set; }

       
    }
    /// <summary>
    /// _exceptionControllerAction
    /// </summary>
    public static class _exceptionControllerAction
    {
        /// <summary>
        /// exceptional _ControllerAction lists
        /// </summary>
        public static List<ControllerAction> _ControllerActionLists { get; set; }

        /// <summary>
        /// _exceptionControllerAction constructer
        /// </summary>
        public static List<ControllerAction> _exceptionControllerActionGet()
        {
            _ControllerActionLists = new List<ControllerAction>();
            _ControllerActionLists.Add(new ControllerAction() { Controller = "Account", Action= "Login" });
            _ControllerActionLists.Add(new ControllerAction() { Controller = "Home", Action = "Index" });

            return _ControllerActionLists;
        }

    }
}

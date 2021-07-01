using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace WebAppFront.FilterAndAttributes
{
    /// <summary>
    /// SecurityHeadersAttribute
    /// </summary>
    public class SecurityHeadersAttribute : ActionFilterAttribute
    {
        /// <summary>
        /// OnResultExecuting
        /// </summary>
        /// <param name="context"></param>
        public override void OnResultExecuting(ResultExecutingContext context)
        {
            var result = context.Result;
            if (result is ViewResult)
            {
                var featurePolicy = "accelerometer 'none'; camera 'none'; geolocation 'none'; gyroscope 'none'; magnetometer 'none'; microphone 'none'; payment 'none'; usb 'none'";

                if (!context.HttpContext.Response.Headers.ContainsKey("feature-policy"))
                {
                    context.HttpContext.Response.Headers.Add("feature-policy", featurePolicy);
                }

                if (!context.HttpContext.Response.Headers.ContainsKey("X-Content-Type-Options"))
                {
                    context.HttpContext.Response.Headers.Add("X-Content-Type-Options", "nosniff");
                }
                if (!context.HttpContext.Response.Headers.ContainsKey("X-Frame-Options"))
                {
                    context.HttpContext.Response.Headers.Add("X-Frame-Options", "SAMEORIGIN");
                }
                context.HttpContext.Response.Headers.Remove("X-Powered-By");
                context.HttpContext.Response.Headers.Remove("Server");
                context.HttpContext.Response.Headers.Remove("X-AspNet-Version");
                context.HttpContext.Response.Headers.Remove("X-AspNetMvc-Version");

                //var csp = "script-src 'self' 'unsafe-inline';style-src 'self' 'unsafe-inline' https://fonts.googleapis.com;img-src 'self' data:;font-src 'self';form-action 'self';frame-ancestors 'self';block-all-mixed-content";
                //// once for standards compliant browsers
                //if (!context.HttpContext.Response.Headers.ContainsKey("Content-Security-Policy"))
                //{
                //    context.HttpContext.Response.Headers.Add("Content-Security-Policy", csp);
                //}
                //// and once again for IE
                //if (!context.HttpContext.Response.Headers.ContainsKey("X-Content-Security-Policy"))
                //{
                //    context.HttpContext.Response.Headers.Add("X-Content-Security-Policy", csp);
                //}
            }
        }
    }
}

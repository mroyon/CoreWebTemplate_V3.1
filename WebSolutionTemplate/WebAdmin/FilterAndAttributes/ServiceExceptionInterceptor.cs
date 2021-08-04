using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAdmin.FilterAndAttributes
{
    /// <summary>
    /// ServiceExceptionInterceptor
    /// </summary>
    public class ServiceExceptionInterceptor : IAsyncExceptionFilter
    {
        private readonly IConfiguration _config;
        private readonly IHttpContextAccessor _contextAccessor; 
        private readonly ILoggerFactory _loggerFactory;

        public ILogger _logger;


        /// <summary>
        /// 
        /// </summary>
        /// <param name="contextAccessor"></param>
        /// <param name="config"></param>
        /// <param name="loggerFactory"></param>
        public ServiceExceptionInterceptor(IHttpContextAccessor contextAccessor,
                        IConfiguration config,
                        ILoggerFactory loggerFactory
                        )
        {
            _contextAccessor = contextAccessor;
            _config = config;
            _loggerFactory = loggerFactory;
        }

        private readonly IDictionary<Type, Action<ExceptionContext>> _exceptionHandlers;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public Task OnExceptionAsync(ExceptionContext context)
        {
            var actionDescriptor = context.ActionDescriptor as ControllerActionDescriptor;
            var controllerName = actionDescriptor.ControllerName;
            var actionName = actionDescriptor.ActionName;
            _logger = _loggerFactory.CreateLogger(controllerName);
            _logger.LogError(context.Exception.Message);

            //Business exception-More generics for external world
            //var error = new ErrorDetails()
            //{
            //    StatusCode = 500,
            //    Message = "Something went wrong! Internal Server Error."
            //};
            ////Logs your technical exception with stack trace below

            //context.Result = new JsonResult(error);
            return Task.CompletedTask;
        }
    }
}

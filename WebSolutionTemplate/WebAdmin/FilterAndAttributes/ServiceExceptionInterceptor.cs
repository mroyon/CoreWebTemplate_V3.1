using Microsoft.AspNetCore.Mvc.Filters;
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
        private readonly IDictionary<Type, Action<ExceptionContext>> _exceptionHandlers;

        public Task OnExceptionAsync(ExceptionContext context)
        {
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

using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Web.Core.Frame.Interfaces.Services
{
    public interface IHttpClientHR
    {
        Task<string> CheckUserExists(string adUserAccountName);
    }
   
}

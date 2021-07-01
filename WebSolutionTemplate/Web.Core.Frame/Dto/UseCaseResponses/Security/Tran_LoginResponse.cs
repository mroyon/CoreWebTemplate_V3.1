using Web.Core.Frame.Dto;
using BDO.DataAccessObjects.SecurityModule;
using Web.Core.Frame.Interfaces;
using System.Collections.Generic;


namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Tran_LoginResponse : UseCaseResponseMessage
    {
        public tran_loginEntity _tran_Login { get; }

        public IEnumerable<tran_loginEntity> _tran_LoginList { get; }

        public Error Errors { get; }


        public Tran_LoginResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Tran_LoginResponse(IEnumerable<tran_loginEntity> tran_LoginList, bool success = false, string message = null) : base(success, message)
        {
            _tran_LoginList = tran_LoginList;
        }
        
        public Tran_LoginResponse(tran_loginEntity tran_Login, bool success = false, string message = null) : base(success, message)
        {
            _tran_Login = tran_Login;
        }
    }
}



namespace Web.Core.Frame.Interfaces
{
    public interface IOutputPort_Auth<in Auth_Response>
    {
        void ForgetPassword(Auth_Response response);
    }
}

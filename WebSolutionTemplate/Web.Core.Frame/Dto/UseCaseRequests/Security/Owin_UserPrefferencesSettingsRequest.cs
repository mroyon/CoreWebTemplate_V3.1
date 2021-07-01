using Web.Core.Frame.RequestResponse.UseCaseResponses;
using Web.Core.Frame.Interfaces;
using BDO.DataAccessObjects.SecurityModule;

namespace Web.Core.Frame.RequestResponse.UseCaseRequests
{
    public class Owin_UserPrefferencesSettingsRequest : IUseCaseRequest<Owin_UserPrefferencesSettingsResponse>
    {
        public owin_userprefferencessettingsEntity Objowin_userprefferencessettings { get; }
        public string RemoteIpAddress { get; }

        public Owin_UserPrefferencesSettingsRequest(owin_userprefferencessettingsEntity objowin_userprefferencessettings)
        {
            Objowin_userprefferencessettings = objowin_userprefferencessettings;
        }
    }
}

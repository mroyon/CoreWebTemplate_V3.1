using Web.Core.Frame.Dto;
using BDO.DataAccessObjects.SecurityModule;
using Web.Core.Frame.Interfaces;
using System.Collections.Generic;
using BDO.DataAccessObjects.ExtendedEntities;


namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Owin_UserPrefferencesSettingsResponse : UseCaseResponseMessage
    {
        public owin_userprefferencessettingsEntity _owin_UserPrefferencesSettings { get; }

        public IEnumerable<owin_userprefferencessettingsEntity> _owin_UserPrefferencesSettingsList { get; }

        public Error Errors { get; }


        public Owin_UserPrefferencesSettingsResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Owin_UserPrefferencesSettingsResponse(IEnumerable<owin_userprefferencessettingsEntity> owin_UserPrefferencesSettingsList, bool success = false, string message = null) : base(success, message)
        {
            _owin_UserPrefferencesSettingsList = owin_UserPrefferencesSettingsList;
        }
        
        public Owin_UserPrefferencesSettingsResponse(owin_userprefferencessettingsEntity owin_UserPrefferencesSettings, bool success = false, string message = null) : base(success, message)
        {
            _owin_UserPrefferencesSettings = owin_UserPrefferencesSettings;
        }
    }
}

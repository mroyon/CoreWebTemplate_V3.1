using System;
using System.Runtime.Serialization;
using System.Data;
using BDO.Base;
using System.ComponentModel.DataAnnotations;


namespace BDO.DataAccessObjects.SecurityModule
{
    [Serializable]
    [DataContract(Name = "owin_formactionEntity", Namespace = "http://www.KAF.com/types")]
    public partial class owin_formactionEntity : BaseEntity
    {
        #region Properties
    
        protected long ? _formactionid;
        protected long ? _appformid;
        protected string _actionname;
        protected string _actiontype;
        protected bool ? _isview;
        protected string _eventname;
        protected int ? _sequence;
                
        
        [DataMember]
        public long ? formactionid
        {
            get { return _formactionid; }
            set { _formactionid = value; this.OnChnaged(); }
        }
        
        [DataMember]
        [Display(Name = "appformid", ResourceType = typeof(CLL.LLClasses.SecurityModule._owin_formaction))]
        [Required(ErrorMessageResourceType = typeof(CLL.LLClasses.SecurityModule._owin_formaction), ErrorMessageResourceName = "appformidRequired")]
        public long ? appformid
        {
            get { return _appformid; }
            set { _appformid = value; this.OnChnaged(); }
        }
        
        [DataMember]
        [MaxLength(150)]
        [Display(Name = "actionname", ResourceType = typeof(CLL.LLClasses.SecurityModule._owin_formaction))]
        [Required(ErrorMessageResourceType = typeof(CLL.LLClasses.SecurityModule._owin_formaction), ErrorMessageResourceName = "actionnameRequired")]
        public string actionname
        {
            get { return _actionname; }
            set { _actionname = value; this.OnChnaged(); }
        }
        
        [DataMember]
        [MaxLength(250)]
        [Display(Name = "actiontype", ResourceType = typeof(CLL.LLClasses.SecurityModule._owin_formaction))]
        public string actiontype
        {
            get { return _actiontype; }
            set { _actiontype = value; this.OnChnaged(); }
        }
        
        [DataMember]
        [Display(Name = "isview", ResourceType = typeof(CLL.LLClasses.SecurityModule._owin_formaction))]
        public bool ? isview
        {
            get { return _isview; }
            set { _isview = value; this.OnChnaged(); }
        }
        
        [DataMember]
        [MaxLength(50)]
        [Display(Name = "eventname", ResourceType = typeof(CLL.LLClasses.SecurityModule._owin_formaction))]
        public string eventname
        {
            get { return _eventname; }
            set { _eventname = value; this.OnChnaged(); }
        }
        
        [DataMember]
        [Display(Name = "sequence", ResourceType = typeof(CLL.LLClasses.SecurityModule._owin_formaction))]
        public int ? sequence
        {
            get { return _sequence; }
            set { _sequence = value; this.OnChnaged(); }
        }
        
        
        #endregion
    
        #region Constructor
    
        public owin_formactionEntity():base()
        {
        }
        
        public owin_formactionEntity(IDataReader reader)
        {
            this.LoadFromReader(reader);
        }
        
         public owin_formactionEntity(IDataReader reader, bool IsListViewShow)
        {
            this.LoadFromReader(reader, IsListViewShow);
        }
        
        protected void LoadFromReader(IDataReader reader)
        {
            if (reader != null && !reader.IsClosed)
            {
                this.BaseSecurityParam = new SecurityCapsule();
                if (!reader.IsDBNull(reader.GetOrdinal("FormActionID"))) _formactionid = reader.GetInt64(reader.GetOrdinal("FormActionID"));
                if (!reader.IsDBNull(reader.GetOrdinal("AppFormID"))) _appformid = reader.GetInt64(reader.GetOrdinal("AppFormID"));
                if (!reader.IsDBNull(reader.GetOrdinal("ActionName"))) _actionname = reader.GetString(reader.GetOrdinal("ActionName"));
                if (!reader.IsDBNull(reader.GetOrdinal("ActionType"))) _actiontype = reader.GetString(reader.GetOrdinal("ActionType"));
                if (!reader.IsDBNull(reader.GetOrdinal("IsView"))) _isview = reader.GetBoolean(reader.GetOrdinal("IsView"));
                if (!reader.IsDBNull(reader.GetOrdinal("EventName"))) _eventname = reader.GetString(reader.GetOrdinal("EventName"));
                if (!reader.IsDBNull(reader.GetOrdinal("Sequence"))) _sequence = reader.GetInt32(reader.GetOrdinal("Sequence"));
                
                if (!reader.IsDBNull(reader.GetOrdinal("TransID"))) this.BaseSecurityParam.transid = reader.GetString(reader.GetOrdinal("TransID"));
                if (!reader.IsDBNull(reader.GetOrdinal("CreatedByUserName"))) _createdbyusername = reader.GetString(reader.GetOrdinal("CreatedByUserName"));
                BaseSecurityParam.createdbyusername = _createdbyusername;
                if (!reader.IsDBNull(reader.GetOrdinal("CreatedDate"))) this.BaseSecurityParam.createddate = reader.GetDateTime(reader.GetOrdinal("CreatedDate"));
                if (!reader.IsDBNull(reader.GetOrdinal("UpdatedByUserName"))) _updatedbyusername = reader.GetString(reader.GetOrdinal("UpdatedByUserName"));
                BaseSecurityParam.updatedbyusername = _updatedbyusername;
                if (!reader.IsDBNull(reader.GetOrdinal("UpdatedDate"))) this.BaseSecurityParam.updateddate = reader.GetDateTime(reader.GetOrdinal("UpdatedDate"));
                if (!reader.IsDBNull(reader.GetOrdinal("IPAddress"))) this.BaseSecurityParam.ipaddress = reader.GetString(reader.GetOrdinal("IPAddress"));
                if (!reader.IsDBNull(reader.GetOrdinal("TS"))) this.BaseSecurityParam.ts = reader.GetInt64(reader.GetOrdinal("ts"));

                CurrentState = EntityState.Unchanged;
            }
        }


        protected void LoadFromReader(IDataReader reader, bool IsListViewShow)
        {
            if (reader != null && !reader.IsClosed)
            {
                this.BaseSecurityParam = new SecurityCapsule();
                if (!reader.IsDBNull(reader.GetOrdinal("FormActionID"))) _formactionid = reader.GetInt64(reader.GetOrdinal("FormActionID"));
                if (!reader.IsDBNull(reader.GetOrdinal("AppFormID"))) _appformid = reader.GetInt64(reader.GetOrdinal("AppFormID"));
                if (!reader.IsDBNull(reader.GetOrdinal("ActionName"))) _actionname = reader.GetString(reader.GetOrdinal("ActionName"));
                if (!reader.IsDBNull(reader.GetOrdinal("ActionType"))) _actiontype = reader.GetString(reader.GetOrdinal("ActionType"));
                if (!reader.IsDBNull(reader.GetOrdinal("IsView"))) _isview = reader.GetBoolean(reader.GetOrdinal("IsView"));
                if (!reader.IsDBNull(reader.GetOrdinal("EventName"))) _eventname = reader.GetString(reader.GetOrdinal("EventName"));
                if (!reader.IsDBNull(reader.GetOrdinal("Sequence"))) _sequence = reader.GetInt32(reader.GetOrdinal("Sequence"));

                if (!reader.IsDBNull(reader.GetOrdinal("TransID"))) this.BaseSecurityParam.transid = reader.GetString(reader.GetOrdinal("TransID"));
                if (!reader.IsDBNull(reader.GetOrdinal("CreatedByUserName"))) _createdbyusername = reader.GetString(reader.GetOrdinal("CreatedByUserName"));
                BaseSecurityParam.createdbyusername = _createdbyusername;
                if (!reader.IsDBNull(reader.GetOrdinal("CreatedDate"))) this.BaseSecurityParam.createddate = reader.GetDateTime(reader.GetOrdinal("CreatedDate"));
                if (!reader.IsDBNull(reader.GetOrdinal("UpdatedByUserName"))) _updatedbyusername = reader.GetString(reader.GetOrdinal("UpdatedByUserName"));
                BaseSecurityParam.updatedbyusername = _updatedbyusername;
                if (!reader.IsDBNull(reader.GetOrdinal("UpdatedDate"))) this.BaseSecurityParam.updateddate = reader.GetDateTime(reader.GetOrdinal("UpdatedDate"));
                if (!reader.IsDBNull(reader.GetOrdinal("IPAddress"))) this.BaseSecurityParam.ipaddress = reader.GetString(reader.GetOrdinal("IPAddress"));
                if (!reader.IsDBNull(reader.GetOrdinal("TS"))) this.BaseSecurityParam.ts = reader.GetInt64(reader.GetOrdinal("ts"));

                CurrentState = EntityState.Unchanged;
            }
        }
        #endregion
    }
}

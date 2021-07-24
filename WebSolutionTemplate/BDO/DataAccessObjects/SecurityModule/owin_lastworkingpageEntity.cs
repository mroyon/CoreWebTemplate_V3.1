using System;
using System.Runtime.Serialization;
using System.Data;
using BDO.Base;
using System.ComponentModel.DataAnnotations;


namespace BDO.DataAccessObjects.SecurityModule
{
    [Serializable]
    [DataContract(Name = "owin_lastworkingpageEntity", Namespace = "http://www.KAF.com/types")]
    public partial class owin_lastworkingpageEntity : BaseEntity
    {
        #region Properties
    
        protected long ? _lastpageid;
        protected long ? _appformid;
        protected Guid ? _userid;
        protected long ? _masteruserid;
        protected DateTime ? _lastentrydate;
                
        
        [DataMember]
        public long ? lastpageid
        {
            get { return _lastpageid; }
            set { _lastpageid = value; this.OnChnaged(); }
        }
        
        [DataMember]
        [Display(Name = "appformid", ResourceType = typeof(CLL.LLClasses.SecurityModule._owin_lastworkingpage))]
        [Required(ErrorMessageResourceType = typeof(CLL.LLClasses.SecurityModule._owin_lastworkingpage), ErrorMessageResourceName = "appformidRequired")]
        public long ? appformid
        {
            get { return _appformid; }
            set { _appformid = value; this.OnChnaged(); }
        }
        
        [DataMember]
        [Display(Name = "userid", ResourceType = typeof(CLL.LLClasses.SecurityModule._owin_lastworkingpage))]
        [Required(ErrorMessageResourceType = typeof(CLL.LLClasses.SecurityModule._owin_lastworkingpage), ErrorMessageResourceName = "useridRequired")]
        public Guid ? userid
        {
            get { return _userid; }
            set { _userid = value; this.OnChnaged(); }
        }
        
        [DataMember]
        [Display(Name = "masteruserid", ResourceType = typeof(CLL.LLClasses.SecurityModule._owin_lastworkingpage))]
        [Required(ErrorMessageResourceType = typeof(CLL.LLClasses.SecurityModule._owin_lastworkingpage), ErrorMessageResourceName = "masteruseridRequired")]
        public long ? masteruserid
        {
            get { return _masteruserid; }
            set { _masteruserid = value; this.OnChnaged(); }
        }
        
        [DataMember]
        [Display(Name = "lastentrydate", ResourceType = typeof(CLL.LLClasses.SecurityModule._owin_lastworkingpage))]
        [Required(ErrorMessageResourceType = typeof(CLL.LLClasses.SecurityModule._owin_lastworkingpage), ErrorMessageResourceName = "lastentrydateRequired")]
        public DateTime ? lastentrydate
        {
            get { return _lastentrydate; }
            set { _lastentrydate = value; this.OnChnaged(); }
        }
        
        
        #endregion
    
        #region Constructor
    
        public owin_lastworkingpageEntity():base()
        {
        }
        
        public owin_lastworkingpageEntity(IDataReader reader)
        {
            this.LoadFromReader(reader);
        }
        
         public owin_lastworkingpageEntity(IDataReader reader, bool IsListViewShow)
        {
            this.LoadFromReader(reader, IsListViewShow);
        }
        
        protected void LoadFromReader(IDataReader reader)
        {
            if (reader != null && !reader.IsClosed)
            {
                this.BaseSecurityParam = new SecurityCapsule();
                if (!reader.IsDBNull(reader.GetOrdinal("LastPageID"))) _lastpageid = reader.GetInt64(reader.GetOrdinal("LastPageID"));
                if (!reader.IsDBNull(reader.GetOrdinal("AppFormID"))) _appformid = reader.GetInt64(reader.GetOrdinal("AppFormID"));
                if (!reader.IsDBNull(reader.GetOrdinal("UserID"))) _userid = reader.GetGuid(reader.GetOrdinal("UserID"));
                if (!reader.IsDBNull(reader.GetOrdinal("MasterUserID"))) _masteruserid = reader.GetInt64(reader.GetOrdinal("MasterUserID"));
                if (!reader.IsDBNull(reader.GetOrdinal("LastEntryDate"))) _lastentrydate = reader.GetDateTime(reader.GetOrdinal("LastEntryDate"));

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
                if (!reader.IsDBNull(reader.GetOrdinal("LastPageID"))) _lastpageid = reader.GetInt64(reader.GetOrdinal("LastPageID"));
                if (!reader.IsDBNull(reader.GetOrdinal("AppFormID"))) _appformid = reader.GetInt64(reader.GetOrdinal("AppFormID"));
                if (!reader.IsDBNull(reader.GetOrdinal("UserID"))) _userid = reader.GetGuid(reader.GetOrdinal("UserID"));
                if (!reader.IsDBNull(reader.GetOrdinal("MasterUserID"))) _masteruserid = reader.GetInt64(reader.GetOrdinal("MasterUserID"));
                if (!reader.IsDBNull(reader.GetOrdinal("LastEntryDate"))) _lastentrydate = reader.GetDateTime(reader.GetOrdinal("LastEntryDate"));

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

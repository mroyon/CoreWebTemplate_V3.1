using System;
using System.Runtime.Serialization;
using System.Data;
using BDO.Base;
using System.ComponentModel.DataAnnotations;


namespace BDO.DataAccessObjects.Models
{
    [Serializable]
    [DataContract(Name = "gen_doctypeEntity", Namespace = "http://www.KAF.com/types")]
    public partial class gen_doctypeEntity : BaseEntity
    {
        #region Properties
    
        protected long ? _doctypeid;
        protected string _docname;
        protected long ? _docpriority;
        protected string _remarks;
                
        
        [DataMember]
        public long ? doctypeid
        {
            get { return _doctypeid; }
            set { _doctypeid = value; this.OnChnaged(); }
        }
        
        [DataMember]
        [MaxLength(150)]
        [Display(Name = "docname", ResourceType = typeof(CLL.LLClasses.Models._gen_doctype))]
        [Required(ErrorMessageResourceType = typeof(CLL.LLClasses.Models._gen_doctype), ErrorMessageResourceName = "docnameRequired")]
        public string docname
        {
            get { return _docname; }
            set { _docname = value; this.OnChnaged(); }
        }
        
        [DataMember]
        [Display(Name = "docpriority", ResourceType = typeof(CLL.LLClasses.Models._gen_doctype))]
        public long ? docpriority
        {
            get { return _docpriority; }
            set { _docpriority = value; this.OnChnaged(); }
        }
        
        [DataMember]
        [MaxLength(350)]
        [Display(Name = "remarks", ResourceType = typeof(CLL.LLClasses.Models._gen_doctype))]
        public string remarks
        {
            get { return _remarks; }
            set { _remarks = value; this.OnChnaged(); }
        }
        
        
        #endregion
    
        #region Constructor
    
        public gen_doctypeEntity():base()
        {
        }
        
        public gen_doctypeEntity(IDataReader reader)
        {
            this.LoadFromReader(reader);
        }
        
         public gen_doctypeEntity(IDataReader reader, bool IsListViewShow)
        {
            this.LoadFromReader(reader, IsListViewShow);
        }
        
        protected void LoadFromReader(IDataReader reader)
        {
            if (reader != null && !reader.IsClosed)
            {
                this.BaseSecurityParam = new SecurityCapsule();
                if (!reader.IsDBNull(reader.GetOrdinal("DocTypeID"))) _doctypeid = reader.GetInt64(reader.GetOrdinal("DocTypeID"));
                if (!reader.IsDBNull(reader.GetOrdinal("DocName"))) _docname = reader.GetString(reader.GetOrdinal("DocName"));
                if (!reader.IsDBNull(reader.GetOrdinal("DocPriority"))) _docpriority = reader.GetInt64(reader.GetOrdinal("DocPriority"));
                if (!reader.IsDBNull(reader.GetOrdinal("Remarks"))) _remarks = reader.GetString(reader.GetOrdinal("Remarks"));
                if (!reader.IsDBNull(reader.GetOrdinal("TransID"))) this.BaseSecurityParam.transid = reader.GetString(reader.GetOrdinal("TransID"));
                
                if (!reader.IsDBNull(reader.GetOrdinal("CreatedDate"))) this.BaseSecurityParam.createddate = reader.GetDateTime(reader.GetOrdinal("CreatedDate"));
                if (!reader.IsDBNull(reader.GetOrdinal("CreatedByUserName"))) _createdbyusername = reader.GetString(reader.GetOrdinal("CreatedByUserName"));
                this.BaseSecurityParam.createdbyusername = _createdbyusername;
                if (!reader.IsDBNull(reader.GetOrdinal("UpdatedByUserName"))) _updatedbyusername = reader.GetString(reader.GetOrdinal("UpdatedByUserName"));
                this.BaseSecurityParam.updatedbyusername = _updatedbyusername;
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
                if (!reader.IsDBNull(reader.GetOrdinal("DocTypeID"))) _doctypeid = reader.GetInt64(reader.GetOrdinal("DocTypeID"));
                if (!reader.IsDBNull(reader.GetOrdinal("DocName"))) _docname = reader.GetString(reader.GetOrdinal("DocName"));
                if (!reader.IsDBNull(reader.GetOrdinal("DocPriority"))) _docpriority = reader.GetInt64(reader.GetOrdinal("DocPriority"));
                if (!reader.IsDBNull(reader.GetOrdinal("Remarks"))) _remarks = reader.GetString(reader.GetOrdinal("Remarks"));
                if (!reader.IsDBNull(reader.GetOrdinal("TransID"))) this.BaseSecurityParam.transid = reader.GetString(reader.GetOrdinal("TransID"));
                
                if (!reader.IsDBNull(reader.GetOrdinal("CreatedDate"))) this.BaseSecurityParam.createddate = reader.GetDateTime(reader.GetOrdinal("CreatedDate"));
                if (!reader.IsDBNull(reader.GetOrdinal("CreatedByUserName"))) _createdbyusername = reader.GetString(reader.GetOrdinal("CreatedByUserName"));
                this.BaseSecurityParam.createdbyusername = _createdbyusername;
                if (!reader.IsDBNull(reader.GetOrdinal("UpdatedByUserName"))) _updatedbyusername = reader.GetString(reader.GetOrdinal("UpdatedByUserName"));
                this.BaseSecurityParam.updatedbyusername = _updatedbyusername;
                if (!reader.IsDBNull(reader.GetOrdinal("UpdatedDate"))) this.BaseSecurityParam.updateddate = reader.GetDateTime(reader.GetOrdinal("UpdatedDate"));
                if (!reader.IsDBNull(reader.GetOrdinal("IPAddress"))) this.BaseSecurityParam.ipaddress = reader.GetString(reader.GetOrdinal("IPAddress"));
                if (!reader.IsDBNull(reader.GetOrdinal("TS"))) this.BaseSecurityParam.ts = reader.GetInt64(reader.GetOrdinal("ts"));
                CurrentState = EntityState.Unchanged;
            }
        }
        #endregion
    }
}

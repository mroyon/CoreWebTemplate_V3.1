using System;
using System.Runtime.Serialization;
using System.Data;
using BDO.Base;
using System.ComponentModel.DataAnnotations;


namespace BDO.DataAccessObjects.Models
{
    [Serializable]
    [DataContract(Name = "gen_imagegallarycategoryEntity", Namespace = "http://www.KAF.com/types")]
    public partial class gen_imagegallarycategoryEntity : BaseEntity
    {
        #region Properties
    
        protected long ? _imagegallarycategoryid;
        protected string _categoryname;
        protected string _categorydescription;
                
        
        [DataMember]
        public long ? imagegallarycategoryid
        {
            get { return _imagegallarycategoryid; }
            set { _imagegallarycategoryid = value; this.OnChnaged(); }
        }
        
        [DataMember]
        [MaxLength(150)]
        [Display(Name = "categoryname", ResourceType = typeof(CLL.LLClasses.Models._gen_imagegallarycategory))]
        [Required(ErrorMessageResourceType = typeof(CLL.LLClasses.Models._gen_imagegallarycategory), ErrorMessageResourceName = "categorynameRequired")]
        public string categoryname
        {
            get { return _categoryname; }
            set { _categoryname = value; this.OnChnaged(); }
        }
        
        [DataMember]
        [MaxLength(250)]
        [Display(Name = "categorydescription", ResourceType = typeof(CLL.LLClasses.Models._gen_imagegallarycategory))]
        public string categorydescription
        {
            get { return _categorydescription; }
            set { _categorydescription = value; this.OnChnaged(); }
        }
        
        
        #endregion
    
        #region Constructor
    
        public gen_imagegallarycategoryEntity():base()
        {
        }
        
        public gen_imagegallarycategoryEntity(IDataReader reader)
        {
            this.LoadFromReader(reader);
        }
        
         public gen_imagegallarycategoryEntity(IDataReader reader, bool IsListViewShow)
        {
            this.LoadFromReader(reader, IsListViewShow);
        }
        
        protected void LoadFromReader(IDataReader reader)
        {
            if (reader != null && !reader.IsClosed)
            {
                this.BaseSecurityParam = new SecurityCapsule();
                if (!reader.IsDBNull(reader.GetOrdinal("ImageGallaryCategoryID"))) _imagegallarycategoryid = reader.GetInt64(reader.GetOrdinal("ImageGallaryCategoryID"));
                if (!reader.IsDBNull(reader.GetOrdinal("CategoryName"))) _categoryname = reader.GetString(reader.GetOrdinal("CategoryName"));
                if (!reader.IsDBNull(reader.GetOrdinal("CategoryDescription"))) _categorydescription = reader.GetString(reader.GetOrdinal("CategoryDescription"));
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
                if (!reader.IsDBNull(reader.GetOrdinal("ImageGallaryCategoryID"))) _imagegallarycategoryid = reader.GetInt64(reader.GetOrdinal("ImageGallaryCategoryID"));
                if (!reader.IsDBNull(reader.GetOrdinal("CategoryName"))) _categoryname = reader.GetString(reader.GetOrdinal("CategoryName"));
                if (!reader.IsDBNull(reader.GetOrdinal("CategoryDescription"))) _categorydescription = reader.GetString(reader.GetOrdinal("CategoryDescription"));
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

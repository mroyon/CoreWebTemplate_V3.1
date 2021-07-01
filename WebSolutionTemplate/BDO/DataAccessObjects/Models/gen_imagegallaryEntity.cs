using System;
using System.Runtime.Serialization;
using System.Data;
using BDO.Base;
using System.ComponentModel.DataAnnotations;


namespace BDO.DataAccessObjects.Models
{
    [Serializable]
    [DataContract(Name = "gen_imagegallaryEntity", Namespace = "http://www.KAF.com/types")]
    public partial class gen_imagegallaryEntity : BaseEntity
    {
        #region Properties
    
        protected long ? _imagegallaryid;
        protected long ? _imagegallarycategoryid;
        protected string _imagepath;
        protected string _imagetype;
        protected string _imageextension;
        protected string _imagename;
        protected bool ? _isinslider;
                
        
        [DataMember]
        public long ? imagegallaryid
        {
            get { return _imagegallaryid; }
            set { _imagegallaryid = value; this.OnChnaged(); }
        }
        
        [DataMember]
        [Display(Name = "imagegallarycategoryid", ResourceType = typeof(CLL.LLClasses.Models._gen_imagegallary))]
        [Required(ErrorMessageResourceType = typeof(CLL.LLClasses.Models._gen_imagegallary), ErrorMessageResourceName = "imagegallarycategoryidRequired")]
        public long ? imagegallarycategoryid
        {
            get { return _imagegallarycategoryid; }
            set { _imagegallarycategoryid = value; this.OnChnaged(); }
        }
        
        [DataMember]
        [MaxLength(250)]
        [Display(Name = "imagepath", ResourceType = typeof(CLL.LLClasses.Models._gen_imagegallary))]
        [Required(ErrorMessageResourceType = typeof(CLL.LLClasses.Models._gen_imagegallary), ErrorMessageResourceName = "imagepathRequired")]
        public string imagepath
        {
            get { return _imagepath; }
            set { _imagepath = value; this.OnChnaged(); }
        }
        
        [DataMember]
        [MaxLength(50)]
        [Display(Name = "imagetype", ResourceType = typeof(CLL.LLClasses.Models._gen_imagegallary))]
        [Required(ErrorMessageResourceType = typeof(CLL.LLClasses.Models._gen_imagegallary), ErrorMessageResourceName = "imagetypeRequired")]
        public string imagetype
        {
            get { return _imagetype; }
            set { _imagetype = value; this.OnChnaged(); }
        }
        
        [DataMember]
        [MaxLength(50)]
        [Display(Name = "imageextension", ResourceType = typeof(CLL.LLClasses.Models._gen_imagegallary))]
        [Required(ErrorMessageResourceType = typeof(CLL.LLClasses.Models._gen_imagegallary), ErrorMessageResourceName = "imageextensionRequired")]
        public string imageextension
        {
            get { return _imageextension; }
            set { _imageextension = value; this.OnChnaged(); }
        }
        
        [DataMember]
        [MaxLength(50)]
        [Display(Name = "imagename", ResourceType = typeof(CLL.LLClasses.Models._gen_imagegallary))]
        [Required(ErrorMessageResourceType = typeof(CLL.LLClasses.Models._gen_imagegallary), ErrorMessageResourceName = "imagenameRequired")]
        public string imagename
        {
            get { return _imagename; }
            set { _imagename = value; this.OnChnaged(); }
        }
        
        [DataMember]
        [Display(Name = "isinslider", ResourceType = typeof(CLL.LLClasses.Models._gen_imagegallary))]
        public bool ? isinslider
        {
            get { return _isinslider; }
            set { _isinslider = value; this.OnChnaged(); }
        }
        
        
        #endregion
    
        #region Constructor
    
        public gen_imagegallaryEntity():base()
        {
        }
        
        public gen_imagegallaryEntity(IDataReader reader)
        {
            this.LoadFromReader(reader);
        }
        
         public gen_imagegallaryEntity(IDataReader reader, bool IsListViewShow)
        {
            this.LoadFromReader(reader, IsListViewShow);
        }
        
        protected void LoadFromReader(IDataReader reader)
        {
            if (reader != null && !reader.IsClosed)
            {
                this.BaseSecurityParam = new SecurityCapsule();
                if (!reader.IsDBNull(reader.GetOrdinal("ImageGallaryID"))) _imagegallaryid = reader.GetInt64(reader.GetOrdinal("ImageGallaryID"));
                if (!reader.IsDBNull(reader.GetOrdinal("ImageGallaryCategoryID"))) _imagegallarycategoryid = reader.GetInt64(reader.GetOrdinal("ImageGallaryCategoryID"));
                if (!reader.IsDBNull(reader.GetOrdinal("ImagePath"))) _imagepath = reader.GetString(reader.GetOrdinal("ImagePath"));
                if (!reader.IsDBNull(reader.GetOrdinal("ImageType"))) _imagetype = reader.GetString(reader.GetOrdinal("ImageType"));
                if (!reader.IsDBNull(reader.GetOrdinal("ImageExtension"))) _imageextension = reader.GetString(reader.GetOrdinal("ImageExtension"));
                if (!reader.IsDBNull(reader.GetOrdinal("ImageName"))) _imagename = reader.GetString(reader.GetOrdinal("ImageName"));
                if (!reader.IsDBNull(reader.GetOrdinal("IsInSlider"))) _isinslider = reader.GetBoolean(reader.GetOrdinal("IsInSlider"));
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
                if (!reader.IsDBNull(reader.GetOrdinal("ImageGallaryID"))) _imagegallaryid = reader.GetInt64(reader.GetOrdinal("ImageGallaryID"));
                if (!reader.IsDBNull(reader.GetOrdinal("ImageGallaryCategoryID"))) _imagegallarycategoryid = reader.GetInt64(reader.GetOrdinal("ImageGallaryCategoryID"));
                if (!reader.IsDBNull(reader.GetOrdinal("ImagePath"))) _imagepath = reader.GetString(reader.GetOrdinal("ImagePath"));
                if (!reader.IsDBNull(reader.GetOrdinal("ImageType"))) _imagetype = reader.GetString(reader.GetOrdinal("ImageType"));
                if (!reader.IsDBNull(reader.GetOrdinal("ImageExtension"))) _imageextension = reader.GetString(reader.GetOrdinal("ImageExtension"));
                if (!reader.IsDBNull(reader.GetOrdinal("ImageName"))) _imagename = reader.GetString(reader.GetOrdinal("ImageName"));
                if (!reader.IsDBNull(reader.GetOrdinal("IsInSlider"))) _isinslider = reader.GetBoolean(reader.GetOrdinal("IsInSlider"));
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

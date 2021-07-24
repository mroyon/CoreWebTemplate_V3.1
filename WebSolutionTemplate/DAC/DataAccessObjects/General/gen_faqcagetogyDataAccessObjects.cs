using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using Microsoft.Practices.EnterpriseLibrary.Data;
using AppConfig.ConfigDAAC;
using DAC.Core.Base;
using System.Threading.Tasks;
using System.Threading;
using BDO.DataAccessObjects.Models;
using IDAC.Core.IDataAccessObjects.General;
using BDO.Base;

namespace DAC.Core.DataAccessObjects.General
{
	/// <summary>
    /// Un touched: From Generator
    /// KAF Information Center
    /// </summary>
	
	internal sealed partial class gen_faqcagetogyDataAccessObjects : BaseDataAccess, Igen_faqcagetogyDataAccessObjects
	{
		
	    #region Constructors
        
		private string ClassName = "gen_faqcagetogyDataAccessObjects";
        
		public gen_faqcagetogyDataAccessObjects(Context context): base(context)
		{
		}
		
		private string SourceOfException(string methodName)
        {
            return "Class name: " + ClassName + " and Method name: " + methodName;
        }
        
		#endregion
		
        public static void FillParameters(gen_faqcagetogyEntity gen_faqcagetogy, DbCommand cmd,Database Database,bool forDelete=false)
        {
			if (gen_faqcagetogy.faqcategoryid.HasValue)
				Database.AddInParameter(cmd, "@FAQCategoryID", DbType.Int64, gen_faqcagetogy.faqcategoryid);
            if (forDelete) return;
			if (!(string.IsNullOrEmpty(gen_faqcagetogy.faqcateogry)))
				Database.AddInParameter(cmd, "@FAQCateogry", DbType.String, gen_faqcagetogy.faqcateogry);

        }
		
        
		#region Add Operation

        async Task<long> Igen_faqcagetogyDataAccessObjects.Add(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken)
        {
            long returnCode = -99;
            const string SP = "gen_faqcagetogy_Ins";
			
			using (DbCommand cmd =  Database.GetStoredProcCommand(SP))
            {
                FillParameters(gen_faqcagetogy, cmd,Database);
                FillSequrityParameters(gen_faqcagetogy.BaseSecurityParam, cmd, Database);
				AddOutputParameter(cmd);
				try
                {
                    IAsyncResult result = Database.BeginExecuteNonQuery(cmd, null, null);
                    while (!result.IsCompleted)
                    {
                    }
                    returnCode = Database.EndExecuteNonQuery(result);
                    returnCode = (Int64)(cmd.Parameters["@RETURN_KEY"].Value);
                }
                catch (Exception ex)
                {
                    throw GetDataAccessException(ex, SourceOfException("Igen_faqcagetogyDataAccess.Addgen_faqcagetogy"));
                }
                cmd.Dispose();
            }
            return returnCode;
        }
       
        #endregion Add Operation
		
		#region Update Operation

        async Task<long> Igen_faqcagetogyDataAccessObjects.Update(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken)
        {
           long returnCode = -99;
            const string SP = "gen_faqcagetogy_Upd";
			
            using (DbCommand cmd =  Database.GetStoredProcCommand(SP))
            {
			    FillParameters(gen_faqcagetogy, cmd,Database);
                FillSequrityParameters(gen_faqcagetogy.BaseSecurityParam, cmd, Database);
				AddOutputParameter(cmd);
                try
                {
                  	IAsyncResult result = Database.BeginExecuteNonQuery(cmd, null, null);
                    while (!result.IsCompleted)
                    {
                    }
                    returnCode = Database.EndExecuteNonQuery(result);
                    returnCode = (Int64)(cmd.Parameters["@RETURN_KEY"].Value);
                }
                catch (Exception ex)
                {
                    throw GetDataAccessException(ex, SourceOfException("Igen_faqcagetogyDataAccess.Updategen_faqcagetogy"));
                }
                cmd.Dispose();
            }
            return returnCode;
        }

        #endregion Update Operation
		
		#region Delete Operation

        async Task<long> Igen_faqcagetogyDataAccessObjects.Delete(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken)
        {
            long returnCode = -99;
           	const string SP = "gen_faqcagetogy_Del";
			
           	using (DbCommand cmd =  Database.GetStoredProcCommand(SP))
            {
				FillParameters(gen_faqcagetogy, cmd,Database, true);
                FillSequrityParameters(gen_faqcagetogy.BaseSecurityParam, cmd, Database);
				AddOutputParameter(cmd);
				try
                {
                   	IAsyncResult result = Database.BeginExecuteNonQuery(cmd, null, null);
                    while (!result.IsCompleted)
                    {
                    }
                    returnCode = Database.EndExecuteNonQuery(result);
                    returnCode = (Int64)(cmd.Parameters["@RETURN_KEY"].Value);
                }
                catch (Exception ex)
                {
                   throw GetDataAccessException(ex, SourceOfException("Igen_faqcagetogyDataAccess.Deletegen_faqcagetogy"));
                }
                cmd.Dispose();
            }
            return returnCode;
        }

		#endregion Delete Operation
        
        #region SaveList<>
		
        async Task<long> Igen_faqcagetogyDataAccessObjects.SaveList(IList<gen_faqcagetogyEntity> listAdded, IList<gen_faqcagetogyEntity> listUpdated, IList<gen_faqcagetogyEntity> listDeleted, CancellationToken cancellationToken)
        {
            long returnCode = -99;

            const string SPInsert = "gen_faqcagetogy_Ins";
            const string SPUpdate = "gen_faqcagetogy_Upd";
            const string SPDelete = "gen_faqcagetogy_Del";

            DbConnection connection = Database.CreateConnection();
            connection.Open();
            DbTransaction transaction = connection.BeginTransaction();
            
            try
            {
                if (listDeleted.Count > 0 )
                {
                    foreach (gen_faqcagetogyEntity gen_faqcagetogy in listDeleted)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPDelete))
                        {
                            FillParameters(gen_faqcagetogy, cmd, Database, true);
                            FillSequrityParameters(gen_faqcagetogy.BaseSecurityParam, cmd, Database);
                            AddOutputParameter(cmd);
                            
                            IAsyncResult result = Database.BeginExecuteNonQuery(cmd, transaction, null, null);
                            while (!result.IsCompleted)
                            {
                            }
                            returnCode = Database.EndExecuteNonQuery(result);
                            if (returnCode < 0)
                            { 
                                throw new ArgumentException("Error in transaction.");
                            }
                            cmd.Dispose();
                        }
                    }
                }
                if (listUpdated.Count > 0 )
                {
                    foreach (gen_faqcagetogyEntity gen_faqcagetogy in listUpdated)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPUpdate))
                        {
                            FillParameters(gen_faqcagetogy, cmd, Database);
                            FillSequrityParameters(gen_faqcagetogy.BaseSecurityParam, cmd, Database);
                            AddOutputParameter(cmd);
                            IAsyncResult result = Database.BeginExecuteNonQuery(cmd, transaction, null, null);
                            while (!result.IsCompleted)
                            {
                            }
                            returnCode = Database.EndExecuteNonQuery(result);
                            if (returnCode < 0)
                            {
                                 throw new ArgumentException("Error in transaction.");
                            }
                            cmd.Dispose();
                        }
                    }
                }
                if (listAdded.Count > 0 )
                {
                    foreach (gen_faqcagetogyEntity gen_faqcagetogy in listAdded)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPInsert))
                        {
                            FillParameters(gen_faqcagetogy, cmd, Database);
                            FillSequrityParameters(gen_faqcagetogy.BaseSecurityParam, cmd, Database);
                            AddOutputParameter(cmd);
                            
                            IAsyncResult result = Database.BeginExecuteNonQuery(cmd, transaction, null, null);
                            while (!result.IsCompleted)
                            {
                            }
                            returnCode = Database.EndExecuteNonQuery(result);
                            if (returnCode < 0)
                            {
                                 throw new ArgumentException("Error in transaction.");
                            }
                            cmd.Dispose();
                        }
                    }
                }

                transaction.Commit();
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                throw GetDataAccessException(ex, SourceOfException("Igen_faqcagetogyDataAccess.Save_gen_faqcagetogy"));
            }
            finally
            {
                transaction.Dispose();
                connection.Close();
                connection = null;
            }
            return returnCode;
        }
        
        
       public async Task<long> SaveList(
       Database db , 
       DbTransaction transaction,
       IList<gen_faqcagetogyEntity> listAdded, 
       IList<gen_faqcagetogyEntity> listUpdated, 
       IList<gen_faqcagetogyEntity> listDeleted, 
       CancellationToken cancellationToken) 
       {
            long returnCode = -99;

            const string SPInsert = "gen_faqcagetogy_Ins";
            const string SPUpdate = "gen_faqcagetogy_Upd";
            const string SPDelete = "gen_faqcagetogy_Del";

            
            
            try
            {
                if (listDeleted.Count > 0 )
                {
                    foreach (gen_faqcagetogyEntity gen_faqcagetogy in listDeleted)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPDelete))
                        {
                            FillParameters(gen_faqcagetogy, cmd, db, true);
                            FillSequrityParameters(gen_faqcagetogy.BaseSecurityParam, cmd, db);
                            AddOutputParameter(cmd);
                            IAsyncResult result = Database.BeginExecuteNonQuery(cmd, transaction, null, null);
                            while (!result.IsCompleted)
                            {
                            }
                            returnCode = Database.EndExecuteNonQuery(result);
                            if (returnCode < 0)
                            { 
                                  throw new ArgumentException("Error in transaction.");
                            }
                            cmd.Dispose();
                        }
                    }
                }
                if (listUpdated.Count > 0 )
                {
                    foreach (gen_faqcagetogyEntity gen_faqcagetogy in listUpdated)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPUpdate))
                        {
                            FillParameters(gen_faqcagetogy, cmd, db);
                            FillSequrityParameters(gen_faqcagetogy.BaseSecurityParam, cmd, db);
                            AddOutputParameter(cmd);
                            IAsyncResult result = Database.BeginExecuteNonQuery(cmd, transaction, null, null);
                            while (!result.IsCompleted)
                            {
                            }
                            returnCode = Database.EndExecuteNonQuery(result);
                            if (returnCode < 0)
                            {
                                 throw new ArgumentException("Error in transaction.");
                            }
                            cmd.Dispose();
                        }
                    }
                }
                if (listAdded.Count > 0 )
                {
                    foreach (gen_faqcagetogyEntity gen_faqcagetogy in listAdded)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPInsert))
                        {
                            FillParameters(gen_faqcagetogy, cmd, db);
                            FillSequrityParameters(gen_faqcagetogy.BaseSecurityParam, cmd, db);
                            AddOutputParameter(cmd);
                            
                            IAsyncResult result = Database.BeginExecuteNonQuery(cmd, transaction, null, null);
                            while (!result.IsCompleted)
                            {
                            }
                            returnCode = Database.EndExecuteNonQuery(result);
                            if (returnCode < 0)
                            {
                                 throw new ArgumentException("Error in transaction.");
                            }
                            cmd.Dispose();
                        }
                    }
                }

              
            }
            catch (Exception ex)
            {
               
                throw GetDataAccessException(ex, SourceOfException("Igen_faqcagetogyDataAccess.Save_gen_faqcagetogy"));
            }
            finally
            {
               
            }
            return returnCode;
        }
        
        #endregion SaveList<>
		
		#region GetAll

        async Task<IList<gen_faqcagetogyEntity>> Igen_faqcagetogyDataAccessObjects.GetAll(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken)
        {
           try
            {
				const string SP = "gen_faqcagetogy_GA";
                IList<gen_faqcagetogyEntity> itemList = new List<gen_faqcagetogyEntity>();
				using (DbCommand cmd = Database.GetStoredProcCommand(SP))
				{
					
					AddSortExpressionParameter(cmd, gen_faqcagetogy.SortExpression);
                    FillSequrityParameters(gen_faqcagetogy.BaseSecurityParam, cmd, Database);
                    FillParameters(gen_faqcagetogy, cmd, Database);
                    
                    IAsyncResult result = Database.BeginExecuteReader(cmd, null,null);
                    while (!result.IsCompleted)
                    {
                    }
                    using (IDataReader reader = Database.EndExecuteReader(result))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new gen_faqcagetogyEntity(reader));
                        }
                        reader.Close();
                    }                    
                    cmd.Dispose();
                    return itemList;
				}
			}
            catch (Exception ex)
            {
                throw GetDataAccessException(ex, SourceOfException("Igen_faqcagetogyDataAccess.GetAllgen_faqcagetogy"));
            }	
        }
		
        async Task<IList<gen_faqcagetogyEntity>> Igen_faqcagetogyDataAccessObjects.GetAllByPages(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken)
        {
        try
            {
				const string SP = "gen_faqcagetogy_GAPg";
				using (DbCommand cmd = Database.GetStoredProcCommand(SP))
				{
					AddTotalRecordParameter(cmd);
                    AddSortExpressionParameter(cmd, gen_faqcagetogy.SortExpression);
                    AddPageSizeParameter(cmd, gen_faqcagetogy.PageSize);
                    AddCurrentPageParameter(cmd, gen_faqcagetogy.CurrentPage);                    
                    FillSequrityParameters(gen_faqcagetogy.BaseSecurityParam, cmd, Database);
                    
					FillParameters(gen_faqcagetogy, cmd,Database);

                    IList<gen_faqcagetogyEntity> itemList = new List<gen_faqcagetogyEntity>();
                    
                    IAsyncResult result = Database.BeginExecuteReader(cmd, null,null);
                    while (!result.IsCompleted)
                    {
                    }
                    using (IDataReader reader = Database.EndExecuteReader(result))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new gen_faqcagetogyEntity(reader));
                        }
                        reader.Close();
                    }
                    if(itemList.Count>0)
					{
                        itemList[0].RETURN_KEY   = Convert.ToInt64(cmd.Parameters["@TotalRecord"].Value.ToString());
						gen_faqcagetogy.RETURN_KEY = Convert.ToInt64(cmd.Parameters["@TotalRecord"].Value.ToString());
                    }
                    cmd.Dispose();
                    return itemList;
				}
			}
            catch (Exception ex)
            {
                throw GetDataAccessException(ex, SourceOfException("Igen_faqcagetogyDataAccess.GetAllByPagesgen_faqcagetogy"));
            }
        }
        
        #endregion
        
        #region Save Master/Details
        
        
        async Task<long> Igen_faqcagetogyDataAccessObjects.SaveMasterDetgen_faq(gen_faqcagetogyEntity masterEntity, 
        IList<gen_faqEntity> listAdded, 
        IList<gen_faqEntity> listUpdated,
        IList<gen_faqEntity> listDeleted, 
        CancellationToken cancellationToken)
        {
			long returnCode = -99;
            Int64 PrimaryKeyMaster = -99;
            
            string SP = "";
            const string MasterSPInsert = "gen_faqcagetogy_Ins";
            const string MasterSPUpdate = "gen_faqcagetogy_Upd";
            const string MasterSPDelete = "gen_faqcagetogy_Del";
            
			
            DbConnection connection = Database.CreateConnection();
            connection.Open();
            DbTransaction transaction = connection.BeginTransaction();
			
            if (masterEntity.CurrentState == BaseEntity.EntityState.Added)
                SP = MasterSPInsert;
            else if (masterEntity.CurrentState == BaseEntity.EntityState.Changed)
                SP = MasterSPUpdate;
            else if (masterEntity.CurrentState == BaseEntity.EntityState.Deleted)
                 SP = MasterSPDelete;
            else
            {
                throw new Exception("Nothing to save.");
            }
            DateTime dt = DateTime.Now;
            
            try
            {
                using (DbCommand cmd = Database.GetStoredProcCommand(SP))
				{
                    if (masterEntity.CurrentState == BaseEntity.EntityState.Added || masterEntity.CurrentState == BaseEntity.EntityState.Changed)
                    {
                        FillParameters(masterEntity, cmd, Database);
                    }
                    else
                    {
                        FillParameters(masterEntity, cmd, Database, true);
                    }
                    FillSequrityParameters(masterEntity.BaseSecurityParam, cmd, Database);                    
                    AddOutputParameter(cmd, Database);
					
					if (masterEntity.CurrentState != BaseEntity.EntityState.Deleted)
                    {
                        IAsyncResult result = Database.BeginExecuteNonQuery(cmd, transaction, null, null);
                        while (!result.IsCompleted)
                        {
                        }
                        returnCode = Database.EndExecuteNonQuery(result);
                        PrimaryKeyMaster = (Int64)(cmd.Parameters["@RETURN_KEY"].Value);
                        masterEntity.RETURN_KEY = PrimaryKeyMaster;
                    }
                    else
                    {
                        returnCode = 1;
                    }
				
                    if (returnCode>0)
                    {
                        if (masterEntity.CurrentState != BaseEntity.EntityState.Deleted)
                        {
                            foreach (var item in listAdded)
                            {
                                item.faqcategoryid=PrimaryKeyMaster;
                            }
                        }
                        gen_faqDataAccessObjects objgen_faq=new gen_faqDataAccessObjects(this.Context);
                        objgen_faq.SaveList(Database, transaction, listAdded, listUpdated, listDeleted, cancellationToken);
                    }
                    if (masterEntity.CurrentState == BaseEntity.EntityState.Deleted)
                        returnCode = Database.ExecuteNonQuery(cmd, transaction);
                        cmd.Dispose();
                }
				transaction.Commit();                
			}
			catch (Exception ex)
            {
                transaction.Rollback();
                throw GetDataAccessException(ex, SourceOfException("Igen_faqcagetogyDataAccess.SaveDsgen_faqcagetogy"));
            }
            finally
            {
                transaction.Dispose();
                connection.Close();
                connection = null;
            }
            return returnCode;
		}
        
        #endregion
        
        
        #region Simple load Single Row
        async Task<gen_faqcagetogyEntity> Igen_faqcagetogyDataAccessObjects.GetSingle(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken)
        {
           try
            {
				const string SP = "gen_faqcagetogy_GS";
				using (DbCommand cmd = Database.GetStoredProcCommand(SP))
				{
                    FillSequrityParameters(gen_faqcagetogy.BaseSecurityParam, cmd, Database);
                    FillParameters(gen_faqcagetogy, cmd, Database);
                    
                    IList<gen_faqcagetogyEntity> itemList = new List<gen_faqcagetogyEntity>();
                    
                    IAsyncResult result = Database.BeginExecuteReader(cmd, null,null);
                    while (!result.IsCompleted)
                    {
                    }
                    using (IDataReader reader = Database.EndExecuteReader(result))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new gen_faqcagetogyEntity(reader));
                        }
                        reader.Close();
                    }                    
                    cmd.Dispose();
                    
                    if(itemList != null && itemList.Count > 0)
                        return itemList[0];
                    else
                        return null;
				}
			}
            catch (Exception ex)
            {
                throw GetDataAccessException(ex, SourceOfException("Igen_faqcagetogyDataAccess.GetSinglegen_faqcagetogy"));
            }	
        }
        #endregion
        
        #region ForListView Paged Method
        async Task<IList<gen_faqcagetogyEntity>> Igen_faqcagetogyDataAccessObjects.GAPgListView(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken)
        {
        try
            {
				const string SP = "gen_faqcagetogy_GAPgListView";
				using (DbCommand cmd = Database.GetStoredProcCommand(SP))
				{
					AddTotalRecordParameter(cmd);
                    AddSortExpressionParameter(cmd, gen_faqcagetogy.SortExpression);
                    AddPageSizeParameter(cmd, gen_faqcagetogy.PageSize);
                    AddCurrentPageParameter(cmd, gen_faqcagetogy.CurrentPage);                    
                    FillSequrityParameters(gen_faqcagetogy.BaseSecurityParam, cmd, Database);
                    
					FillParameters(gen_faqcagetogy, cmd,Database);
                    
					if (!string.IsNullOrEmpty (gen_faqcagetogy.strCommonSerachParam))
                        Database.AddInParameter(cmd, "@CommonSerachParam", DbType.String,  "%"+gen_faqcagetogy.strCommonSerachParam+"%");

                    IList<gen_faqcagetogyEntity> itemList = new List<gen_faqcagetogyEntity>();
					
                    IAsyncResult result = Database.BeginExecuteReader(cmd, null,null);
                    while (!result.IsCompleted)
                    {
                    }
                    using (IDataReader reader = Database.EndExecuteReader(result))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new gen_faqcagetogyEntity(reader));
                        }
                        reader.Close();
                    }
                    
                    if(itemList.Count>0)
					{
                        itemList[0].RETURN_KEY   = Convert.ToInt64(cmd.Parameters["@TotalRecord"].Value.ToString());
						gen_faqcagetogy.RETURN_KEY = Convert.ToInt64(cmd.Parameters["@TotalRecord"].Value.ToString());
                    }
                    cmd.Dispose();
                    return itemList;
				}
			}
            catch (Exception ex)
            {
                throw GetDataAccessException(ex, SourceOfException("Igen_faqcagetogyDataAccess.GAPgListViewgen_faqcagetogy"));
            }
        }
        #endregion
        
        #region Extras Reviewed, Published, Archived
        #endregion
	}
}
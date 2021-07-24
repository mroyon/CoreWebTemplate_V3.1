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
	
	internal sealed partial class gen_sertivetypeDataAccessObjects : BaseDataAccess, Igen_sertivetypeDataAccessObjects
	{
		
	    #region Constructors
        
		private string ClassName = "gen_sertivetypeDataAccessObjects";
        
		public gen_sertivetypeDataAccessObjects(Context context): base(context)
		{
		}
		
		private string SourceOfException(string methodName)
        {
            return "Class name: " + ClassName + " and Method name: " + methodName;
        }
        
		#endregion
		
        public static void FillParameters(gen_sertivetypeEntity gen_sertivetype, DbCommand cmd,Database Database,bool forDelete=false)
        {
			if (gen_sertivetype.servicetypeid.HasValue)
				Database.AddInParameter(cmd, "@ServiceTypeID", DbType.Int64, gen_sertivetype.servicetypeid);
            if (forDelete) return;
			if (!(string.IsNullOrEmpty(gen_sertivetype.servicetype)))
				Database.AddInParameter(cmd, "@ServiceType", DbType.String, gen_sertivetype.servicetype);
			if (!(string.IsNullOrEmpty(gen_sertivetype.description)))
				Database.AddInParameter(cmd, "@Description", DbType.String, gen_sertivetype.description);

        }
		
        
		#region Add Operation

        async Task<long> Igen_sertivetypeDataAccessObjects.Add(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken)
        {
            long returnCode = -99;
            const string SP = "gen_sertivetype_Ins";
			
			using (DbCommand cmd =  Database.GetStoredProcCommand(SP))
            {
                FillParameters(gen_sertivetype, cmd,Database);
                FillSequrityParameters(gen_sertivetype.BaseSecurityParam, cmd, Database);
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
                    throw GetDataAccessException(ex, SourceOfException("Igen_sertivetypeDataAccess.Addgen_sertivetype"));
                }
                cmd.Dispose();
            }
            return returnCode;
        }
       
        #endregion Add Operation
		
		#region Update Operation

        async Task<long> Igen_sertivetypeDataAccessObjects.Update(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken)
        {
           long returnCode = -99;
            const string SP = "gen_sertivetype_Upd";
			
            using (DbCommand cmd =  Database.GetStoredProcCommand(SP))
            {
			    FillParameters(gen_sertivetype, cmd,Database);
                FillSequrityParameters(gen_sertivetype.BaseSecurityParam, cmd, Database);
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
                    throw GetDataAccessException(ex, SourceOfException("Igen_sertivetypeDataAccess.Updategen_sertivetype"));
                }
                cmd.Dispose();
            }
            return returnCode;
        }

        #endregion Update Operation
		
		#region Delete Operation

        async Task<long> Igen_sertivetypeDataAccessObjects.Delete(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken)
        {
            long returnCode = -99;
           	const string SP = "gen_sertivetype_Del";
			
           	using (DbCommand cmd =  Database.GetStoredProcCommand(SP))
            {
				FillParameters(gen_sertivetype, cmd,Database, true);
                FillSequrityParameters(gen_sertivetype.BaseSecurityParam, cmd, Database);
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
                   throw GetDataAccessException(ex, SourceOfException("Igen_sertivetypeDataAccess.Deletegen_sertivetype"));
                }
                cmd.Dispose();
            }
            return returnCode;
        }

		#endregion Delete Operation
        
        #region SaveList<>
		
        async Task<long> Igen_sertivetypeDataAccessObjects.SaveList(IList<gen_sertivetypeEntity> listAdded, IList<gen_sertivetypeEntity> listUpdated, IList<gen_sertivetypeEntity> listDeleted, CancellationToken cancellationToken)
        {
            long returnCode = -99;

            const string SPInsert = "gen_sertivetype_Ins";
            const string SPUpdate = "gen_sertivetype_Upd";
            const string SPDelete = "gen_sertivetype_Del";

            DbConnection connection = Database.CreateConnection();
            connection.Open();
            DbTransaction transaction = connection.BeginTransaction();
            
            try
            {
                if (listDeleted.Count > 0 )
                {
                    foreach (gen_sertivetypeEntity gen_sertivetype in listDeleted)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPDelete))
                        {
                            FillParameters(gen_sertivetype, cmd, Database, true);
                            FillSequrityParameters(gen_sertivetype.BaseSecurityParam, cmd, Database);
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
                    foreach (gen_sertivetypeEntity gen_sertivetype in listUpdated)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPUpdate))
                        {
                            FillParameters(gen_sertivetype, cmd, Database);
                            FillSequrityParameters(gen_sertivetype.BaseSecurityParam, cmd, Database);
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
                    foreach (gen_sertivetypeEntity gen_sertivetype in listAdded)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPInsert))
                        {
                            FillParameters(gen_sertivetype, cmd, Database);
                            FillSequrityParameters(gen_sertivetype.BaseSecurityParam, cmd, Database);
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
                throw GetDataAccessException(ex, SourceOfException("Igen_sertivetypeDataAccess.Save_gen_sertivetype"));
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
       IList<gen_sertivetypeEntity> listAdded, 
       IList<gen_sertivetypeEntity> listUpdated, 
       IList<gen_sertivetypeEntity> listDeleted, 
       CancellationToken cancellationToken) 
       {
            long returnCode = -99;

            const string SPInsert = "gen_sertivetype_Ins";
            const string SPUpdate = "gen_sertivetype_Upd";
            const string SPDelete = "gen_sertivetype_Del";

            
            
            try
            {
                if (listDeleted.Count > 0 )
                {
                    foreach (gen_sertivetypeEntity gen_sertivetype in listDeleted)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPDelete))
                        {
                            FillParameters(gen_sertivetype, cmd, db, true);
                            FillSequrityParameters(gen_sertivetype.BaseSecurityParam, cmd, db);
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
                    foreach (gen_sertivetypeEntity gen_sertivetype in listUpdated)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPUpdate))
                        {
                            FillParameters(gen_sertivetype, cmd, db);
                            FillSequrityParameters(gen_sertivetype.BaseSecurityParam, cmd, db);
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
                    foreach (gen_sertivetypeEntity gen_sertivetype in listAdded)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPInsert))
                        {
                            FillParameters(gen_sertivetype, cmd, db);
                            FillSequrityParameters(gen_sertivetype.BaseSecurityParam, cmd, db);
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
               
                throw GetDataAccessException(ex, SourceOfException("Igen_sertivetypeDataAccess.Save_gen_sertivetype"));
            }
            finally
            {
               
            }
            return returnCode;
        }
        
        #endregion SaveList<>
		
		#region GetAll

        async Task<IList<gen_sertivetypeEntity>> Igen_sertivetypeDataAccessObjects.GetAll(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken)
        {
           try
            {
				const string SP = "gen_sertivetype_GA";
                IList<gen_sertivetypeEntity> itemList = new List<gen_sertivetypeEntity>();
				using (DbCommand cmd = Database.GetStoredProcCommand(SP))
				{
					
					AddSortExpressionParameter(cmd, gen_sertivetype.SortExpression);
                    FillSequrityParameters(gen_sertivetype.BaseSecurityParam, cmd, Database);
                    FillParameters(gen_sertivetype, cmd, Database);
                    
                    IAsyncResult result = Database.BeginExecuteReader(cmd, null,null);
                    while (!result.IsCompleted)
                    {
                    }
                    using (IDataReader reader = Database.EndExecuteReader(result))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new gen_sertivetypeEntity(reader));
                        }
                        reader.Close();
                    }                    
                    cmd.Dispose();
                    return itemList;
				}
			}
            catch (Exception ex)
            {
                throw GetDataAccessException(ex, SourceOfException("Igen_sertivetypeDataAccess.GetAllgen_sertivetype"));
            }	
        }
		
        async Task<IList<gen_sertivetypeEntity>> Igen_sertivetypeDataAccessObjects.GetAllByPages(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken)
        {
        try
            {
				const string SP = "gen_sertivetype_GAPg";
				using (DbCommand cmd = Database.GetStoredProcCommand(SP))
				{
					AddTotalRecordParameter(cmd);
                    AddSortExpressionParameter(cmd, gen_sertivetype.SortExpression);
                    AddPageSizeParameter(cmd, gen_sertivetype.PageSize);
                    AddCurrentPageParameter(cmd, gen_sertivetype.CurrentPage);                    
                    FillSequrityParameters(gen_sertivetype.BaseSecurityParam, cmd, Database);
                    
					FillParameters(gen_sertivetype, cmd,Database);

                    IList<gen_sertivetypeEntity> itemList = new List<gen_sertivetypeEntity>();
                    
                    IAsyncResult result = Database.BeginExecuteReader(cmd, null,null);
                    while (!result.IsCompleted)
                    {
                    }
                    using (IDataReader reader = Database.EndExecuteReader(result))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new gen_sertivetypeEntity(reader));
                        }
                        reader.Close();
                    }
                    if(itemList.Count>0)
					{
                        itemList[0].RETURN_KEY   = Convert.ToInt64(cmd.Parameters["@TotalRecord"].Value.ToString());
						gen_sertivetype.RETURN_KEY = Convert.ToInt64(cmd.Parameters["@TotalRecord"].Value.ToString());
                    }
                    cmd.Dispose();
                    return itemList;
				}
			}
            catch (Exception ex)
            {
                throw GetDataAccessException(ex, SourceOfException("Igen_sertivetypeDataAccess.GetAllByPagesgen_sertivetype"));
            }
        }
        
        #endregion
        
        #region Save Master/Details
        
        
        async Task<long> Igen_sertivetypeDataAccessObjects.SaveMasterDetgen_services(gen_sertivetypeEntity masterEntity, 
        IList<gen_servicesEntity> listAdded, 
        IList<gen_servicesEntity> listUpdated,
        IList<gen_servicesEntity> listDeleted, 
        CancellationToken cancellationToken)
        {
			long returnCode = -99;
            Int64 PrimaryKeyMaster = -99;
            
            string SP = "";
            const string MasterSPInsert = "gen_sertivetype_Ins";
            const string MasterSPUpdate = "gen_sertivetype_Upd";
            const string MasterSPDelete = "gen_sertivetype_Del";
            
			
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
                                item.servicetypeid=PrimaryKeyMaster;
                            }
                        }
                        gen_servicesDataAccessObjects objgen_services=new gen_servicesDataAccessObjects(this.Context);
                        objgen_services.SaveList(Database, transaction, listAdded, listUpdated, listDeleted, cancellationToken);
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
                throw GetDataAccessException(ex, SourceOfException("Igen_sertivetypeDataAccess.SaveDsgen_sertivetype"));
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
        async Task<gen_sertivetypeEntity> Igen_sertivetypeDataAccessObjects.GetSingle(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken)
        {
           try
            {
				const string SP = "gen_sertivetype_GS";
				using (DbCommand cmd = Database.GetStoredProcCommand(SP))
				{
                    FillSequrityParameters(gen_sertivetype.BaseSecurityParam, cmd, Database);
                    FillParameters(gen_sertivetype, cmd, Database);
                    
                    IList<gen_sertivetypeEntity> itemList = new List<gen_sertivetypeEntity>();
                    
                    IAsyncResult result = Database.BeginExecuteReader(cmd, null,null);
                    while (!result.IsCompleted)
                    {
                    }
                    using (IDataReader reader = Database.EndExecuteReader(result))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new gen_sertivetypeEntity(reader));
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
                throw GetDataAccessException(ex, SourceOfException("Igen_sertivetypeDataAccess.GetSinglegen_sertivetype"));
            }	
        }
        #endregion
        
        #region ForListView Paged Method
        async Task<IList<gen_sertivetypeEntity>> Igen_sertivetypeDataAccessObjects.GAPgListView(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken)
        {
        try
            {
				const string SP = "gen_sertivetype_GAPgListView";
				using (DbCommand cmd = Database.GetStoredProcCommand(SP))
				{
					AddTotalRecordParameter(cmd);
                    AddSortExpressionParameter(cmd, gen_sertivetype.SortExpression);
                    AddPageSizeParameter(cmd, gen_sertivetype.PageSize);
                    AddCurrentPageParameter(cmd, gen_sertivetype.CurrentPage);                    
                    FillSequrityParameters(gen_sertivetype.BaseSecurityParam, cmd, Database);
                    
					FillParameters(gen_sertivetype, cmd,Database);
                    
					if (!string.IsNullOrEmpty (gen_sertivetype.strCommonSerachParam))
                        Database.AddInParameter(cmd, "@CommonSerachParam", DbType.String,  "%"+gen_sertivetype.strCommonSerachParam+"%");

                    IList<gen_sertivetypeEntity> itemList = new List<gen_sertivetypeEntity>();
					
                    IAsyncResult result = Database.BeginExecuteReader(cmd, null,null);
                    while (!result.IsCompleted)
                    {
                    }
                    using (IDataReader reader = Database.EndExecuteReader(result))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new gen_sertivetypeEntity(reader));
                        }
                        reader.Close();
                    }
                    
                    if(itemList.Count>0)
					{
                        itemList[0].RETURN_KEY   = Convert.ToInt64(cmd.Parameters["@TotalRecord"].Value.ToString());
						gen_sertivetype.RETURN_KEY = Convert.ToInt64(cmd.Parameters["@TotalRecord"].Value.ToString());
                    }
                    cmd.Dispose();
                    return itemList;
				}
			}
            catch (Exception ex)
            {
                throw GetDataAccessException(ex, SourceOfException("Igen_sertivetypeDataAccess.GAPgListViewgen_sertivetype"));
            }
        }
        #endregion
        
        #region Extras Reviewed, Published, Archived
        #endregion
	}
}
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

namespace DAC.Core.DataAccessObjects.General
{
	/// <summary>
    /// Un touched: From Generator
    /// KAF Information Center
    /// </summary>
	
	internal sealed partial class gen_linkedserviceDataAccessObjects : BaseDataAccess, Igen_linkedserviceDataAccessObjects
	{
		
	    #region Constructors
        
		private string ClassName = "gen_linkedserviceDataAccessObjects";
        
		public gen_linkedserviceDataAccessObjects(Context context): base(context)
		{
		}
		
		private string SourceOfException(string methodName)
        {
            return "Class name: " + ClassName + " and Method name: " + methodName;
        }
        
		#endregion
		
        public static void FillParameters(gen_linkedserviceEntity gen_linkedservice, DbCommand cmd,Database Database,bool forDelete=false)
        {
			if (gen_linkedservice.linkedserviceid.HasValue)
				Database.AddInParameter(cmd, "@LinkedServiceID", DbType.Int64, gen_linkedservice.linkedserviceid);
            if (forDelete) return;
			if (!(string.IsNullOrEmpty(gen_linkedservice.linkedservicenameen)))
				Database.AddInParameter(cmd, "@LinkedServiceNameEN", DbType.String, gen_linkedservice.linkedservicenameen);
			if (!(string.IsNullOrEmpty(gen_linkedservice.linkedservicenamear)))
				Database.AddInParameter(cmd, "@LinkedServiceNameAR", DbType.String, gen_linkedservice.linkedservicenamear);
			if (!(string.IsNullOrEmpty(gen_linkedservice.linkservicelogopath)))
				Database.AddInParameter(cmd, "@LinkServiceLOGOPath", DbType.String, gen_linkedservice.linkservicelogopath);
			if (!(string.IsNullOrEmpty(gen_linkedservice.linkedservicehyperlink)))
				Database.AddInParameter(cmd, "@LinkedServiceHyperLink", DbType.String, gen_linkedservice.linkedservicehyperlink);
			if (!(string.IsNullOrEmpty(gen_linkedservice.urlopentarget)))
				Database.AddInParameter(cmd, "@URLOpenTarget", DbType.String, gen_linkedservice.urlopentarget);

        }
		
        
		#region Add Operation

        async Task<long> Igen_linkedserviceDataAccessObjects.Add(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken)
        {
            long returnCode = -99;
            const string SP = "gen_linkedservice_Ins";
			
			using (DbCommand cmd =  Database.GetStoredProcCommand(SP))
            {
                FillParameters(gen_linkedservice, cmd,Database);
                FillSequrityParameters(gen_linkedservice.BaseSecurityParam, cmd, Database);
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
                    throw GetDataAccessException(ex, SourceOfException("Igen_linkedserviceDataAccess.Addgen_linkedservice"));
                }
                cmd.Dispose();
            }
            return returnCode;
        }
       
        #endregion Add Operation
		
		#region Update Operation

        async Task<long> Igen_linkedserviceDataAccessObjects.Update(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken)
        {
           long returnCode = -99;
            const string SP = "gen_linkedservice_Upd";
			
            using (DbCommand cmd =  Database.GetStoredProcCommand(SP))
            {
			    FillParameters(gen_linkedservice, cmd,Database);
                FillSequrityParameters(gen_linkedservice.BaseSecurityParam, cmd, Database);
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
                    throw GetDataAccessException(ex, SourceOfException("Igen_linkedserviceDataAccess.Updategen_linkedservice"));
                }
                cmd.Dispose();
            }
            return returnCode;
        }

        #endregion Update Operation
		
		#region Delete Operation

        async Task<long> Igen_linkedserviceDataAccessObjects.Delete(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken)
        {
            long returnCode = -99;
           	const string SP = "gen_linkedservice_Del";
			
           	using (DbCommand cmd =  Database.GetStoredProcCommand(SP))
            {
				FillParameters(gen_linkedservice, cmd,Database, true);
                FillSequrityParameters(gen_linkedservice.BaseSecurityParam, cmd, Database);
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
                   throw GetDataAccessException(ex, SourceOfException("Igen_linkedserviceDataAccess.Deletegen_linkedservice"));
                }
                cmd.Dispose();
            }
            return returnCode;
        }

		#endregion Delete Operation
        
        #region SaveList<>
		
        async Task<long> Igen_linkedserviceDataAccessObjects.SaveList(IList<gen_linkedserviceEntity> listAdded, IList<gen_linkedserviceEntity> listUpdated, IList<gen_linkedserviceEntity> listDeleted, CancellationToken cancellationToken)
        {
            long returnCode = -99;

            const string SPInsert = "gen_linkedservice_Ins";
            const string SPUpdate = "gen_linkedservice_Upd";
            const string SPDelete = "gen_linkedservice_Del";

            DbConnection connection = Database.CreateConnection();
            connection.Open();
            DbTransaction transaction = connection.BeginTransaction();
            
            try
            {
                if (listDeleted.Count > 0 )
                {
                    foreach (gen_linkedserviceEntity gen_linkedservice in listDeleted)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPDelete))
                        {
                            FillParameters(gen_linkedservice, cmd, Database, true);
                            FillSequrityParameters(gen_linkedservice.BaseSecurityParam, cmd, Database);
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
                    foreach (gen_linkedserviceEntity gen_linkedservice in listUpdated)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPUpdate))
                        {
                            FillParameters(gen_linkedservice, cmd, Database);
                            FillSequrityParameters(gen_linkedservice.BaseSecurityParam, cmd, Database);
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
                    foreach (gen_linkedserviceEntity gen_linkedservice in listAdded)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPInsert))
                        {
                            FillParameters(gen_linkedservice, cmd, Database);
                            FillSequrityParameters(gen_linkedservice.BaseSecurityParam, cmd, Database);
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
                throw GetDataAccessException(ex, SourceOfException("Igen_linkedserviceDataAccess.Save_gen_linkedservice"));
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
       IList<gen_linkedserviceEntity> listAdded, 
       IList<gen_linkedserviceEntity> listUpdated, 
       IList<gen_linkedserviceEntity> listDeleted, 
       CancellationToken cancellationToken) 
       {
            long returnCode = -99;

            const string SPInsert = "gen_linkedservice_Ins";
            const string SPUpdate = "gen_linkedservice_Upd";
            const string SPDelete = "gen_linkedservice_Del";

            
            
            try
            {
                if (listDeleted.Count > 0 )
                {
                    foreach (gen_linkedserviceEntity gen_linkedservice in listDeleted)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPDelete))
                        {
                            FillParameters(gen_linkedservice, cmd, db, true);
                            FillSequrityParameters(gen_linkedservice.BaseSecurityParam, cmd, db);
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
                    foreach (gen_linkedserviceEntity gen_linkedservice in listUpdated)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPUpdate))
                        {
                            FillParameters(gen_linkedservice, cmd, db);
                            FillSequrityParameters(gen_linkedservice.BaseSecurityParam, cmd, db);
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
                    foreach (gen_linkedserviceEntity gen_linkedservice in listAdded)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPInsert))
                        {
                            FillParameters(gen_linkedservice, cmd, db);
                            FillSequrityParameters(gen_linkedservice.BaseSecurityParam, cmd, db);
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
               
                throw GetDataAccessException(ex, SourceOfException("Igen_linkedserviceDataAccess.Save_gen_linkedservice"));
            }
            finally
            {
               
            }
            return returnCode;
        }
        
        #endregion SaveList<>
		
		#region GetAll

        async Task<IList<gen_linkedserviceEntity>> Igen_linkedserviceDataAccessObjects.GetAll(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken)
        {
           try
            {
				const string SP = "gen_linkedservice_GA";
                IList<gen_linkedserviceEntity> itemList = new List<gen_linkedserviceEntity>();
				using (DbCommand cmd = Database.GetStoredProcCommand(SP))
				{
					
					AddSortExpressionParameter(cmd, gen_linkedservice.SortExpression);
                    FillSequrityParameters(gen_linkedservice.BaseSecurityParam, cmd, Database);
                    FillParameters(gen_linkedservice, cmd, Database);
                    
                    IAsyncResult result = Database.BeginExecuteReader(cmd, null,null);
                    while (!result.IsCompleted)
                    {
                    }
                    using (IDataReader reader = Database.EndExecuteReader(result))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new gen_linkedserviceEntity(reader));
                        }
                        reader.Close();
                    }                    
                    cmd.Dispose();
                    return itemList;
				}
			}
            catch (Exception ex)
            {
                throw GetDataAccessException(ex, SourceOfException("Igen_linkedserviceDataAccess.GetAllgen_linkedservice"));
            }	
        }
		
        async Task<IList<gen_linkedserviceEntity>> Igen_linkedserviceDataAccessObjects.GetAllByPages(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken)
        {
        try
            {
				const string SP = "gen_linkedservice_GAPg";
				using (DbCommand cmd = Database.GetStoredProcCommand(SP))
				{
					AddTotalRecordParameter(cmd);
                    AddSortExpressionParameter(cmd, gen_linkedservice.SortExpression);
                    AddPageSizeParameter(cmd, gen_linkedservice.PageSize);
                    AddCurrentPageParameter(cmd, gen_linkedservice.CurrentPage);                    
                    FillSequrityParameters(gen_linkedservice.BaseSecurityParam, cmd, Database);
                    
					FillParameters(gen_linkedservice, cmd,Database);

                    IList<gen_linkedserviceEntity> itemList = new List<gen_linkedserviceEntity>();
                    
                    IAsyncResult result = Database.BeginExecuteReader(cmd, null,null);
                    while (!result.IsCompleted)
                    {
                    }
                    using (IDataReader reader = Database.EndExecuteReader(result))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new gen_linkedserviceEntity(reader));
                        }
                        reader.Close();
                    }
                    if(itemList.Count>0)
					{
                        itemList[0].RETURN_KEY   = Convert.ToInt64(cmd.Parameters["@TotalRecord"].Value.ToString());
						gen_linkedservice.RETURN_KEY = Convert.ToInt64(cmd.Parameters["@TotalRecord"].Value.ToString());
                    }
                    cmd.Dispose();
                    return itemList;
				}
			}
            catch (Exception ex)
            {
                throw GetDataAccessException(ex, SourceOfException("Igen_linkedserviceDataAccess.GetAllByPagesgen_linkedservice"));
            }
        }
        
        #endregion
        
        #region Save Master/Details
        
        #endregion
        
        
        #region Simple load Single Row
        async Task<gen_linkedserviceEntity> Igen_linkedserviceDataAccessObjects.GetSingle(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken)
        {
           try
            {
				const string SP = "gen_linkedservice_GS";
				using (DbCommand cmd = Database.GetStoredProcCommand(SP))
				{
                    FillSequrityParameters(gen_linkedservice.BaseSecurityParam, cmd, Database);
                    FillParameters(gen_linkedservice, cmd, Database);
                    
                    IList<gen_linkedserviceEntity> itemList = new List<gen_linkedserviceEntity>();
                    
                    IAsyncResult result = Database.BeginExecuteReader(cmd, null,null);
                    while (!result.IsCompleted)
                    {
                    }
                    using (IDataReader reader = Database.EndExecuteReader(result))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new gen_linkedserviceEntity(reader));
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
                throw GetDataAccessException(ex, SourceOfException("Igen_linkedserviceDataAccess.GetSinglegen_linkedservice"));
            }	
        }
        #endregion
        
        #region ForListView Paged Method
        async Task<IList<gen_linkedserviceEntity>> Igen_linkedserviceDataAccessObjects.GAPgListView(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken)
        {
        try
            {
				const string SP = "gen_linkedservice_GAPgListView";
				using (DbCommand cmd = Database.GetStoredProcCommand(SP))
				{
					AddTotalRecordParameter(cmd);
                    AddSortExpressionParameter(cmd, gen_linkedservice.SortExpression);
                    AddPageSizeParameter(cmd, gen_linkedservice.PageSize);
                    AddCurrentPageParameter(cmd, gen_linkedservice.CurrentPage);                    
                    FillSequrityParameters(gen_linkedservice.BaseSecurityParam, cmd, Database);
                    
					FillParameters(gen_linkedservice, cmd,Database);
                    
					if (!string.IsNullOrEmpty (gen_linkedservice.strCommonSerachParam))
                        Database.AddInParameter(cmd, "@CommonSerachParam", DbType.String,  "%"+gen_linkedservice.strCommonSerachParam+"%");

                    IList<gen_linkedserviceEntity> itemList = new List<gen_linkedserviceEntity>();
					
                    IAsyncResult result = Database.BeginExecuteReader(cmd, null,null);
                    while (!result.IsCompleted)
                    {
                    }
                    using (IDataReader reader = Database.EndExecuteReader(result))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new gen_linkedserviceEntity(reader));
                        }
                        reader.Close();
                    }
                    
                    if(itemList.Count>0)
					{
                        itemList[0].RETURN_KEY   = Convert.ToInt64(cmd.Parameters["@TotalRecord"].Value.ToString());
						gen_linkedservice.RETURN_KEY = Convert.ToInt64(cmd.Parameters["@TotalRecord"].Value.ToString());
                    }
                    cmd.Dispose();
                    return itemList;
				}
			}
            catch (Exception ex)
            {
                throw GetDataAccessException(ex, SourceOfException("Igen_linkedserviceDataAccess.GAPgListViewgen_linkedservice"));
            }
        }
        #endregion
        
        #region Extras Reviewed, Published, Archived
        #endregion
	}
}
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
	
	internal sealed partial class gen_doctypeDataAccessObjects : BaseDataAccess, Igen_doctypeDataAccessObjects
	{
		
	    #region Constructors
        
		private string ClassName = "gen_doctypeDataAccessObjects";
        
		public gen_doctypeDataAccessObjects(Context context): base(context)
		{
		}
		
		private string SourceOfException(string methodName)
        {
            return "Class name: " + ClassName + " and Method name: " + methodName;
        }
        
		#endregion
		
        public static void FillParameters(gen_doctypeEntity gen_doctype, DbCommand cmd,Database Database,bool forDelete=false)
        {
			if (gen_doctype.doctypeid.HasValue)
				Database.AddInParameter(cmd, "@DocTypeID", DbType.Int64, gen_doctype.doctypeid);
            if (forDelete) return;
			if (!(string.IsNullOrEmpty(gen_doctype.docname)))
				Database.AddInParameter(cmd, "@DocName", DbType.String, gen_doctype.docname);
			if (gen_doctype.docpriority.HasValue)
				Database.AddInParameter(cmd, "@DocPriority", DbType.Int64, gen_doctype.docpriority);
			if (!(string.IsNullOrEmpty(gen_doctype.remarks)))
				Database.AddInParameter(cmd, "@Remarks", DbType.String, gen_doctype.remarks);

        }
		
        
		#region Add Operation

        async Task<long> Igen_doctypeDataAccessObjects.Add(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken)
        {
            long returnCode = -99;
            const string SP = "gen_doctype_Ins";
			
			using (DbCommand cmd =  Database.GetStoredProcCommand(SP))
            {
                FillParameters(gen_doctype, cmd,Database);
                FillSequrityParameters(gen_doctype.BaseSecurityParam, cmd, Database);
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
                    throw GetDataAccessException(ex, SourceOfException("Igen_doctypeDataAccess.Addgen_doctype"));
                }
                cmd.Dispose();
            }
            return returnCode;
        }
       
        #endregion Add Operation
		
		#region Update Operation

        async Task<long> Igen_doctypeDataAccessObjects.Update(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken)
        {
           long returnCode = -99;
            const string SP = "gen_doctype_Upd";
			
            using (DbCommand cmd =  Database.GetStoredProcCommand(SP))
            {
			    FillParameters(gen_doctype, cmd,Database);
                FillSequrityParameters(gen_doctype.BaseSecurityParam, cmd, Database);
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
                    throw GetDataAccessException(ex, SourceOfException("Igen_doctypeDataAccess.Updategen_doctype"));
                }
                cmd.Dispose();
            }
            return returnCode;
        }

        #endregion Update Operation
		
		#region Delete Operation

        async Task<long> Igen_doctypeDataAccessObjects.Delete(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken)
        {
            long returnCode = -99;
           	const string SP = "gen_doctype_Del";
			
           	using (DbCommand cmd =  Database.GetStoredProcCommand(SP))
            {
				FillParameters(gen_doctype, cmd,Database, true);
                FillSequrityParameters(gen_doctype.BaseSecurityParam, cmd, Database);
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
                   throw GetDataAccessException(ex, SourceOfException("Igen_doctypeDataAccess.Deletegen_doctype"));
                }
                cmd.Dispose();
            }
            return returnCode;
        }

		#endregion Delete Operation
        
        #region SaveList<>
		
        async Task<long> Igen_doctypeDataAccessObjects.SaveList(IList<gen_doctypeEntity> listAdded, IList<gen_doctypeEntity> listUpdated, IList<gen_doctypeEntity> listDeleted, CancellationToken cancellationToken)
        {
            long returnCode = -99;

            const string SPInsert = "gen_doctype_Ins";
            const string SPUpdate = "gen_doctype_Upd";
            const string SPDelete = "gen_doctype_Del";

            DbConnection connection = Database.CreateConnection();
            connection.Open();
            DbTransaction transaction = connection.BeginTransaction();
            
            try
            {
                if (listDeleted.Count > 0 )
                {
                    foreach (gen_doctypeEntity gen_doctype in listDeleted)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPDelete))
                        {
                            FillParameters(gen_doctype, cmd, Database, true);
                            FillSequrityParameters(gen_doctype.BaseSecurityParam, cmd, Database);
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
                    foreach (gen_doctypeEntity gen_doctype in listUpdated)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPUpdate))
                        {
                            FillParameters(gen_doctype, cmd, Database);
                            FillSequrityParameters(gen_doctype.BaseSecurityParam, cmd, Database);
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
                    foreach (gen_doctypeEntity gen_doctype in listAdded)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPInsert))
                        {
                            FillParameters(gen_doctype, cmd, Database);
                            FillSequrityParameters(gen_doctype.BaseSecurityParam, cmd, Database);
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
                throw GetDataAccessException(ex, SourceOfException("Igen_doctypeDataAccess.Save_gen_doctype"));
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
       IList<gen_doctypeEntity> listAdded, 
       IList<gen_doctypeEntity> listUpdated, 
       IList<gen_doctypeEntity> listDeleted, 
       CancellationToken cancellationToken) 
       {
            long returnCode = -99;

            const string SPInsert = "gen_doctype_Ins";
            const string SPUpdate = "gen_doctype_Upd";
            const string SPDelete = "gen_doctype_Del";

            
            
            try
            {
                if (listDeleted.Count > 0 )
                {
                    foreach (gen_doctypeEntity gen_doctype in listDeleted)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPDelete))
                        {
                            FillParameters(gen_doctype, cmd, db, true);
                            FillSequrityParameters(gen_doctype.BaseSecurityParam, cmd, db);
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
                    foreach (gen_doctypeEntity gen_doctype in listUpdated)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPUpdate))
                        {
                            FillParameters(gen_doctype, cmd, db);
                            FillSequrityParameters(gen_doctype.BaseSecurityParam, cmd, db);
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
                    foreach (gen_doctypeEntity gen_doctype in listAdded)
                    {
                        using (DbCommand cmd = Database.GetStoredProcCommand(SPInsert))
                        {
                            FillParameters(gen_doctype, cmd, db);
                            FillSequrityParameters(gen_doctype.BaseSecurityParam, cmd, db);
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
               
                throw GetDataAccessException(ex, SourceOfException("Igen_doctypeDataAccess.Save_gen_doctype"));
            }
            finally
            {
               
            }
            return returnCode;
        }
        
        #endregion SaveList<>
		
		#region GetAll

        async Task<IList<gen_doctypeEntity>> Igen_doctypeDataAccessObjects.GetAll(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken)
        {
           try
            {
				const string SP = "gen_doctype_GA";
                IList<gen_doctypeEntity> itemList = new List<gen_doctypeEntity>();
				using (DbCommand cmd = Database.GetStoredProcCommand(SP))
				{
					
					AddSortExpressionParameter(cmd, gen_doctype.SortExpression);
                    FillSequrityParameters(gen_doctype.BaseSecurityParam, cmd, Database);
                    FillParameters(gen_doctype, cmd, Database);
                    
                    IAsyncResult result = Database.BeginExecuteReader(cmd, null,null);
                    while (!result.IsCompleted)
                    {
                    }
                    using (IDataReader reader = Database.EndExecuteReader(result))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new gen_doctypeEntity(reader));
                        }
                        reader.Close();
                    }                    
                    cmd.Dispose();
                    return itemList;
				}
			}
            catch (Exception ex)
            {
                throw GetDataAccessException(ex, SourceOfException("Igen_doctypeDataAccess.GetAllgen_doctype"));
            }	
        }
		
        async Task<IList<gen_doctypeEntity>> Igen_doctypeDataAccessObjects.GetAllByPages(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken)
        {
        try
            {
				const string SP = "gen_doctype_GAPg";
				using (DbCommand cmd = Database.GetStoredProcCommand(SP))
				{
					AddTotalRecordParameter(cmd);
                    AddSortExpressionParameter(cmd, gen_doctype.SortExpression);
                    AddPageSizeParameter(cmd, gen_doctype.PageSize);
                    AddCurrentPageParameter(cmd, gen_doctype.CurrentPage);                    
                    FillSequrityParameters(gen_doctype.BaseSecurityParam, cmd, Database);
                    
					FillParameters(gen_doctype, cmd,Database);

                    IList<gen_doctypeEntity> itemList = new List<gen_doctypeEntity>();
                    
                    IAsyncResult result = Database.BeginExecuteReader(cmd, null,null);
                    while (!result.IsCompleted)
                    {
                    }
                    using (IDataReader reader = Database.EndExecuteReader(result))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new gen_doctypeEntity(reader));
                        }
                        reader.Close();
                    }
                    if(itemList.Count>0)
					{
                        itemList[0].RETURN_KEY   = Convert.ToInt64(cmd.Parameters["@TotalRecord"].Value.ToString());
						gen_doctype.RETURN_KEY = Convert.ToInt64(cmd.Parameters["@TotalRecord"].Value.ToString());
                    }
                    cmd.Dispose();
                    return itemList;
				}
			}
            catch (Exception ex)
            {
                throw GetDataAccessException(ex, SourceOfException("Igen_doctypeDataAccess.GetAllByPagesgen_doctype"));
            }
        }
        
        #endregion
        
        #region Save Master/Details
        
        #endregion
        
        
        #region Simple load Single Row
        async Task<gen_doctypeEntity> Igen_doctypeDataAccessObjects.GetSingle(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken)
        {
           try
            {
				const string SP = "gen_doctype_GS";
				using (DbCommand cmd = Database.GetStoredProcCommand(SP))
				{
                    FillSequrityParameters(gen_doctype.BaseSecurityParam, cmd, Database);
                    FillParameters(gen_doctype, cmd, Database);
                    
                    IList<gen_doctypeEntity> itemList = new List<gen_doctypeEntity>();
                    
                    IAsyncResult result = Database.BeginExecuteReader(cmd, null,null);
                    while (!result.IsCompleted)
                    {
                    }
                    using (IDataReader reader = Database.EndExecuteReader(result))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new gen_doctypeEntity(reader));
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
                throw GetDataAccessException(ex, SourceOfException("Igen_doctypeDataAccess.GetSinglegen_doctype"));
            }	
        }
        #endregion
        
        #region ForListView Paged Method
        async Task<IList<gen_doctypeEntity>> Igen_doctypeDataAccessObjects.GAPgListView(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken)
        {
        try
            {
				const string SP = "gen_doctype_GAPgListView";
				using (DbCommand cmd = Database.GetStoredProcCommand(SP))
				{
					AddTotalRecordParameter(cmd);
                    AddSortExpressionParameter(cmd, gen_doctype.SortExpression);
                    AddPageSizeParameter(cmd, gen_doctype.PageSize);
                    AddCurrentPageParameter(cmd, gen_doctype.CurrentPage);                    
                    FillSequrityParameters(gen_doctype.BaseSecurityParam, cmd, Database);
                    
					FillParameters(gen_doctype, cmd,Database);
                    
					if (!string.IsNullOrEmpty (gen_doctype.strCommonSerachParam))
                        Database.AddInParameter(cmd, "@CommonSerachParam", DbType.String,  "%"+gen_doctype.strCommonSerachParam+"%");

                    IList<gen_doctypeEntity> itemList = new List<gen_doctypeEntity>();
					
                    IAsyncResult result = Database.BeginExecuteReader(cmd, null,null);
                    while (!result.IsCompleted)
                    {
                    }
                    using (IDataReader reader = Database.EndExecuteReader(result))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new gen_doctypeEntity(reader));
                        }
                        reader.Close();
                    }
                    
                    if(itemList.Count>0)
					{
                        itemList[0].RETURN_KEY   = Convert.ToInt64(cmd.Parameters["@TotalRecord"].Value.ToString());
						gen_doctype.RETURN_KEY = Convert.ToInt64(cmd.Parameters["@TotalRecord"].Value.ToString());
                    }
                    cmd.Dispose();
                    return itemList;
				}
			}
            catch (Exception ex)
            {
                throw GetDataAccessException(ex, SourceOfException("Igen_doctypeDataAccess.GAPgListViewgen_doctype"));
            }
        }
        #endregion
        
        #region Extras Reviewed, Published, Archived
        #endregion
	}
}
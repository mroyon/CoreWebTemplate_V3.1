

using AppConfig.ConfigDAAC;
using BDO.Base;
using BDO.DataAccessObjects.Models;
using BFO.Base;
using DAC.Core.CoreFactory;
using IBFO.Core.IBusinessFacadeObjects.General;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Threading;
using System.Threading.Tasks;

namespace BFO.Core.BusinessFacadeObjects.General
{
    public sealed partial class gen_linkedserviceFacadeObjects : BaseFacade, Igen_linkedserviceFacadeObjects
    {
	
		#region Instance Variables
		private string ClassName = "gen_linkedserviceFacadeObjects";
        private bool _isDisposed;
        private Context _currentContext;

        private BaseDataAccessFactory _dataAccessFactory;

        #endregion

        #region Private Properties

        private Context CurrentContext
        {
            [DebuggerStepThrough()]
            get
            {
                if (_currentContext == null)
                {
                    _currentContext = new Context();
                }

                return _currentContext;
            }
        }

        private BaseDataAccessFactory DataAccessFactory
        {
            [DebuggerStepThrough()]
            get
            {
                if (_dataAccessFactory == null)
                {
                    _dataAccessFactory = BaseDataAccessFactory.Create(CurrentContext);
                }

                return _dataAccessFactory;
            }
        }

        #endregion

        #region Constructer & Destructor

        public gen_linkedserviceFacadeObjects()
            : base()
        {
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        private void Dispose(bool disposing)
        {
            if (!_isDisposed)
            {
                if (disposing)
                {
                    if (_currentContext != null)
                    {
                        _currentContext.Dispose();
                    }
                }
            }

            _isDisposed = true;
        }

        ~gen_linkedserviceFacadeObjects()
        {
            Dispose(false);
        }
		
		private string SourceOfException(string methodName)
        {
            return "Class name: " + ClassName + " and Method name: " + methodName;
        }
        #endregion
		
		#region Business Facade
		
		#region Save Update Delete List	
		
		async Task<long> Igen_linkedserviceFacadeObjects.Delete(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken)
		{
			try
            {
				return await DataAccessFactory.Creategen_linkedserviceDataAccess().Delete(gen_linkedservice, cancellationToken);
			}
            
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("Igen_linkedserviceFacade.Deletegen_linkedservice"));
            }
        }
		
		async Task<long> Igen_linkedserviceFacadeObjects.Update(gen_linkedserviceEntity gen_linkedservice , CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_linkedserviceDataAccess().Update(gen_linkedservice,cancellationToken);
			}
           
            catch (Exception ex)
            {
               throw GetFacadeException(ex, SourceOfException("Igen_linkedserviceFacade.Updategen_linkedservice"));
            }
		}
		
		async Task<long> Igen_linkedserviceFacadeObjects.Add(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_linkedserviceDataAccess().Add(gen_linkedservice, cancellationToken);
			}
           
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("Igen_linkedserviceFacade.Addgen_linkedservice"));
            }
		}
		
        async Task<long> Igen_linkedserviceFacadeObjects.SaveList(List<gen_linkedserviceEntity> list, CancellationToken cancellationToken)
        {
            try
            {
                IList<gen_linkedserviceEntity> listAdded = list.FindAll(Item => Item.CurrentState == BaseEntity.EntityState.Added);
                IList<gen_linkedserviceEntity> listUpdated = list.FindAll(Item => Item.CurrentState == BaseEntity.EntityState.Changed);
                IList<gen_linkedserviceEntity> listDeleted = list.FindAll(Item => Item.CurrentState == BaseEntity.EntityState.Deleted);
               
                return await DataAccessFactory.Creategen_linkedserviceDataAccess().SaveList(listAdded, listUpdated, listDeleted, cancellationToken);
            }
           
            catch (Exception ex)
            {
               throw GetFacadeException(ex, SourceOfException("Imer_poFacade.Save_gen_linkedservice"));
            }
        }
        
		#endregion Save Update Delete List	
		
		#region GetAll
		
		async Task<IList<gen_linkedserviceEntity>> Igen_linkedserviceFacadeObjects.GetAll(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_linkedserviceDataAccess().GetAll(gen_linkedservice, cancellationToken);
			}
           
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("IList<gen_linkedserviceEntity> Igen_linkedserviceFacade.GetAllgen_linkedservice"));
            }
		}
		
		async Task<IList<gen_linkedserviceEntity>> Igen_linkedserviceFacadeObjects.GetAllByPages(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_linkedserviceDataAccess().GetAllByPages(gen_linkedservice,cancellationToken);
			}
           
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("IList<gen_linkedserviceEntity> Igen_linkedserviceFacade.GetAllByPagesgen_linkedservice"));
            }
		}
		
		#endregion GetAll
        
        #region FOR Master Details SAVE	
        
        #endregion	
	
        
        #region Simple load Single Row
        async  Task<gen_linkedserviceEntity>  Igen_linkedserviceFacadeObjects.GetSingle(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_linkedserviceDataAccess().GetSingle(gen_linkedservice,cancellationToken);
			}
           
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("gen_linkedserviceEntity Igen_linkedserviceFacade.GetSinglegen_linkedservice"));
            }
		}
        #endregion 
         
        #region ForListView Paged Method
        async Task<IList<gen_linkedserviceEntity>> Igen_linkedserviceFacadeObjects.GAPgListView(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_linkedserviceDataAccess().GAPgListView(gen_linkedservice,cancellationToken);
			}
           
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("IList<gen_linkedserviceEntity> Igen_linkedserviceFacade.GAPgListViewgen_linkedservice"));
            }
		}
        #endregion
        
        #region Extras Reviewed, Published, Archived
        #endregion 
    
        #endregion
	}
}
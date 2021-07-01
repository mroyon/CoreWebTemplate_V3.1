

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
    public sealed partial class gen_doctypeFacadeObjects : BaseFacade, Igen_doctypeFacadeObjects
    {
	
		#region Instance Variables
		private string ClassName = "gen_doctypeFacadeObjects";
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

        public gen_doctypeFacadeObjects()
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

        ~gen_doctypeFacadeObjects()
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
		
		async Task<long> Igen_doctypeFacadeObjects.Delete(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken)
		{
			try
            {
				return await DataAccessFactory.Creategen_doctypeDataAccess().Delete(gen_doctype, cancellationToken);
			}
            
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("Igen_doctypeFacade.Deletegen_doctype"));
            }
        }
		
		async Task<long> Igen_doctypeFacadeObjects.Update(gen_doctypeEntity gen_doctype , CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_doctypeDataAccess().Update(gen_doctype,cancellationToken);
			}
           
            catch (Exception ex)
            {
               throw GetFacadeException(ex, SourceOfException("Igen_doctypeFacade.Updategen_doctype"));
            }
		}
		
		async Task<long> Igen_doctypeFacadeObjects.Add(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_doctypeDataAccess().Add(gen_doctype, cancellationToken);
			}
           
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("Igen_doctypeFacade.Addgen_doctype"));
            }
		}
		
        async Task<long> Igen_doctypeFacadeObjects.SaveList(List<gen_doctypeEntity> list, CancellationToken cancellationToken)
        {
            try
            {
                IList<gen_doctypeEntity> listAdded = list.FindAll(Item => Item.CurrentState == BaseEntity.EntityState.Added);
                IList<gen_doctypeEntity> listUpdated = list.FindAll(Item => Item.CurrentState == BaseEntity.EntityState.Changed);
                IList<gen_doctypeEntity> listDeleted = list.FindAll(Item => Item.CurrentState == BaseEntity.EntityState.Deleted);
               
                return await DataAccessFactory.Creategen_doctypeDataAccess().SaveList(listAdded, listUpdated, listDeleted, cancellationToken);
            }
           
            catch (Exception ex)
            {
               throw GetFacadeException(ex, SourceOfException("Imer_poFacade.Save_gen_doctype"));
            }
        }
        
		#endregion Save Update Delete List	
		
		#region GetAll
		
		async Task<IList<gen_doctypeEntity>> Igen_doctypeFacadeObjects.GetAll(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_doctypeDataAccess().GetAll(gen_doctype, cancellationToken);
			}
           
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("IList<gen_doctypeEntity> Igen_doctypeFacade.GetAllgen_doctype"));
            }
		}
		
		async Task<IList<gen_doctypeEntity>> Igen_doctypeFacadeObjects.GetAllByPages(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_doctypeDataAccess().GetAllByPages(gen_doctype,cancellationToken);
			}
           
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("IList<gen_doctypeEntity> Igen_doctypeFacade.GetAllByPagesgen_doctype"));
            }
		}
		
		#endregion GetAll
        
        #region FOR Master Details SAVE	
        
        #endregion	
	
        
        #region Simple load Single Row
        async  Task<gen_doctypeEntity>  Igen_doctypeFacadeObjects.GetSingle(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_doctypeDataAccess().GetSingle(gen_doctype,cancellationToken);
			}
           
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("gen_doctypeEntity Igen_doctypeFacade.GetSinglegen_doctype"));
            }
		}
        #endregion 
         
        #region ForListView Paged Method
        async Task<IList<gen_doctypeEntity>> Igen_doctypeFacadeObjects.GAPgListView(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_doctypeDataAccess().GAPgListView(gen_doctype,cancellationToken);
			}
           
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("IList<gen_doctypeEntity> Igen_doctypeFacade.GAPgListViewgen_doctype"));
            }
		}
        #endregion
        
        #region Extras Reviewed, Published, Archived
        #endregion 
    
        #endregion
	}
}
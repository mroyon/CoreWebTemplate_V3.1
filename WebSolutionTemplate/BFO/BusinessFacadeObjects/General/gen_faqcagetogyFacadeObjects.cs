


using AppConfig.ConfigDAAC;
using BDO.Base;
using BDO.DataAccessObjects.Models;
using BFO.Base;
using DAC.Core.CoreFactory;
using IBFO.Core.IBusinessFacadeObjects.General;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading;
using System.Threading.Tasks;

namespace BFO.Core.BusinessFacadeObjects.General
{
    public sealed partial class gen_faqcagetogyFacadeObjects : BaseFacade, Igen_faqcagetogyFacadeObjects
    {
	
		#region Instance Variables
		private string ClassName = "gen_faqcagetogyFacadeObjects";
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

        public gen_faqcagetogyFacadeObjects()
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

        ~gen_faqcagetogyFacadeObjects()
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
		
		async Task<long> Igen_faqcagetogyFacadeObjects.Delete(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken)
		{
			try
            {
				return await DataAccessFactory.Creategen_faqcagetogyDataAccess().Delete(gen_faqcagetogy, cancellationToken);
			}
            
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("Igen_faqcagetogyFacade.Deletegen_faqcagetogy"));
            }
        }
		
		async Task<long> Igen_faqcagetogyFacadeObjects.Update(gen_faqcagetogyEntity gen_faqcagetogy , CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_faqcagetogyDataAccess().Update(gen_faqcagetogy,cancellationToken);
			}
           
            catch (Exception ex)
            {
               throw GetFacadeException(ex, SourceOfException("Igen_faqcagetogyFacade.Updategen_faqcagetogy"));
            }
		}
		
		async Task<long> Igen_faqcagetogyFacadeObjects.Add(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_faqcagetogyDataAccess().Add(gen_faqcagetogy, cancellationToken);
			}
           
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("Igen_faqcagetogyFacade.Addgen_faqcagetogy"));
            }
		}
		
        async Task<long> Igen_faqcagetogyFacadeObjects.SaveList(List<gen_faqcagetogyEntity> list, CancellationToken cancellationToken)
        {
            try
            {
                IList<gen_faqcagetogyEntity> listAdded = list.FindAll(Item => Item.CurrentState == BaseEntity.EntityState.Added);
                IList<gen_faqcagetogyEntity> listUpdated = list.FindAll(Item => Item.CurrentState == BaseEntity.EntityState.Changed);
                IList<gen_faqcagetogyEntity> listDeleted = list.FindAll(Item => Item.CurrentState == BaseEntity.EntityState.Deleted);
               
                return await DataAccessFactory.Creategen_faqcagetogyDataAccess().SaveList(listAdded, listUpdated, listDeleted, cancellationToken);
            }
           
            catch (Exception ex)
            {
               throw GetFacadeException(ex, SourceOfException("Imer_poFacade.Save_gen_faqcagetogy"));
            }
        }
        
		#endregion Save Update Delete List	
		
		#region GetAll
		
		async Task<IList<gen_faqcagetogyEntity>> Igen_faqcagetogyFacadeObjects.GetAll(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_faqcagetogyDataAccess().GetAll(gen_faqcagetogy, cancellationToken);
			}
           
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("IList<gen_faqcagetogyEntity> Igen_faqcagetogyFacade.GetAllgen_faqcagetogy"));
            }
		}
		
		async Task<IList<gen_faqcagetogyEntity>> Igen_faqcagetogyFacadeObjects.GetAllByPages(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_faqcagetogyDataAccess().GetAllByPages(gen_faqcagetogy,cancellationToken);
			}
           
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("IList<gen_faqcagetogyEntity> Igen_faqcagetogyFacade.GetAllByPagesgen_faqcagetogy"));
            }
		}
		
		#endregion GetAll
        
        #region FOR Master Details SAVE	
        
        async Task<long> Igen_faqcagetogyFacadeObjects.SaveMasterDetgen_faq(gen_faqcagetogyEntity Master, List<gen_faqEntity> DetailList, CancellationToken cancellationToken)
        {
            try
               {
                    DetailList.ForEach(P => P.BaseSecurityParam = new SecurityCapsule());
                    DetailList.ForEach(P => P.BaseSecurityParam = Master.BaseSecurityParam);
                    if (Master.CurrentState == BaseEntity.EntityState.Deleted)
						DetailList.ForEach(p => p.CurrentState = BaseEntity.EntityState.Deleted);
                    IList<gen_faqEntity> listAdded = DetailList.FindAll(Item => Item.CurrentState == BaseEntity.EntityState.Added);
                    IList<gen_faqEntity> listUpdated = DetailList.FindAll(Item => Item.CurrentState == BaseEntity.EntityState.Changed);
                    IList<gen_faqEntity> listDeleted = DetailList.FindAll(Item => Item.CurrentState == BaseEntity.EntityState.Deleted);
                    return await DataAccessFactory.Creategen_faqcagetogyDataAccess().SaveMasterDetgen_faq(Master, listAdded, listUpdated, listDeleted, cancellationToken);
               }
               catch (Exception ex)
               {
                    throw GetFacadeException(ex, SourceOfException("Imer_poFacade.SaveMasterDetgen_faq"));
               }
        }
        
        
        #endregion	
	
        
        #region Simple load Single Row
        async  Task<gen_faqcagetogyEntity>  Igen_faqcagetogyFacadeObjects.GetSingle(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_faqcagetogyDataAccess().GetSingle(gen_faqcagetogy,cancellationToken);
			}
           
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("gen_faqcagetogyEntity Igen_faqcagetogyFacade.GetSinglegen_faqcagetogy"));
            }
		}
        #endregion 
         
        #region ForListView Paged Method
        async Task<IList<gen_faqcagetogyEntity>> Igen_faqcagetogyFacadeObjects.GAPgListView(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_faqcagetogyDataAccess().GAPgListView(gen_faqcagetogy,cancellationToken);
			}
           
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("IList<gen_faqcagetogyEntity> Igen_faqcagetogyFacade.GAPgListViewgen_faqcagetogy"));
            }
		}
        #endregion
        
        #region Extras Reviewed, Published, Archived
        #endregion 
    
        #endregion
	}
}
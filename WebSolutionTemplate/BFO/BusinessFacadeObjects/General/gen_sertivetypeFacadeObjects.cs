

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
    public sealed partial class gen_sertivetypeFacadeObjects : BaseFacade, Igen_sertivetypeFacadeObjects
    {
	
		#region Instance Variables
		private string ClassName = "gen_sertivetypeFacadeObjects";
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

        public gen_sertivetypeFacadeObjects()
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

        ~gen_sertivetypeFacadeObjects()
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
		
		async Task<long> Igen_sertivetypeFacadeObjects.Delete(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken)
		{
			try
            {
				return await DataAccessFactory.Creategen_sertivetypeDataAccess().Delete(gen_sertivetype, cancellationToken);
			}
            
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("Igen_sertivetypeFacade.Deletegen_sertivetype"));
            }
        }
		
		async Task<long> Igen_sertivetypeFacadeObjects.Update(gen_sertivetypeEntity gen_sertivetype , CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_sertivetypeDataAccess().Update(gen_sertivetype,cancellationToken);
			}
           
            catch (Exception ex)
            {
               throw GetFacadeException(ex, SourceOfException("Igen_sertivetypeFacade.Updategen_sertivetype"));
            }
		}
		
		async Task<long> Igen_sertivetypeFacadeObjects.Add(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_sertivetypeDataAccess().Add(gen_sertivetype, cancellationToken);
			}
           
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("Igen_sertivetypeFacade.Addgen_sertivetype"));
            }
		}
		
        async Task<long> Igen_sertivetypeFacadeObjects.SaveList(List<gen_sertivetypeEntity> list, CancellationToken cancellationToken)
        {
            try
            {
                IList<gen_sertivetypeEntity> listAdded = list.FindAll(Item => Item.CurrentState == BaseEntity.EntityState.Added);
                IList<gen_sertivetypeEntity> listUpdated = list.FindAll(Item => Item.CurrentState == BaseEntity.EntityState.Changed);
                IList<gen_sertivetypeEntity> listDeleted = list.FindAll(Item => Item.CurrentState == BaseEntity.EntityState.Deleted);
               
                return await DataAccessFactory.Creategen_sertivetypeDataAccess().SaveList(listAdded, listUpdated, listDeleted, cancellationToken);
            }
           
            catch (Exception ex)
            {
               throw GetFacadeException(ex, SourceOfException("Imer_poFacade.Save_gen_sertivetype"));
            }
        }
        
		#endregion Save Update Delete List	
		
		#region GetAll
		
		async Task<IList<gen_sertivetypeEntity>> Igen_sertivetypeFacadeObjects.GetAll(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_sertivetypeDataAccess().GetAll(gen_sertivetype, cancellationToken);
			}
           
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("IList<gen_sertivetypeEntity> Igen_sertivetypeFacade.GetAllgen_sertivetype"));
            }
		}
		
		async Task<IList<gen_sertivetypeEntity>> Igen_sertivetypeFacadeObjects.GetAllByPages(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_sertivetypeDataAccess().GetAllByPages(gen_sertivetype,cancellationToken);
			}
           
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("IList<gen_sertivetypeEntity> Igen_sertivetypeFacade.GetAllByPagesgen_sertivetype"));
            }
		}
		
		#endregion GetAll
        
        #region FOR Master Details SAVE	
        
        async Task<long> Igen_sertivetypeFacadeObjects.SaveMasterDetgen_services(gen_sertivetypeEntity Master, List<gen_servicesEntity> DetailList, CancellationToken cancellationToken)
        {
            try
               {
                    DetailList.ForEach(P => P.BaseSecurityParam = new SecurityCapsule());
                    DetailList.ForEach(P => P.BaseSecurityParam = Master.BaseSecurityParam);
                    if (Master.CurrentState == BaseEntity.EntityState.Deleted)
						DetailList.ForEach(p => p.CurrentState = BaseEntity.EntityState.Deleted);
                    IList<gen_servicesEntity> listAdded = DetailList.FindAll(Item => Item.CurrentState == BaseEntity.EntityState.Added);
                    IList<gen_servicesEntity> listUpdated = DetailList.FindAll(Item => Item.CurrentState == BaseEntity.EntityState.Changed);
                    IList<gen_servicesEntity> listDeleted = DetailList.FindAll(Item => Item.CurrentState == BaseEntity.EntityState.Deleted);
                    return await DataAccessFactory.Creategen_sertivetypeDataAccess().SaveMasterDetgen_services(Master, listAdded, listUpdated, listDeleted, cancellationToken);
               }
               catch (Exception ex)
               {
                    throw GetFacadeException(ex, SourceOfException("Imer_poFacade.SaveMasterDetgen_services"));
               }
        }
        
        
        #endregion	
	
        
        #region Simple load Single Row
        async  Task<gen_sertivetypeEntity>  Igen_sertivetypeFacadeObjects.GetSingle(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_sertivetypeDataAccess().GetSingle(gen_sertivetype,cancellationToken);
			}
           
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("gen_sertivetypeEntity Igen_sertivetypeFacade.GetSinglegen_sertivetype"));
            }
		}
        #endregion 
         
        #region ForListView Paged Method
        async Task<IList<gen_sertivetypeEntity>> Igen_sertivetypeFacadeObjects.GAPgListView(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken)
		{
			try
			{
				return await DataAccessFactory.Creategen_sertivetypeDataAccess().GAPgListView(gen_sertivetype,cancellationToken);
			}
           
            catch (Exception ex)
            {
                throw GetFacadeException(ex, SourceOfException("IList<gen_sertivetypeEntity> Igen_sertivetypeFacade.GAPgListViewgen_sertivetype"));
            }
		}
        #endregion
        
        #region Extras Reviewed, Published, Archived
        #endregion 
    
        #endregion
	}
}
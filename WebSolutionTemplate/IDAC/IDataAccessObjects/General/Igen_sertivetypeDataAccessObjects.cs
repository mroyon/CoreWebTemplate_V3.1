using BDO.DataAccessObjects.Models;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;


namespace IDAC.Core.IDataAccessObjects.General
{
	public partial interface Igen_sertivetypeDataAccessObjects
    {
		 
		#region Save Update Delete List Single Entity	
        
        Task<long> Add(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken);
		
        Task<long> Update(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken);
        
        Task<long> Delete(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken);
		
        Task<long> SaveList(IList<gen_sertivetypeEntity> listAdded, IList<gen_sertivetypeEntity> listUpdated, IList<gen_sertivetypeEntity> listDeleted, CancellationToken cancellationToken);
        
		#endregion Save Update Delete List
		
		
		#region GetAll	
		Task<IList<gen_sertivetypeEntity>> GetAll(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken);
		
        Task<IList<gen_sertivetypeEntity>> GetAllByPages(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken);
        
		#endregion GetAll
		
		#region SaveMasterDetails
        Task<long> SaveMasterDetgen_services(gen_sertivetypeEntity masterEntity, IList<gen_servicesEntity> listAdded, IList<gen_servicesEntity> listUpdated, IList<gen_servicesEntity> listDeleted, CancellationToken cancellationToken);

        #endregion SaveMasterDetails
        
         #region Simple load Single Row
         Task<gen_sertivetypeEntity> GetSingle(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken);
         #endregion 
         
         #region ForListView Paged Method
         Task<IList<gen_sertivetypeEntity>> GAPgListView(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken);
         #endregion
         
        #region Extras Reviewed, Published, Archived
        #endregion        
        
    }
}

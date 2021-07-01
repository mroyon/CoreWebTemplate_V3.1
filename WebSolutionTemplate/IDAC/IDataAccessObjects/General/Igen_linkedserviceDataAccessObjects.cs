using BDO.DataAccessObjects.Models;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;


namespace IDAC.Core.IDataAccessObjects.General
{
	public partial interface Igen_linkedserviceDataAccessObjects
    {
		 
		#region Save Update Delete List Single Entity	
        
        Task<long> Add(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken);
		
        Task<long> Update(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken);
        
        Task<long> Delete(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken);
		
        Task<long> SaveList(IList<gen_linkedserviceEntity> listAdded, IList<gen_linkedserviceEntity> listUpdated, IList<gen_linkedserviceEntity> listDeleted, CancellationToken cancellationToken);
        
		#endregion Save Update Delete List
		
		
		#region GetAll	
		Task<IList<gen_linkedserviceEntity>> GetAll(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken);
		
        Task<IList<gen_linkedserviceEntity>> GetAllByPages(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken);
        
		#endregion GetAll
		
		#region SaveMasterDetails
        #endregion SaveMasterDetails
        
         #region Simple load Single Row
         Task<gen_linkedserviceEntity> GetSingle(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken);
         #endregion 
         
         #region ForListView Paged Method
         Task<IList<gen_linkedserviceEntity>> GAPgListView(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken);
         #endregion
         
        #region Extras Reviewed, Published, Archived
        #endregion        
        
    }
}

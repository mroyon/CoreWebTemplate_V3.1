using BDO.DataAccessObjects.Models;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;


namespace IDAC.Core.IDataAccessObjects.General
{
	public partial interface Igen_doctypeDataAccessObjects
    {
		 
		#region Save Update Delete List Single Entity	
        
        Task<long> Add(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken);
		
        Task<long> Update(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken);
        
        Task<long> Delete(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken);
		
        Task<long> SaveList(IList<gen_doctypeEntity> listAdded, IList<gen_doctypeEntity> listUpdated, IList<gen_doctypeEntity> listDeleted, CancellationToken cancellationToken);
        
		#endregion Save Update Delete List
		
		
		#region GetAll	
		Task<IList<gen_doctypeEntity>> GetAll(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken);
		
        Task<IList<gen_doctypeEntity>> GetAllByPages(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken);
        
		#endregion GetAll
		
		#region SaveMasterDetails
        #endregion SaveMasterDetails
        
         #region Simple load Single Row
         Task<gen_doctypeEntity> GetSingle(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken);
         #endregion 
         
         #region ForListView Paged Method
         Task<IList<gen_doctypeEntity>> GAPgListView(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken);
         #endregion
         
        #region Extras Reviewed, Published, Archived
        #endregion        
        
    }
}

using BDO.DataAccessObjects.Models;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;


namespace IDAC.Core.IDataAccessObjects.General
{
	public partial interface Igen_faqcagetogyDataAccessObjects
    {
		 
		#region Save Update Delete List Single Entity	
        
        Task<long> Add(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken);
		
        Task<long> Update(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken);
        
        Task<long> Delete(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken);
		
        Task<long> SaveList(IList<gen_faqcagetogyEntity> listAdded, IList<gen_faqcagetogyEntity> listUpdated, IList<gen_faqcagetogyEntity> listDeleted, CancellationToken cancellationToken);
        
		#endregion Save Update Delete List
		
		
		#region GetAll	
		Task<IList<gen_faqcagetogyEntity>> GetAll(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken);
		
        Task<IList<gen_faqcagetogyEntity>> GetAllByPages(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken);
        
		#endregion GetAll
		
		#region SaveMasterDetails
        Task<long> SaveMasterDetgen_faq(gen_faqcagetogyEntity masterEntity, IList<gen_faqEntity> listAdded, IList<gen_faqEntity> listUpdated, IList<gen_faqEntity> listDeleted, CancellationToken cancellationToken);

        #endregion SaveMasterDetails
        
         #region Simple load Single Row
         Task<gen_faqcagetogyEntity> GetSingle(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken);
         #endregion 
         
         #region ForListView Paged Method
         Task<IList<gen_faqcagetogyEntity>> GAPgListView(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken);
         #endregion
         
        #region Extras Reviewed, Published, Archived
        #endregion        
        
    }
}

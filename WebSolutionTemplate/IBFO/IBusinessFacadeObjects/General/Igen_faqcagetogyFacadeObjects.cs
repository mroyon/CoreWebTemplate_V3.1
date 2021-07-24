

using BDO.DataAccessObjects.Models;
using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.Threading;
using System.Threading.Tasks;


namespace IBFO.Core.IBusinessFacadeObjects.General
{
    [ServiceContract(Name = "Igen_faqcagetogyFacadeObjects")]
    public partial interface Igen_faqcagetogyFacadeObjects : IDisposable
    { 
		#region Save Update Delete List 
		
		
		[OperationContract]
        Task<long> Add(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken);
        
		[OperationContract]
		Task<long> Update(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken );
		
		[OperationContract]
		Task<long> Delete(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken);
        
        [OperationContract]
        Task<long> SaveList(List<gen_faqcagetogyEntity> list , CancellationToken cancellationToken);
		
		
		#endregion Save Update Delete List
		
		#region GetAll	
		
		[OperationContract]
        Task<IList<gen_faqcagetogyEntity>> GetAll(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken);
		
		[OperationContract]
        Task<IList<gen_faqcagetogyEntity>> GetAllByPages(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken);
     
		#endregion GetAll
		
        #region Save Master/Details	
        
        [OperationContract]
        Task<long> SaveMasterDetgen_faq(gen_faqcagetogyEntity Master, List<gen_faqEntity> DetailList, CancellationToken cancellationToken);

        #endregion Save Master/Details	
        
        #region Simple load Single Row
        [OperationContract]
        Task<gen_faqcagetogyEntity> GetSingle(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken);
         #endregion 
         
         #region ForListView Paged Method
         [OperationContract]
         Task<IList<gen_faqcagetogyEntity>> GAPgListView(gen_faqcagetogyEntity gen_faqcagetogy, CancellationToken cancellationToken);
         #endregion
         
        #region Extras Reviewed, Published, Archived
        #endregion 
    }
}

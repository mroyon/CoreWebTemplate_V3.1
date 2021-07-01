

using BDO.DataAccessObjects.Models;
using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.Threading;
using System.Threading.Tasks;


namespace IBFO.Core.IBusinessFacadeObjects.General
{
    [ServiceContract(Name = "Igen_linkedserviceFacadeObjects")]
    public partial interface Igen_linkedserviceFacadeObjects : IDisposable
    { 
		#region Save Update Delete List 
		
		
		[OperationContract]
        Task<long> Add(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken);
        
		[OperationContract]
		Task<long> Update(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken );
		
		[OperationContract]
		Task<long> Delete(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken);
        
        [OperationContract]
        Task<long> SaveList(List<gen_linkedserviceEntity> list , CancellationToken cancellationToken);
		
		
		#endregion Save Update Delete List
		
		#region GetAll	
		
		[OperationContract]
        Task<IList<gen_linkedserviceEntity>> GetAll(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken);
		
		[OperationContract]
        Task<IList<gen_linkedserviceEntity>> GetAllByPages(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken);
     
		#endregion GetAll
		
        #region Save Master/Details	
        
        #endregion Save Master/Details	
        
        #region Simple load Single Row
        [OperationContract]
        Task<gen_linkedserviceEntity> GetSingle(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken);
         #endregion 
         
         #region ForListView Paged Method
         [OperationContract]
         Task<IList<gen_linkedserviceEntity>> GAPgListView(gen_linkedserviceEntity gen_linkedservice, CancellationToken cancellationToken);
         #endregion
         
        #region Extras Reviewed, Published, Archived
        #endregion 
    }
}

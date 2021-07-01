


using BDO.DataAccessObjects.Models;
using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.Threading;
using System.Threading.Tasks;


namespace IBFO.Core.IBusinessFacadeObjects.General
{
    [ServiceContract(Name = "Igen_doctypeFacadeObjects")]
    public partial interface Igen_doctypeFacadeObjects : IDisposable
    { 
		#region Save Update Delete List 
		
		
		[OperationContract]
        Task<long> Add(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken);
        
		[OperationContract]
		Task<long> Update(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken );
		
		[OperationContract]
		Task<long> Delete(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken);
        
        [OperationContract]
        Task<long> SaveList(List<gen_doctypeEntity> list , CancellationToken cancellationToken);
		
		
		#endregion Save Update Delete List
		
		#region GetAll	
		
		[OperationContract]
        Task<IList<gen_doctypeEntity>> GetAll(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken);
		
		[OperationContract]
        Task<IList<gen_doctypeEntity>> GetAllByPages(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken);
     
		#endregion GetAll
		
        #region Save Master/Details	
        
        #endregion Save Master/Details	
        
        #region Simple load Single Row
        [OperationContract]
        Task<gen_doctypeEntity> GetSingle(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken);
         #endregion 
         
         #region ForListView Paged Method
         [OperationContract]
         Task<IList<gen_doctypeEntity>> GAPgListView(gen_doctypeEntity gen_doctype, CancellationToken cancellationToken);
         #endregion
         
        #region Extras Reviewed, Published, Archived
        #endregion 
    }
}

using BDO.DataAccessObjects.Models;
using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.Threading;
using System.Threading.Tasks;


namespace IBFO.Core.IBusinessFacadeObjects.General
{
    [ServiceContract(Name = "Igen_sertivetypeFacadeObjects")]
    public partial interface Igen_sertivetypeFacadeObjects : IDisposable
    { 
		#region Save Update Delete List 
		
		
		[OperationContract]
        Task<long> Add(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken);
        
		[OperationContract]
		Task<long> Update(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken );
		
		[OperationContract]
		Task<long> Delete(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken);
        
        [OperationContract]
        Task<long> SaveList(List<gen_sertivetypeEntity> list , CancellationToken cancellationToken);
		
		
		#endregion Save Update Delete List
		
		#region GetAll	
		
		[OperationContract]
        Task<IList<gen_sertivetypeEntity>> GetAll(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken);
		
		[OperationContract]
        Task<IList<gen_sertivetypeEntity>> GetAllByPages(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken);
     
		#endregion GetAll
		
        #region Save Master/Details	
        
        [OperationContract]
        Task<long> SaveMasterDetgen_services(gen_sertivetypeEntity Master, List<gen_servicesEntity> DetailList, CancellationToken cancellationToken);

        #endregion Save Master/Details	
        
        #region Simple load Single Row
        [OperationContract]
        Task<gen_sertivetypeEntity> GetSingle(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken);
         #endregion 
         
         #region ForListView Paged Method
         [OperationContract]
         Task<IList<gen_sertivetypeEntity>> GAPgListView(gen_sertivetypeEntity gen_sertivetype, CancellationToken cancellationToken);
         #endregion
         
        #region Extras Reviewed, Published, Archived
        #endregion 
    }
}

using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using BDO.DataAccessObjects.SecurityModule;


namespace IDAC.Core.IDataAccessObjects.Security
{
	public partial interface Iowin_forminfoDataAccessObjects
    {
		 
		#region Save Update Delete List Single Entity	
        
        Task<long> Add(owin_forminfoEntity owin_forminfo, CancellationToken cancellationToken);
		
        Task<long> Update(owin_forminfoEntity owin_forminfo, CancellationToken cancellationToken);
        
        Task<long> Delete(owin_forminfoEntity owin_forminfo, CancellationToken cancellationToken);
		
        Task<long> SaveList(IList<owin_forminfoEntity> listAdded, IList<owin_forminfoEntity> listUpdated, IList<owin_forminfoEntity> listDeleted, CancellationToken cancellationToken);
        
		#endregion Save Update Delete List
		
		
		#region GetAll	
		Task<IList<owin_forminfoEntity>> GetAll(owin_forminfoEntity owin_forminfo, CancellationToken cancellationToken);
		
        Task<IList<owin_forminfoEntity>> GetAllByPages(owin_forminfoEntity owin_forminfo, CancellationToken cancellationToken);
        
		#endregion GetAll
		
		#region SaveMasterDetails
        Task<long> SaveMasterDetowin_formaction(owin_forminfoEntity masterEntity, IList<owin_formactionEntity> listAdded, IList<owin_formactionEntity> listUpdated, IList<owin_formactionEntity> listDeleted, CancellationToken cancellationToken);

        Task<long> SaveMasterDetowin_lastworkingpage(owin_forminfoEntity masterEntity, IList<owin_lastworkingpageEntity> listAdded, IList<owin_lastworkingpageEntity> listUpdated, IList<owin_lastworkingpageEntity> listDeleted, CancellationToken cancellationToken);

        Task<long> SaveMasterDetowin_rolepermission(owin_forminfoEntity masterEntity, IList<owin_rolepermissionEntity> listAdded, IList<owin_rolepermissionEntity> listUpdated, IList<owin_rolepermissionEntity> listDeleted, CancellationToken cancellationToken);

        #endregion SaveMasterDetails
        
         #region Simple load Single Row
         Task<owin_forminfoEntity> GetSingle(owin_forminfoEntity owin_forminfo, CancellationToken cancellationToken);
         #endregion 
         
         #region ForListView Paged Method
         Task<IList<owin_forminfoEntity>> GAPgListView(owin_forminfoEntity owin_forminfo, CancellationToken cancellationToken);
         #endregion
         
        #region Extras Reviewed, Published, Archived
        #endregion        
        
    }
}

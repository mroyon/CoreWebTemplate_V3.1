GO
USE KAFBlackPortal
GO


/*
KAF Information Center
*/


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
CREATE PROCEDURE gen_doctype_Upd222
		@DocTypeID bigint  = NULL,
		@DocName nvarchar (150) = NULL,
		@DocPriority bigint  = NULL,
		@Remarks nvarchar (350) = NULL,
		        
        @RETURN_KEY bigint = null output,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256),
        @CreatedDate DATETIME= NULL,
        @UpdatedDate DATETIME,
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) ,
        @Ts bigint = NULL

	AS
	BEGIN
		UPDATE Gen_DocType
		SET
			DocName = @DocName,
			DocPriority = @DocPriority,
			Remarks = @Remarks,
			TransID = @TransID,
			UpdatedByUserName = @UpdatedByUserName,
			UpdatedDate = @UpdatedDate,
			IPAddress = @IPAddress
		WHERE
			DocTypeID = @DocTypeID
    SET @RETURN_KEY =@DocTypeID
		    
	END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	

            
            




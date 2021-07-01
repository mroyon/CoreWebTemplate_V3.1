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

/*
Creator : KAF
*/
CREATE PROCEDURE gen_doctype_Ins 
		@DocTypeID bigint  = NULL,
		@DocName nvarchar (150) = NULL,
		@DocPriority bigint  = NULL,
		@Remarks nvarchar (350) = NULL,
		        
        @RETURN_KEY bigint = null output,
        @CreatedByUserName nvarchar(256),
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME,
        @UpdatedDate DATETIME= NULL,        
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) ,
        @Ts bigint = NULL
	AS
	BEGIN
		
        
		INSERT INTO Gen_DocType (
			DocName,
			DocPriority,
			Remarks,
			TransID,
			CreatedByUserName,
			CreatedDate,
  			IPAddress
		)
		VALUES (
			@DocName,
			@DocPriority,
			@Remarks,
			@TransID,
			@CreatedByUserName,
			@CreatedDate,
			@IPAddress
					)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END  
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
CREATE PROCEDURE gen_doctype_Upd
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
/*
Creator : KAF
*/	
CREATE PROCEDURE gen_doctype_Del		        
		@DocTypeID bigint  = NULL,
		@DocName nvarchar (150) = NULL,
		@DocPriority bigint  = NULL,
		@Remarks nvarchar (350) = NULL,
		        
        @RETURN_KEY bigint = null output,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME= NULL,
        @UpdatedDate DATETIME= NULL,
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) ,
        @Ts bigint = NULL
	AS
	BEGIN
		DELETE FROM Gen_DocType
		WHERE 
			DocTypeID = @DocTypeID
		
    SET @RETURN_KEY =@DocTypeID
		
		
	END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
CREATE PROCEDURE gen_doctype_GA 
		@DocTypeID bigint  = NULL,
		@DocName nvarchar (150) = NULL,
		@DocPriority bigint  = NULL,
		@Remarks nvarchar (350) = NULL,
		    
        @SortExpression VARCHAR(MAX)  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME = NULL,
        @UpdatedDate DATETIME = NULL,
        @IPAddress varchar(100) = NULL,
        @TransID nvarchar(250) = NULL,
        @Ts bigint = NULL
        
	AS
	BEGIN
		SELECT 
			Gen_DocType.DocTypeID,
			Gen_DocType.DocName,
			Gen_DocType.DocPriority,
			Gen_DocType.Remarks,
			Gen_DocType.TransID,
			Gen_DocType.CreatedByUserName,
			Gen_DocType.CreatedDate,
			Gen_DocType.UpdatedByUserName,
			Gen_DocType.UpdatedDate,
			Gen_DocType.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='DocTypeID ASC' THEN Gen_DocType.DocTypeID END ASC,
						CASE WHEN @SortExpression ='DocTypeID DESC' THEN Gen_DocType.DocTypeID END DESC,
						CASE WHEN @SortExpression ='DocName ASC' THEN Gen_DocType.DocName END ASC,
						CASE WHEN @SortExpression ='DocName DESC' THEN Gen_DocType.DocName END DESC,
						CASE WHEN @SortExpression ='DocPriority ASC' THEN Gen_DocType.DocPriority END ASC,
						CASE WHEN @SortExpression ='DocPriority DESC' THEN Gen_DocType.DocPriority END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Gen_DocType.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Gen_DocType.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Gen_DocType.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Gen_DocType.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Gen_DocType.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Gen_DocType.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Gen_DocType.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Gen_DocType.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Gen_DocType.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Gen_DocType.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Gen_DocType.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Gen_DocType.IPAddress END DESC
				) as RowNumber
		FROM Gen_DocType 
		where
			(CASE WHEN @DocTypeID is NULL THEN 1 WHEN Gen_DocType.DocTypeID  = @DocTypeID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DocName is NULL THEN 1 WHEN Gen_DocType.DocName  = @DocName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DocPriority is NULL THEN 1 WHEN Gen_DocType.DocPriority  = @DocPriority THEN 1 ELSE 0 END = 1)
			
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Gen_DocType.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Gen_DocType.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
	END  
GO	



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
CREATE PROCEDURE gen_doctype_GAPg 
		@DocTypeID bigint  = NULL,
		@DocName nvarchar (150) = NULL,
		@DocPriority bigint  = NULL,
		@Remarks nvarchar (350) = NULL,
		    
        @TotalRecord bigint = null output,
        @SortExpression VARCHAR(MAX)  = NULL,
        @PageSize BIGINT = NULL,
        @CurrentPage BIGINT  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME= NULL,
        @UpdatedDate DATETIME= NULL,
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) = NULL,
        @TS varchar(100)= NULL
    
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					gen_doctype
				WHERE 
					(CASE WHEN @DocTypeID is NULL THEN 1 WHEN Gen_DocType.DocTypeID  = @DocTypeID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DocName is NULL THEN 1 WHEN Gen_DocType.DocName  = @DocName THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DocPriority is NULL THEN 1 WHEN Gen_DocType.DocPriority  = @DocPriority THEN 1 ELSE 0 END = 1)
					
					
					AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Gen_DocType.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Gen_DocType.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
					
					
					
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedgen_doctype AS
			(
				  SELECT 
			Gen_DocType.DocTypeID,
			Gen_DocType.DocName,
			Gen_DocType.DocPriority,
			Gen_DocType.Remarks,
			Gen_DocType.TransID,
			Gen_DocType.CreatedByUserName,
			Gen_DocType.CreatedDate,
			Gen_DocType.UpdatedByUserName,
			Gen_DocType.UpdatedDate,
			Gen_DocType.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='DocTypeID ASC' THEN Gen_DocType.DocTypeID END ASC,
						CASE WHEN @SortExpression ='DocTypeID DESC' THEN Gen_DocType.DocTypeID END DESC,
						CASE WHEN @SortExpression ='DocName ASC' THEN Gen_DocType.DocName END ASC,
						CASE WHEN @SortExpression ='DocName DESC' THEN Gen_DocType.DocName END DESC,
						CASE WHEN @SortExpression ='DocPriority ASC' THEN Gen_DocType.DocPriority END ASC,
						CASE WHEN @SortExpression ='DocPriority DESC' THEN Gen_DocType.DocPriority END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Gen_DocType.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Gen_DocType.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Gen_DocType.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Gen_DocType.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Gen_DocType.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Gen_DocType.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Gen_DocType.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Gen_DocType.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Gen_DocType.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Gen_DocType.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Gen_DocType.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Gen_DocType.IPAddress END DESC
				) as RowNumber
		FROM Gen_DocType 
		where
			(CASE WHEN @DocTypeID is NULL THEN 1 WHEN Gen_DocType.DocTypeID  = @DocTypeID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DocName is NULL THEN 1 WHEN Gen_DocType.DocName  = @DocName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DocPriority is NULL THEN 1 WHEN Gen_DocType.DocPriority  = @DocPriority THEN 1 ELSE 0 END = 1)
			
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Gen_DocType.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Gen_DocType.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
			)
			SELECT * 
			FROM  tempPagedgen_doctype
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END  
GO	


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	

/*
Creator : KAF
*/
CREATE PROCEDURE gen_faq_Ins 
		@FAQID bigint  = NULL,
		@FAQCategoryID bigint  = NULL,
		@FAQQuestion nvarchar (250) = NULL,
		@FAQAnswer nvarchar (550) = NULL,
		        
        @RETURN_KEY bigint = null output,
        @CreatedByUserName nvarchar(256),
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME,
        @UpdatedDate DATETIME= NULL,        
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) ,
        @Ts bigint = NULL
	AS
	BEGIN
		
        
		INSERT INTO Gen_FAQ (
			FAQCategoryID,
			FAQQuestion,
			FAQAnswer,
			TransID,
			CreatedByUserName,
			CreatedDate,
  			IPAddress
		)
		VALUES (
			@FAQCategoryID,
			@FAQQuestion,
			@FAQAnswer,
			@TransID,
			@CreatedByUserName,
			@CreatedDate,
			@IPAddress
					)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END  
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
CREATE PROCEDURE gen_faq_Upd
		@FAQID bigint  = NULL,
		@FAQCategoryID bigint  = NULL,
		@FAQQuestion nvarchar (250) = NULL,
		@FAQAnswer nvarchar (550) = NULL,
		        
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
		UPDATE Gen_FAQ
		SET
			FAQCategoryID = @FAQCategoryID,
			FAQQuestion = @FAQQuestion,
			FAQAnswer = @FAQAnswer,
			TransID = @TransID,
			UpdatedByUserName = @UpdatedByUserName,
			UpdatedDate = @UpdatedDate,
			IPAddress = @IPAddress
		WHERE
			FAQID = @FAQID
    SET @RETURN_KEY =@FAQID
		    
	END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/	
CREATE PROCEDURE gen_faq_Del		        
		@FAQID bigint  = NULL,
		@FAQCategoryID bigint  = NULL,
		@FAQQuestion nvarchar (250) = NULL,
		@FAQAnswer nvarchar (550) = NULL,
		        
        @RETURN_KEY bigint = null output,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME= NULL,
        @UpdatedDate DATETIME= NULL,
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) ,
        @Ts bigint = NULL
	AS
	BEGIN
		DELETE FROM Gen_FAQ
		WHERE 
			FAQID = @FAQID
		
    SET @RETURN_KEY =@FAQID
		
		
	END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
CREATE PROCEDURE gen_faq_GA 
		@FAQID bigint  = NULL,
		@FAQCategoryID bigint  = NULL,
		@FAQQuestion nvarchar (250) = NULL,
		@FAQAnswer nvarchar (550) = NULL,
		    
        @SortExpression VARCHAR(MAX)  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME = NULL,
        @UpdatedDate DATETIME = NULL,
        @IPAddress varchar(100) = NULL,
        @TransID nvarchar(250) = NULL,
        @Ts bigint = NULL
        
	AS
	BEGIN
		SELECT 
			Gen_FAQ.FAQID,
			Gen_FAQ.FAQCategoryID,
			Gen_FAQ.FAQQuestion,
			Gen_FAQ.FAQAnswer,
			Gen_FAQ.TransID,
			Gen_FAQ.CreatedByUserName,
			Gen_FAQ.CreatedDate,
			Gen_FAQ.UpdatedByUserName,
			Gen_FAQ.UpdatedDate,
			Gen_FAQ.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='FAQID ASC' THEN Gen_FAQ.FAQID END ASC,
						CASE WHEN @SortExpression ='FAQID DESC' THEN Gen_FAQ.FAQID END DESC,
						CASE WHEN @SortExpression ='FAQCategoryID ASC' THEN Gen_FAQ.FAQCategoryID END ASC,
						CASE WHEN @SortExpression ='FAQCategoryID DESC' THEN Gen_FAQ.FAQCategoryID END DESC,
						CASE WHEN @SortExpression ='FAQQuestion ASC' THEN Gen_FAQ.FAQQuestion END ASC,
						CASE WHEN @SortExpression ='FAQQuestion DESC' THEN Gen_FAQ.FAQQuestion END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Gen_FAQ.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Gen_FAQ.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Gen_FAQ.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Gen_FAQ.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Gen_FAQ.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Gen_FAQ.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Gen_FAQ.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Gen_FAQ.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Gen_FAQ.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Gen_FAQ.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Gen_FAQ.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Gen_FAQ.IPAddress END DESC
				) as RowNumber
		FROM Gen_FAQ 
		where
			(CASE WHEN @FAQID is NULL THEN 1 WHEN Gen_FAQ.FAQID  = @FAQID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FAQCategoryID is NULL THEN 1 WHEN Gen_FAQ.FAQCategoryID  = @FAQCategoryID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FAQQuestion is NULL THEN 1 WHEN Gen_FAQ.FAQQuestion  = @FAQQuestion THEN 1 ELSE 0 END = 1)
			
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Gen_FAQ.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Gen_FAQ.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
	END  
GO	



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
CREATE PROCEDURE gen_faq_GAPg 
		@FAQID bigint  = NULL,
		@FAQCategoryID bigint  = NULL,
		@FAQQuestion nvarchar (250) = NULL,
		@FAQAnswer nvarchar (550) = NULL,
		    
        @TotalRecord bigint = null output,
        @SortExpression VARCHAR(MAX)  = NULL,
        @PageSize BIGINT = NULL,
        @CurrentPage BIGINT  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME= NULL,
        @UpdatedDate DATETIME= NULL,
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) = NULL,
        @TS varchar(100)= NULL
    
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					gen_faq
				WHERE 
					(CASE WHEN @FAQID is NULL THEN 1 WHEN Gen_FAQ.FAQID  = @FAQID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @FAQCategoryID is NULL THEN 1 WHEN Gen_FAQ.FAQCategoryID  = @FAQCategoryID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @FAQQuestion is NULL THEN 1 WHEN Gen_FAQ.FAQQuestion  = @FAQQuestion THEN 1 ELSE 0 END = 1)
					
					
					AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Gen_FAQ.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Gen_FAQ.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
					
					
					
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedgen_faq AS
			(
				  SELECT 
			Gen_FAQ.FAQID,
			Gen_FAQ.FAQCategoryID,
			Gen_FAQ.FAQQuestion,
			Gen_FAQ.FAQAnswer,
			Gen_FAQ.TransID,
			Gen_FAQ.CreatedByUserName,
			Gen_FAQ.CreatedDate,
			Gen_FAQ.UpdatedByUserName,
			Gen_FAQ.UpdatedDate,
			Gen_FAQ.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='FAQID ASC' THEN Gen_FAQ.FAQID END ASC,
						CASE WHEN @SortExpression ='FAQID DESC' THEN Gen_FAQ.FAQID END DESC,
						CASE WHEN @SortExpression ='FAQCategoryID ASC' THEN Gen_FAQ.FAQCategoryID END ASC,
						CASE WHEN @SortExpression ='FAQCategoryID DESC' THEN Gen_FAQ.FAQCategoryID END DESC,
						CASE WHEN @SortExpression ='FAQQuestion ASC' THEN Gen_FAQ.FAQQuestion END ASC,
						CASE WHEN @SortExpression ='FAQQuestion DESC' THEN Gen_FAQ.FAQQuestion END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Gen_FAQ.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Gen_FAQ.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Gen_FAQ.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Gen_FAQ.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Gen_FAQ.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Gen_FAQ.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Gen_FAQ.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Gen_FAQ.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Gen_FAQ.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Gen_FAQ.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Gen_FAQ.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Gen_FAQ.IPAddress END DESC
				) as RowNumber
		FROM Gen_FAQ 
		where
			(CASE WHEN @FAQID is NULL THEN 1 WHEN Gen_FAQ.FAQID  = @FAQID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FAQCategoryID is NULL THEN 1 WHEN Gen_FAQ.FAQCategoryID  = @FAQCategoryID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FAQQuestion is NULL THEN 1 WHEN Gen_FAQ.FAQQuestion  = @FAQQuestion THEN 1 ELSE 0 END = 1)
			
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Gen_FAQ.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Gen_FAQ.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
			)
			SELECT * 
			FROM  tempPagedgen_faq
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END  
GO	


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	

/*
Creator : KAF
*/
CREATE PROCEDURE gen_faqcategory_Ins 
		@FAQCategoryID bigint  = NULL,
		@FAQCategory nvarchar (150) = NULL,
		        
        @RETURN_KEY bigint = null output,
        @CreatedByUserName nvarchar(256),
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME,
        @UpdatedDate DATETIME= NULL,        
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) ,
        @Ts bigint = NULL
	AS
	BEGIN
		
        
		INSERT INTO Gen_FAQCategory (
			FAQCategory,
			TransID,
			CreatedByUserName,
			CreatedDate,
  			IPAddress
		)
		VALUES (
			@FAQCategory,
			@TransID,
			@CreatedByUserName,
			@CreatedDate,
			@IPAddress
					)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END  
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
CREATE PROCEDURE gen_faqcategory_Upd
		@FAQCategoryID bigint  = NULL,
		@FAQCategory nvarchar (150) = NULL,
		        
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
		UPDATE Gen_FAQCategory
		SET
			FAQCategory = @FAQCategory,
			TransID = @TransID,
			UpdatedByUserName = @UpdatedByUserName,
			UpdatedDate = @UpdatedDate,
			IPAddress = @IPAddress
		WHERE
			FAQCategoryID = @FAQCategoryID
    SET @RETURN_KEY =@FAQCategoryID
		    
	END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/	
CREATE PROCEDURE gen_faqcategory_Del		        
		@FAQCategoryID bigint  = NULL,
		@FAQCategory nvarchar (150) = NULL,
		        
        @RETURN_KEY bigint = null output,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME= NULL,
        @UpdatedDate DATETIME= NULL,
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) ,
        @Ts bigint = NULL
	AS
	BEGIN
		DELETE FROM Gen_FAQCategory
		WHERE 
			FAQCategoryID = @FAQCategoryID
		
    SET @RETURN_KEY =@FAQCategoryID
		
		
	END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
CREATE PROCEDURE gen_faqcategory_GA 
		@FAQCategoryID bigint  = NULL,
		@FAQCategory nvarchar (150) = NULL,
		    
        @SortExpression VARCHAR(MAX)  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME = NULL,
        @UpdatedDate DATETIME = NULL,
        @IPAddress varchar(100) = NULL,
        @TransID nvarchar(250) = NULL,
        @Ts bigint = NULL
        
	AS
	BEGIN
		SELECT 
			Gen_FAQCategory.FAQCategoryID,
			Gen_FAQCategory.FAQCategory,
			Gen_FAQCategory.TransID,
			Gen_FAQCategory.CreatedByUserName,
			Gen_FAQCategory.CreatedDate,
			Gen_FAQCategory.UpdatedByUserName,
			Gen_FAQCategory.UpdatedDate,
			Gen_FAQCategory.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='FAQCategoryID ASC' THEN Gen_FAQCategory.FAQCategoryID END ASC,
						CASE WHEN @SortExpression ='FAQCategoryID DESC' THEN Gen_FAQCategory.FAQCategoryID END DESC,
						CASE WHEN @SortExpression ='FAQCategory ASC' THEN Gen_FAQCategory.FAQCategory END ASC,
						CASE WHEN @SortExpression ='FAQCategory DESC' THEN Gen_FAQCategory.FAQCategory END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Gen_FAQCategory.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Gen_FAQCategory.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Gen_FAQCategory.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Gen_FAQCategory.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Gen_FAQCategory.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Gen_FAQCategory.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Gen_FAQCategory.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Gen_FAQCategory.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Gen_FAQCategory.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Gen_FAQCategory.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Gen_FAQCategory.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Gen_FAQCategory.IPAddress END DESC
				) as RowNumber
		FROM Gen_FAQCategory 
		where
			(CASE WHEN @FAQCategoryID is NULL THEN 1 WHEN Gen_FAQCategory.FAQCategoryID  = @FAQCategoryID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FAQCategory is NULL THEN 1 WHEN Gen_FAQCategory.FAQCategory  = @FAQCategory THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Gen_FAQCategory.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Gen_FAQCategory.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
	END  
GO	



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
CREATE PROCEDURE gen_faqcategory_GAPg 
		@FAQCategoryID bigint  = NULL,
		@FAQCategory nvarchar (150) = NULL,
		    
        @TotalRecord bigint = null output,
        @SortExpression VARCHAR(MAX)  = NULL,
        @PageSize BIGINT = NULL,
        @CurrentPage BIGINT  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME= NULL,
        @UpdatedDate DATETIME= NULL,
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) = NULL,
        @TS varchar(100)= NULL
    
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					gen_faqcategory
				WHERE 
					(CASE WHEN @FAQCategoryID is NULL THEN 1 WHEN Gen_FAQCategory.FAQCategoryID  = @FAQCategoryID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @FAQCategory is NULL THEN 1 WHEN Gen_FAQCategory.FAQCategory  = @FAQCategory THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Gen_FAQCategory.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Gen_FAQCategory.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
					
					
					
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedgen_faqcategory AS
			(
				  SELECT 
			Gen_FAQCategory.FAQCategoryID,
			Gen_FAQCategory.FAQCategory,
			Gen_FAQCategory.TransID,
			Gen_FAQCategory.CreatedByUserName,
			Gen_FAQCategory.CreatedDate,
			Gen_FAQCategory.UpdatedByUserName,
			Gen_FAQCategory.UpdatedDate,
			Gen_FAQCategory.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='FAQCategoryID ASC' THEN Gen_FAQCategory.FAQCategoryID END ASC,
						CASE WHEN @SortExpression ='FAQCategoryID DESC' THEN Gen_FAQCategory.FAQCategoryID END DESC,
						CASE WHEN @SortExpression ='FAQCategory ASC' THEN Gen_FAQCategory.FAQCategory END ASC,
						CASE WHEN @SortExpression ='FAQCategory DESC' THEN Gen_FAQCategory.FAQCategory END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Gen_FAQCategory.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Gen_FAQCategory.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Gen_FAQCategory.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Gen_FAQCategory.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Gen_FAQCategory.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Gen_FAQCategory.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Gen_FAQCategory.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Gen_FAQCategory.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Gen_FAQCategory.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Gen_FAQCategory.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Gen_FAQCategory.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Gen_FAQCategory.IPAddress END DESC
				) as RowNumber
		FROM Gen_FAQCategory 
		where
			(CASE WHEN @FAQCategoryID is NULL THEN 1 WHEN Gen_FAQCategory.FAQCategoryID  = @FAQCategoryID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FAQCategory is NULL THEN 1 WHEN Gen_FAQCategory.FAQCategory  = @FAQCategory THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Gen_FAQCategory.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Gen_FAQCategory.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
			)
			SELECT * 
			FROM  tempPagedgen_faqcategory
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END  
GO	


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	

/*
Creator : KAF
*/
CREATE PROCEDURE gen_imagegallary_Ins 
		@ImageGallaryID bigint  = NULL,
		@ImageGallaryCategoryID bigint  = NULL,
		@ImagePath varchar (250) = NULL,
		@ImageType nvarchar (50) = NULL,
		@ImageExtension nvarchar (50) = NULL,
		@ImageName nvarchar (50) = NULL,
		@IsInSlider bit  = NULL,
		        
        @RETURN_KEY bigint = null output,
        @CreatedByUserName nvarchar(256),
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME,
        @UpdatedDate DATETIME= NULL,        
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) ,
        @Ts bigint = NULL
	AS
	BEGIN
		
        
		INSERT INTO Gen_ImageGallary (
			ImageGallaryCategoryID,
			ImagePath,
			ImageType,
			ImageExtension,
			ImageName,
			IsInSlider,
			TransID,
			CreatedByUserName,
			CreatedDate,
  			IPAddress
		)
		VALUES (
			@ImageGallaryCategoryID,
			@ImagePath,
			@ImageType,
			@ImageExtension,
			@ImageName,
			@IsInSlider,
			@TransID,
			@CreatedByUserName,
			@CreatedDate,
			@IPAddress
					)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END  
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
CREATE PROCEDURE gen_imagegallary_Upd
		@ImageGallaryID bigint  = NULL,
		@ImageGallaryCategoryID bigint  = NULL,
		@ImagePath varchar (250) = NULL,
		@ImageType nvarchar (50) = NULL,
		@ImageExtension nvarchar (50) = NULL,
		@ImageName nvarchar (50) = NULL,
		@IsInSlider bit  = NULL,
		        
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
		UPDATE Gen_ImageGallary
		SET
			ImageGallaryCategoryID = @ImageGallaryCategoryID,
			ImagePath = @ImagePath,
			ImageType = @ImageType,
			ImageExtension = @ImageExtension,
			ImageName = @ImageName,
			IsInSlider = @IsInSlider,
			TransID = @TransID,
			UpdatedByUserName = @UpdatedByUserName,
			UpdatedDate = @UpdatedDate,
			IPAddress = @IPAddress
		WHERE
			ImageGallaryID = @ImageGallaryID
    SET @RETURN_KEY =@ImageGallaryID
		    
	END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/	
CREATE PROCEDURE gen_imagegallary_Del		        
		@ImageGallaryID bigint  = NULL,
		@ImageGallaryCategoryID bigint  = NULL,
		@ImagePath varchar (250) = NULL,
		@ImageType nvarchar (50) = NULL,
		@ImageExtension nvarchar (50) = NULL,
		@ImageName nvarchar (50) = NULL,
		@IsInSlider bit  = NULL,
		        
        @RETURN_KEY bigint = null output,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME= NULL,
        @UpdatedDate DATETIME= NULL,
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) ,
        @Ts bigint = NULL
	AS
	BEGIN
		DELETE FROM Gen_ImageGallary
		WHERE 
			ImageGallaryID = @ImageGallaryID
		
    SET @RETURN_KEY =@ImageGallaryID
		
		
	END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
CREATE PROCEDURE gen_imagegallary_GA 
		@ImageGallaryID bigint  = NULL,
		@ImageGallaryCategoryID bigint  = NULL,
		@ImagePath varchar (250) = NULL,
		@ImageType nvarchar (50) = NULL,
		@ImageExtension nvarchar (50) = NULL,
		@ImageName nvarchar (50) = NULL,
		@IsInSlider bit  = NULL,
		    
        @SortExpression VARCHAR(MAX)  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME = NULL,
        @UpdatedDate DATETIME = NULL,
        @IPAddress varchar(100) = NULL,
        @TransID nvarchar(250) = NULL,
        @Ts bigint = NULL
        
	AS
	BEGIN
		SELECT 
			Gen_ImageGallary.ImageGallaryID,
			Gen_ImageGallary.ImageGallaryCategoryID,
			Gen_ImageGallary.ImagePath,
			Gen_ImageGallary.ImageType,
			Gen_ImageGallary.ImageExtension,
			Gen_ImageGallary.ImageName,
			Gen_ImageGallary.IsInSlider,
			Gen_ImageGallary.TransID,
			Gen_ImageGallary.CreatedByUserName,
			Gen_ImageGallary.CreatedDate,
			Gen_ImageGallary.UpdatedByUserName,
			Gen_ImageGallary.UpdatedDate,
			Gen_ImageGallary.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='ImageGallaryID ASC' THEN Gen_ImageGallary.ImageGallaryID END ASC,
						CASE WHEN @SortExpression ='ImageGallaryID DESC' THEN Gen_ImageGallary.ImageGallaryID END DESC,
						CASE WHEN @SortExpression ='ImageGallaryCategoryID ASC' THEN Gen_ImageGallary.ImageGallaryCategoryID END ASC,
						CASE WHEN @SortExpression ='ImageGallaryCategoryID DESC' THEN Gen_ImageGallary.ImageGallaryCategoryID END DESC,
						CASE WHEN @SortExpression ='ImagePath ASC' THEN Gen_ImageGallary.ImagePath END ASC,
						CASE WHEN @SortExpression ='ImagePath DESC' THEN Gen_ImageGallary.ImagePath END DESC,
						CASE WHEN @SortExpression ='ImageType ASC' THEN Gen_ImageGallary.ImageType END ASC,
						CASE WHEN @SortExpression ='ImageType DESC' THEN Gen_ImageGallary.ImageType END DESC,
						CASE WHEN @SortExpression ='ImageExtension ASC' THEN Gen_ImageGallary.ImageExtension END ASC,
						CASE WHEN @SortExpression ='ImageExtension DESC' THEN Gen_ImageGallary.ImageExtension END DESC,
						CASE WHEN @SortExpression ='ImageName ASC' THEN Gen_ImageGallary.ImageName END ASC,
						CASE WHEN @SortExpression ='ImageName DESC' THEN Gen_ImageGallary.ImageName END DESC,
						CASE WHEN @SortExpression ='IsInSlider ASC' THEN Gen_ImageGallary.IsInSlider END ASC,
						CASE WHEN @SortExpression ='IsInSlider DESC' THEN Gen_ImageGallary.IsInSlider END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Gen_ImageGallary.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Gen_ImageGallary.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Gen_ImageGallary.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Gen_ImageGallary.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Gen_ImageGallary.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Gen_ImageGallary.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Gen_ImageGallary.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Gen_ImageGallary.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Gen_ImageGallary.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Gen_ImageGallary.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Gen_ImageGallary.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Gen_ImageGallary.IPAddress END DESC
				) as RowNumber
		FROM Gen_ImageGallary 
		where
			(CASE WHEN @ImageGallaryID is NULL THEN 1 WHEN Gen_ImageGallary.ImageGallaryID  = @ImageGallaryID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ImageGallaryCategoryID is NULL THEN 1 WHEN Gen_ImageGallary.ImageGallaryCategoryID  = @ImageGallaryCategoryID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ImagePath is NULL THEN 1 WHEN Gen_ImageGallary.ImagePath  = @ImagePath THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ImageType is NULL THEN 1 WHEN Gen_ImageGallary.ImageType  = @ImageType THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ImageExtension is NULL THEN 1 WHEN Gen_ImageGallary.ImageExtension  = @ImageExtension THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ImageName is NULL THEN 1 WHEN Gen_ImageGallary.ImageName  = @ImageName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsInSlider is NULL THEN 1 WHEN Gen_ImageGallary.IsInSlider  = @IsInSlider THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Gen_ImageGallary.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Gen_ImageGallary.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
	END  
GO	



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
CREATE PROCEDURE gen_imagegallary_GAPg 
		@ImageGallaryID bigint  = NULL,
		@ImageGallaryCategoryID bigint  = NULL,
		@ImagePath varchar (250) = NULL,
		@ImageType nvarchar (50) = NULL,
		@ImageExtension nvarchar (50) = NULL,
		@ImageName nvarchar (50) = NULL,
		@IsInSlider bit  = NULL,
		    
        @TotalRecord bigint = null output,
        @SortExpression VARCHAR(MAX)  = NULL,
        @PageSize BIGINT = NULL,
        @CurrentPage BIGINT  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME= NULL,
        @UpdatedDate DATETIME= NULL,
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) = NULL,
        @TS varchar(100)= NULL
    
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					gen_imagegallary
				WHERE 
					(CASE WHEN @ImageGallaryID is NULL THEN 1 WHEN Gen_ImageGallary.ImageGallaryID  = @ImageGallaryID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ImageGallaryCategoryID is NULL THEN 1 WHEN Gen_ImageGallary.ImageGallaryCategoryID  = @ImageGallaryCategoryID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ImagePath is NULL THEN 1 WHEN Gen_ImageGallary.ImagePath  = @ImagePath THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ImageType is NULL THEN 1 WHEN Gen_ImageGallary.ImageType  = @ImageType THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ImageExtension is NULL THEN 1 WHEN Gen_ImageGallary.ImageExtension  = @ImageExtension THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ImageName is NULL THEN 1 WHEN Gen_ImageGallary.ImageName  = @ImageName THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @IsInSlider is NULL THEN 1 WHEN Gen_ImageGallary.IsInSlider  = @IsInSlider THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Gen_ImageGallary.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Gen_ImageGallary.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
					
					
					
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedgen_imagegallary AS
			(
				  SELECT 
			Gen_ImageGallary.ImageGallaryID,
			Gen_ImageGallary.ImageGallaryCategoryID,
			Gen_ImageGallary.ImagePath,
			Gen_ImageGallary.ImageType,
			Gen_ImageGallary.ImageExtension,
			Gen_ImageGallary.ImageName,
			Gen_ImageGallary.IsInSlider,
			Gen_ImageGallary.TransID,
			Gen_ImageGallary.CreatedByUserName,
			Gen_ImageGallary.CreatedDate,
			Gen_ImageGallary.UpdatedByUserName,
			Gen_ImageGallary.UpdatedDate,
			Gen_ImageGallary.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='ImageGallaryID ASC' THEN Gen_ImageGallary.ImageGallaryID END ASC,
						CASE WHEN @SortExpression ='ImageGallaryID DESC' THEN Gen_ImageGallary.ImageGallaryID END DESC,
						CASE WHEN @SortExpression ='ImageGallaryCategoryID ASC' THEN Gen_ImageGallary.ImageGallaryCategoryID END ASC,
						CASE WHEN @SortExpression ='ImageGallaryCategoryID DESC' THEN Gen_ImageGallary.ImageGallaryCategoryID END DESC,
						CASE WHEN @SortExpression ='ImagePath ASC' THEN Gen_ImageGallary.ImagePath END ASC,
						CASE WHEN @SortExpression ='ImagePath DESC' THEN Gen_ImageGallary.ImagePath END DESC,
						CASE WHEN @SortExpression ='ImageType ASC' THEN Gen_ImageGallary.ImageType END ASC,
						CASE WHEN @SortExpression ='ImageType DESC' THEN Gen_ImageGallary.ImageType END DESC,
						CASE WHEN @SortExpression ='ImageExtension ASC' THEN Gen_ImageGallary.ImageExtension END ASC,
						CASE WHEN @SortExpression ='ImageExtension DESC' THEN Gen_ImageGallary.ImageExtension END DESC,
						CASE WHEN @SortExpression ='ImageName ASC' THEN Gen_ImageGallary.ImageName END ASC,
						CASE WHEN @SortExpression ='ImageName DESC' THEN Gen_ImageGallary.ImageName END DESC,
						CASE WHEN @SortExpression ='IsInSlider ASC' THEN Gen_ImageGallary.IsInSlider END ASC,
						CASE WHEN @SortExpression ='IsInSlider DESC' THEN Gen_ImageGallary.IsInSlider END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Gen_ImageGallary.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Gen_ImageGallary.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Gen_ImageGallary.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Gen_ImageGallary.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Gen_ImageGallary.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Gen_ImageGallary.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Gen_ImageGallary.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Gen_ImageGallary.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Gen_ImageGallary.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Gen_ImageGallary.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Gen_ImageGallary.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Gen_ImageGallary.IPAddress END DESC
				) as RowNumber
		FROM Gen_ImageGallary 
		where
			(CASE WHEN @ImageGallaryID is NULL THEN 1 WHEN Gen_ImageGallary.ImageGallaryID  = @ImageGallaryID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ImageGallaryCategoryID is NULL THEN 1 WHEN Gen_ImageGallary.ImageGallaryCategoryID  = @ImageGallaryCategoryID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ImagePath is NULL THEN 1 WHEN Gen_ImageGallary.ImagePath  = @ImagePath THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ImageType is NULL THEN 1 WHEN Gen_ImageGallary.ImageType  = @ImageType THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ImageExtension is NULL THEN 1 WHEN Gen_ImageGallary.ImageExtension  = @ImageExtension THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ImageName is NULL THEN 1 WHEN Gen_ImageGallary.ImageName  = @ImageName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsInSlider is NULL THEN 1 WHEN Gen_ImageGallary.IsInSlider  = @IsInSlider THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Gen_ImageGallary.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Gen_ImageGallary.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
			)
			SELECT * 
			FROM  tempPagedgen_imagegallary
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END  
GO	


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	

/*
Creator : KAF
*/
CREATE PROCEDURE gen_imagegallarycategory_Ins 
		@ImageGallaryCategoryID bigint  = NULL,
		@CategoryName nvarchar (150) = NULL,
		@CategoryDescription nvarchar (250) = NULL,
		        
        @RETURN_KEY bigint = null output,
        @CreatedByUserName nvarchar(256),
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME,
        @UpdatedDate DATETIME= NULL,        
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) ,
        @Ts bigint = NULL
	AS
	BEGIN
		
        
		INSERT INTO Gen_ImageGallaryCategory (
			CategoryName,
			CategoryDescription,
			TransID,
			CreatedByUserName,
			CreatedDate,
  			IPAddress
		)
		VALUES (
			@CategoryName,
			@CategoryDescription,
			@TransID,
			@CreatedByUserName,
			@CreatedDate,
			@IPAddress
					)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END  
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
CREATE PROCEDURE gen_imagegallarycategory_Upd
		@ImageGallaryCategoryID bigint  = NULL,
		@CategoryName nvarchar (150) = NULL,
		@CategoryDescription nvarchar (250) = NULL,
		        
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
		UPDATE Gen_ImageGallaryCategory
		SET
			CategoryName = @CategoryName,
			CategoryDescription = @CategoryDescription,
			TransID = @TransID,
			UpdatedByUserName = @UpdatedByUserName,
			UpdatedDate = @UpdatedDate,
			IPAddress = @IPAddress
		WHERE
			ImageGallaryCategoryID = @ImageGallaryCategoryID
    SET @RETURN_KEY =@ImageGallaryCategoryID
		    
	END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/	
CREATE PROCEDURE gen_imagegallarycategory_Del		        
		@ImageGallaryCategoryID bigint  = NULL,
		@CategoryName nvarchar (150) = NULL,
		@CategoryDescription nvarchar (250) = NULL,
		        
        @RETURN_KEY bigint = null output,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME= NULL,
        @UpdatedDate DATETIME= NULL,
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) ,
        @Ts bigint = NULL
	AS
	BEGIN
		DELETE FROM Gen_ImageGallaryCategory
		WHERE 
			ImageGallaryCategoryID = @ImageGallaryCategoryID
		
    SET @RETURN_KEY =@ImageGallaryCategoryID
		
		
	END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
CREATE PROCEDURE gen_imagegallarycategory_GA 
		@ImageGallaryCategoryID bigint  = NULL,
		@CategoryName nvarchar (150) = NULL,
		@CategoryDescription nvarchar (250) = NULL,
		    
        @SortExpression VARCHAR(MAX)  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME = NULL,
        @UpdatedDate DATETIME = NULL,
        @IPAddress varchar(100) = NULL,
        @TransID nvarchar(250) = NULL,
        @Ts bigint = NULL
        
	AS
	BEGIN
		SELECT 
			Gen_ImageGallaryCategory.ImageGallaryCategoryID,
			Gen_ImageGallaryCategory.CategoryName,
			Gen_ImageGallaryCategory.CategoryDescription,
			Gen_ImageGallaryCategory.TransID,
			Gen_ImageGallaryCategory.CreatedByUserName,
			Gen_ImageGallaryCategory.CreatedDate,
			Gen_ImageGallaryCategory.UpdatedByUserName,
			Gen_ImageGallaryCategory.UpdatedDate,
			Gen_ImageGallaryCategory.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='ImageGallaryCategoryID ASC' THEN Gen_ImageGallaryCategory.ImageGallaryCategoryID END ASC,
						CASE WHEN @SortExpression ='ImageGallaryCategoryID DESC' THEN Gen_ImageGallaryCategory.ImageGallaryCategoryID END DESC,
						CASE WHEN @SortExpression ='CategoryName ASC' THEN Gen_ImageGallaryCategory.CategoryName END ASC,
						CASE WHEN @SortExpression ='CategoryName DESC' THEN Gen_ImageGallaryCategory.CategoryName END DESC,
						CASE WHEN @SortExpression ='CategoryDescription ASC' THEN Gen_ImageGallaryCategory.CategoryDescription END ASC,
						CASE WHEN @SortExpression ='CategoryDescription DESC' THEN Gen_ImageGallaryCategory.CategoryDescription END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Gen_ImageGallaryCategory.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Gen_ImageGallaryCategory.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Gen_ImageGallaryCategory.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Gen_ImageGallaryCategory.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Gen_ImageGallaryCategory.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Gen_ImageGallaryCategory.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Gen_ImageGallaryCategory.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Gen_ImageGallaryCategory.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Gen_ImageGallaryCategory.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Gen_ImageGallaryCategory.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Gen_ImageGallaryCategory.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Gen_ImageGallaryCategory.IPAddress END DESC
				) as RowNumber
		FROM Gen_ImageGallaryCategory 
		where
			(CASE WHEN @ImageGallaryCategoryID is NULL THEN 1 WHEN Gen_ImageGallaryCategory.ImageGallaryCategoryID  = @ImageGallaryCategoryID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CategoryName is NULL THEN 1 WHEN Gen_ImageGallaryCategory.CategoryName  = @CategoryName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CategoryDescription is NULL THEN 1 WHEN Gen_ImageGallaryCategory.CategoryDescription  = @CategoryDescription THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Gen_ImageGallaryCategory.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Gen_ImageGallaryCategory.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
	END  
GO	



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
CREATE PROCEDURE gen_imagegallarycategory_GAPg 
		@ImageGallaryCategoryID bigint  = NULL,
		@CategoryName nvarchar (150) = NULL,
		@CategoryDescription nvarchar (250) = NULL,
		    
        @TotalRecord bigint = null output,
        @SortExpression VARCHAR(MAX)  = NULL,
        @PageSize BIGINT = NULL,
        @CurrentPage BIGINT  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME= NULL,
        @UpdatedDate DATETIME= NULL,
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) = NULL,
        @TS varchar(100)= NULL
    
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					gen_imagegallarycategory
				WHERE 
					(CASE WHEN @ImageGallaryCategoryID is NULL THEN 1 WHEN Gen_ImageGallaryCategory.ImageGallaryCategoryID  = @ImageGallaryCategoryID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CategoryName is NULL THEN 1 WHEN Gen_ImageGallaryCategory.CategoryName  = @CategoryName THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CategoryDescription is NULL THEN 1 WHEN Gen_ImageGallaryCategory.CategoryDescription  = @CategoryDescription THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Gen_ImageGallaryCategory.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Gen_ImageGallaryCategory.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
					
					
					
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedgen_imagegallarycategory AS
			(
				  SELECT 
			Gen_ImageGallaryCategory.ImageGallaryCategoryID,
			Gen_ImageGallaryCategory.CategoryName,
			Gen_ImageGallaryCategory.CategoryDescription,
			Gen_ImageGallaryCategory.TransID,
			Gen_ImageGallaryCategory.CreatedByUserName,
			Gen_ImageGallaryCategory.CreatedDate,
			Gen_ImageGallaryCategory.UpdatedByUserName,
			Gen_ImageGallaryCategory.UpdatedDate,
			Gen_ImageGallaryCategory.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='ImageGallaryCategoryID ASC' THEN Gen_ImageGallaryCategory.ImageGallaryCategoryID END ASC,
						CASE WHEN @SortExpression ='ImageGallaryCategoryID DESC' THEN Gen_ImageGallaryCategory.ImageGallaryCategoryID END DESC,
						CASE WHEN @SortExpression ='CategoryName ASC' THEN Gen_ImageGallaryCategory.CategoryName END ASC,
						CASE WHEN @SortExpression ='CategoryName DESC' THEN Gen_ImageGallaryCategory.CategoryName END DESC,
						CASE WHEN @SortExpression ='CategoryDescription ASC' THEN Gen_ImageGallaryCategory.CategoryDescription END ASC,
						CASE WHEN @SortExpression ='CategoryDescription DESC' THEN Gen_ImageGallaryCategory.CategoryDescription END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Gen_ImageGallaryCategory.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Gen_ImageGallaryCategory.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Gen_ImageGallaryCategory.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Gen_ImageGallaryCategory.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Gen_ImageGallaryCategory.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Gen_ImageGallaryCategory.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Gen_ImageGallaryCategory.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Gen_ImageGallaryCategory.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Gen_ImageGallaryCategory.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Gen_ImageGallaryCategory.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Gen_ImageGallaryCategory.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Gen_ImageGallaryCategory.IPAddress END DESC
				) as RowNumber
		FROM Gen_ImageGallaryCategory 
		where
			(CASE WHEN @ImageGallaryCategoryID is NULL THEN 1 WHEN Gen_ImageGallaryCategory.ImageGallaryCategoryID  = @ImageGallaryCategoryID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CategoryName is NULL THEN 1 WHEN Gen_ImageGallaryCategory.CategoryName  = @CategoryName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CategoryDescription is NULL THEN 1 WHEN Gen_ImageGallaryCategory.CategoryDescription  = @CategoryDescription THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Gen_ImageGallaryCategory.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Gen_ImageGallaryCategory.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
			)
			SELECT * 
			FROM  tempPagedgen_imagegallarycategory
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END  
GO	


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	

/*
Creator : KAF
*/
CREATE PROCEDURE gen_linkedservice_Ins 
		@LinkedServiceID bigint  = NULL,
		@LinkedServiceNameEN nvarchar (250) = NULL,
		@LinkedServiceNameAR nvarchar (250) = NULL,
		@LinkServiceLOGOPath nvarchar (350) = NULL,
		@LinkedServiceHyperLink nvarchar (350) = NULL,
		@URLOpenTarget nvarchar (50) = NULL,
		        
        @RETURN_KEY bigint = null output,
        @CreatedByUserName nvarchar(256),
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME,
        @UpdatedDate DATETIME= NULL,        
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) ,
        @Ts bigint = NULL
	AS
	BEGIN
		
        
		INSERT INTO Gen_LinkedService (
			LinkedServiceNameEN,
			LinkedServiceNameAR,
			LinkServiceLOGOPath,
			LinkedServiceHyperLink,
			URLOpenTarget,
			TransID,
			CreatedByUserName,
			CreatedDate,
  			IPAddress
		)
		VALUES (
			@LinkedServiceNameEN,
			@LinkedServiceNameAR,
			@LinkServiceLOGOPath,
			@LinkedServiceHyperLink,
			@URLOpenTarget,
			@TransID,
			@CreatedByUserName,
			@CreatedDate,
			@IPAddress
					)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END  
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
CREATE PROCEDURE gen_linkedservice_Upd
		@LinkedServiceID bigint  = NULL,
		@LinkedServiceNameEN nvarchar (250) = NULL,
		@LinkedServiceNameAR nvarchar (250) = NULL,
		@LinkServiceLOGOPath nvarchar (350) = NULL,
		@LinkedServiceHyperLink nvarchar (350) = NULL,
		@URLOpenTarget nvarchar (50) = NULL,
		        
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
		UPDATE Gen_LinkedService
		SET
			LinkedServiceNameEN = @LinkedServiceNameEN,
			LinkedServiceNameAR = @LinkedServiceNameAR,
			LinkServiceLOGOPath = @LinkServiceLOGOPath,
			LinkedServiceHyperLink = @LinkedServiceHyperLink,
			URLOpenTarget = @URLOpenTarget,
			TransID = @TransID,
			UpdatedByUserName = @UpdatedByUserName,
			UpdatedDate = @UpdatedDate,
			IPAddress = @IPAddress
		WHERE
			LinkedServiceID = @LinkedServiceID
    SET @RETURN_KEY =@LinkedServiceID
		    
	END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/	
CREATE PROCEDURE gen_linkedservice_Del		        
		@LinkedServiceID bigint  = NULL,
		@LinkedServiceNameEN nvarchar (250) = NULL,
		@LinkedServiceNameAR nvarchar (250) = NULL,
		@LinkServiceLOGOPath nvarchar (350) = NULL,
		@LinkedServiceHyperLink nvarchar (350) = NULL,
		@URLOpenTarget nvarchar (50) = NULL,
		        
        @RETURN_KEY bigint = null output,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME= NULL,
        @UpdatedDate DATETIME= NULL,
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) ,
        @Ts bigint = NULL
	AS
	BEGIN
		DELETE FROM Gen_LinkedService
		WHERE 
			LinkedServiceID = @LinkedServiceID
		
    SET @RETURN_KEY =@LinkedServiceID
		
		
	END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
CREATE PROCEDURE gen_linkedservice_GA 
		@LinkedServiceID bigint  = NULL,
		@LinkedServiceNameEN nvarchar (250) = NULL,
		@LinkedServiceNameAR nvarchar (250) = NULL,
		@LinkServiceLOGOPath nvarchar (350) = NULL,
		@LinkedServiceHyperLink nvarchar (350) = NULL,
		@URLOpenTarget nvarchar (50) = NULL,
		    
        @SortExpression VARCHAR(MAX)  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME = NULL,
        @UpdatedDate DATETIME = NULL,
        @IPAddress varchar(100) = NULL,
        @TransID nvarchar(250) = NULL,
        @Ts bigint = NULL
        
	AS
	BEGIN
		SELECT 
			Gen_LinkedService.LinkedServiceID,
			Gen_LinkedService.LinkedServiceNameEN,
			Gen_LinkedService.LinkedServiceNameAR,
			Gen_LinkedService.LinkServiceLOGOPath,
			Gen_LinkedService.LinkedServiceHyperLink,
			Gen_LinkedService.URLOpenTarget,
			Gen_LinkedService.TransID,
			Gen_LinkedService.CreatedByUserName,
			Gen_LinkedService.CreatedDate,
			Gen_LinkedService.UpdatedByUserName,
			Gen_LinkedService.UpdatedDate,
			Gen_LinkedService.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='LinkedServiceID ASC' THEN Gen_LinkedService.LinkedServiceID END ASC,
						CASE WHEN @SortExpression ='LinkedServiceID DESC' THEN Gen_LinkedService.LinkedServiceID END DESC,
						CASE WHEN @SortExpression ='LinkedServiceNameEN ASC' THEN Gen_LinkedService.LinkedServiceNameEN END ASC,
						CASE WHEN @SortExpression ='LinkedServiceNameEN DESC' THEN Gen_LinkedService.LinkedServiceNameEN END DESC,
						CASE WHEN @SortExpression ='LinkedServiceNameAR ASC' THEN Gen_LinkedService.LinkedServiceNameAR END ASC,
						CASE WHEN @SortExpression ='LinkedServiceNameAR DESC' THEN Gen_LinkedService.LinkedServiceNameAR END DESC,
						CASE WHEN @SortExpression ='URLOpenTarget ASC' THEN Gen_LinkedService.URLOpenTarget END ASC,
						CASE WHEN @SortExpression ='URLOpenTarget DESC' THEN Gen_LinkedService.URLOpenTarget END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Gen_LinkedService.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Gen_LinkedService.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Gen_LinkedService.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Gen_LinkedService.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Gen_LinkedService.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Gen_LinkedService.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Gen_LinkedService.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Gen_LinkedService.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Gen_LinkedService.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Gen_LinkedService.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Gen_LinkedService.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Gen_LinkedService.IPAddress END DESC
				) as RowNumber
		FROM Gen_LinkedService 
		where
			(CASE WHEN @LinkedServiceID is NULL THEN 1 WHEN Gen_LinkedService.LinkedServiceID  = @LinkedServiceID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LinkedServiceNameEN is NULL THEN 1 WHEN Gen_LinkedService.LinkedServiceNameEN  = @LinkedServiceNameEN THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LinkedServiceNameAR is NULL THEN 1 WHEN Gen_LinkedService.LinkedServiceNameAR  = @LinkedServiceNameAR THEN 1 ELSE 0 END = 1)
			
			
			AND (CASE WHEN @URLOpenTarget is NULL THEN 1 WHEN Gen_LinkedService.URLOpenTarget  = @URLOpenTarget THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Gen_LinkedService.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Gen_LinkedService.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
	END  
GO	



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
CREATE PROCEDURE gen_linkedservice_GAPg 
		@LinkedServiceID bigint  = NULL,
		@LinkedServiceNameEN nvarchar (250) = NULL,
		@LinkedServiceNameAR nvarchar (250) = NULL,
		@LinkServiceLOGOPath nvarchar (350) = NULL,
		@LinkedServiceHyperLink nvarchar (350) = NULL,
		@URLOpenTarget nvarchar (50) = NULL,
		    
        @TotalRecord bigint = null output,
        @SortExpression VARCHAR(MAX)  = NULL,
        @PageSize BIGINT = NULL,
        @CurrentPage BIGINT  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME= NULL,
        @UpdatedDate DATETIME= NULL,
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) = NULL,
        @TS varchar(100)= NULL
    
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					gen_linkedservice
				WHERE 
					(CASE WHEN @LinkedServiceID is NULL THEN 1 WHEN Gen_LinkedService.LinkedServiceID  = @LinkedServiceID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @LinkedServiceNameEN is NULL THEN 1 WHEN Gen_LinkedService.LinkedServiceNameEN  = @LinkedServiceNameEN THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @LinkedServiceNameAR is NULL THEN 1 WHEN Gen_LinkedService.LinkedServiceNameAR  = @LinkedServiceNameAR THEN 1 ELSE 0 END = 1)
					
					
					AND (CASE WHEN @URLOpenTarget is NULL THEN 1 WHEN Gen_LinkedService.URLOpenTarget  = @URLOpenTarget THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Gen_LinkedService.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Gen_LinkedService.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
					
					
					
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedgen_linkedservice AS
			(
				  SELECT 
			Gen_LinkedService.LinkedServiceID,
			Gen_LinkedService.LinkedServiceNameEN,
			Gen_LinkedService.LinkedServiceNameAR,
			Gen_LinkedService.LinkServiceLOGOPath,
			Gen_LinkedService.LinkedServiceHyperLink,
			Gen_LinkedService.URLOpenTarget,
			Gen_LinkedService.TransID,
			Gen_LinkedService.CreatedByUserName,
			Gen_LinkedService.CreatedDate,
			Gen_LinkedService.UpdatedByUserName,
			Gen_LinkedService.UpdatedDate,
			Gen_LinkedService.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='LinkedServiceID ASC' THEN Gen_LinkedService.LinkedServiceID END ASC,
						CASE WHEN @SortExpression ='LinkedServiceID DESC' THEN Gen_LinkedService.LinkedServiceID END DESC,
						CASE WHEN @SortExpression ='LinkedServiceNameEN ASC' THEN Gen_LinkedService.LinkedServiceNameEN END ASC,
						CASE WHEN @SortExpression ='LinkedServiceNameEN DESC' THEN Gen_LinkedService.LinkedServiceNameEN END DESC,
						CASE WHEN @SortExpression ='LinkedServiceNameAR ASC' THEN Gen_LinkedService.LinkedServiceNameAR END ASC,
						CASE WHEN @SortExpression ='LinkedServiceNameAR DESC' THEN Gen_LinkedService.LinkedServiceNameAR END DESC,
						CASE WHEN @SortExpression ='URLOpenTarget ASC' THEN Gen_LinkedService.URLOpenTarget END ASC,
						CASE WHEN @SortExpression ='URLOpenTarget DESC' THEN Gen_LinkedService.URLOpenTarget END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Gen_LinkedService.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Gen_LinkedService.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Gen_LinkedService.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Gen_LinkedService.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Gen_LinkedService.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Gen_LinkedService.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Gen_LinkedService.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Gen_LinkedService.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Gen_LinkedService.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Gen_LinkedService.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Gen_LinkedService.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Gen_LinkedService.IPAddress END DESC
				) as RowNumber
		FROM Gen_LinkedService 
		where
			(CASE WHEN @LinkedServiceID is NULL THEN 1 WHEN Gen_LinkedService.LinkedServiceID  = @LinkedServiceID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LinkedServiceNameEN is NULL THEN 1 WHEN Gen_LinkedService.LinkedServiceNameEN  = @LinkedServiceNameEN THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LinkedServiceNameAR is NULL THEN 1 WHEN Gen_LinkedService.LinkedServiceNameAR  = @LinkedServiceNameAR THEN 1 ELSE 0 END = 1)
			
			
			AND (CASE WHEN @URLOpenTarget is NULL THEN 1 WHEN Gen_LinkedService.URLOpenTarget  = @URLOpenTarget THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Gen_LinkedService.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Gen_LinkedService.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
			)
			SELECT * 
			FROM  tempPagedgen_linkedservice
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END  
GO	


/*
KAF Information Center
*/
            
            
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
Create PROCEDURE gen_doctype_GAPgListView 
		@DocTypeID bigint  = NULL,
		@DocName nvarchar (150) = NULL,
		@DocPriority bigint  = NULL,
		@Remarks nvarchar (350) = NULL,
				
        @CommonSerachParam nvarchar(256)= NULL,
        
        @TotalRecord bigint = null output,
        @SortExpression VARCHAR(MAX)  = NULL,
        @PageSize BIGINT = NULL,
        @CurrentPage BIGINT  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME= NULL,
        @UpdatedDate DATETIME= NULL,
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) = NULL,
        @TS varchar(100)= NULL
    
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					gen_doctype
				WHERE 
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 					Gen_DocType.DocTypeID  like @CommonSerachParam
					 OR Gen_DocType.DocName  like @CommonSerachParam
					 OR Gen_DocType.DocPriority  like @CommonSerachParam
					 OR Gen_DocType.Remarks  like @CommonSerachParam
					
					
					
					
					
					
					
 THEN 1 ELSE 0 END = 1)			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedgen_doctype AS
			(
				  SELECT 
			Gen_DocType.DocTypeID,
			Gen_DocType.DocName,
			Gen_DocType.DocPriority,
			Gen_DocType.Remarks,
			Gen_DocType.TransID,
			Gen_DocType.CreatedByUserName,
			Gen_DocType.CreatedDate,
			Gen_DocType.UpdatedByUserName,
			Gen_DocType.UpdatedDate,
			Gen_DocType.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='DocTypeID ASC' THEN Gen_DocType.DocTypeID END ASC,
						CASE WHEN @SortExpression ='DocTypeID DESC' THEN Gen_DocType.DocTypeID END DESC,
						CASE WHEN @SortExpression ='DocName ASC' THEN Gen_DocType.DocName END ASC,
						CASE WHEN @SortExpression ='DocName DESC' THEN Gen_DocType.DocName END DESC,
						CASE WHEN @SortExpression ='DocPriority ASC' THEN Gen_DocType.DocPriority END ASC,
						CASE WHEN @SortExpression ='DocPriority DESC' THEN Gen_DocType.DocPriority END DESC,
						CASE WHEN @SortExpression ='Remarks ASC' THEN Gen_DocType.Remarks END ASC,
						CASE WHEN @SortExpression ='Remarks DESC' THEN Gen_DocType.Remarks END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Gen_DocType.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Gen_DocType.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Gen_DocType.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Gen_DocType.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Gen_DocType.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Gen_DocType.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Gen_DocType.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Gen_DocType.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Gen_DocType.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Gen_DocType.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Gen_DocType.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Gen_DocType.IPAddress END DESC
				) as RowNumber
		FROM Gen_DocType 
		where
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 			Gen_DocType.DocTypeID  like @CommonSerachParam
			 OR Gen_DocType.DocName  like @CommonSerachParam
			 OR Gen_DocType.DocPriority  like @CommonSerachParam
			 OR Gen_DocType.Remarks  like @CommonSerachParam
			
			
			
			
			
			
			
 THEN 1 ELSE 0 END = 1)			)
			SELECT * 
			FROM  tempPagedgen_doctype
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END  
GO
            
            
            
            
            
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
Create PROCEDURE gen_doctype_GS
		@DocTypeID bigint  = NULL,
		@DocName nvarchar (150) = NULL,
		@DocPriority bigint  = NULL,
		@Remarks nvarchar (350) = NULL,
		    
        @SortExpression VARCHAR(MAX)  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME = NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @UpdatedDate DATETIME = NULL,
        @IPAddress varchar(100) = NULL,
        @TransID nvarchar(250) = NULL,
        @Ts bigint = NULL
        
	AS
	BEGIN
		SELECT 
			Gen_DocType.DocTypeID,
			Gen_DocType.DocName,
			Gen_DocType.DocPriority,
			Gen_DocType.Remarks,
			Gen_DocType.TransID,
			Gen_DocType.CreatedByUserName,
			Gen_DocType.CreatedDate,
			Gen_DocType.UpdatedByUserName,
			Gen_DocType.UpdatedDate,
			Gen_DocType.IPAddress,
			CONVERT(bigint, TS) as TS
		FROM Gen_DocType 
		where
			DocTypeID = @DocTypeID
	END  
GO	

            
            



            
            
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
Create PROCEDURE gen_faq_GAPgListView 
		@FAQID bigint  = NULL,
		@FAQCategoryID bigint  = NULL,
		@FAQQuestion nvarchar (250) = NULL,
		@FAQAnswer nvarchar (550) = NULL,
				
        @CommonSerachParam nvarchar(256)= NULL,
        
        @TotalRecord bigint = null output,
        @SortExpression VARCHAR(MAX)  = NULL,
        @PageSize BIGINT = NULL,
        @CurrentPage BIGINT  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME= NULL,
        @UpdatedDate DATETIME= NULL,
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) = NULL,
        @TS varchar(100)= NULL
    
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					gen_faq
				WHERE 
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 					Gen_FAQ.FAQID  like @CommonSerachParam
					 OR Gen_FAQ.FAQCategoryID  like @CommonSerachParam
					 OR Gen_FAQ.FAQQuestion  like @CommonSerachParam
					 OR Gen_FAQ.FAQAnswer  like @CommonSerachParam
					
					
					
					
					
					
					
 THEN 1 ELSE 0 END = 1)			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedgen_faq AS
			(
				  SELECT 
			Gen_FAQ.FAQID,
			Gen_FAQ.FAQCategoryID,
			Gen_FAQ.FAQQuestion,
			Gen_FAQ.FAQAnswer,
			Gen_FAQ.TransID,
			Gen_FAQ.CreatedByUserName,
			Gen_FAQ.CreatedDate,
			Gen_FAQ.UpdatedByUserName,
			Gen_FAQ.UpdatedDate,
			Gen_FAQ.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='FAQID ASC' THEN Gen_FAQ.FAQID END ASC,
						CASE WHEN @SortExpression ='FAQID DESC' THEN Gen_FAQ.FAQID END DESC,
						CASE WHEN @SortExpression ='FAQCategoryID ASC' THEN Gen_FAQ.FAQCategoryID END ASC,
						CASE WHEN @SortExpression ='FAQCategoryID DESC' THEN Gen_FAQ.FAQCategoryID END DESC,
						CASE WHEN @SortExpression ='FAQQuestion ASC' THEN Gen_FAQ.FAQQuestion END ASC,
						CASE WHEN @SortExpression ='FAQQuestion DESC' THEN Gen_FAQ.FAQQuestion END DESC,
						CASE WHEN @SortExpression ='FAQAnswer ASC' THEN Gen_FAQ.FAQAnswer END ASC,
						CASE WHEN @SortExpression ='FAQAnswer DESC' THEN Gen_FAQ.FAQAnswer END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Gen_FAQ.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Gen_FAQ.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Gen_FAQ.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Gen_FAQ.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Gen_FAQ.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Gen_FAQ.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Gen_FAQ.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Gen_FAQ.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Gen_FAQ.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Gen_FAQ.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Gen_FAQ.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Gen_FAQ.IPAddress END DESC
				) as RowNumber
		FROM Gen_FAQ 
		where
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 			Gen_FAQ.FAQID  like @CommonSerachParam
			 OR Gen_FAQ.FAQCategoryID  like @CommonSerachParam
			 OR Gen_FAQ.FAQQuestion  like @CommonSerachParam
			 OR Gen_FAQ.FAQAnswer  like @CommonSerachParam
			
			
			
			
			
			
			
 THEN 1 ELSE 0 END = 1)			)
			SELECT * 
			FROM  tempPagedgen_faq
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END  
GO
            
            
            
            
            
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
Create PROCEDURE gen_faq_GS
		@FAQID bigint  = NULL,
		@FAQCategoryID bigint  = NULL,
		@FAQQuestion nvarchar (250) = NULL,
		@FAQAnswer nvarchar (550) = NULL,
		    
        @SortExpression VARCHAR(MAX)  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME = NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @UpdatedDate DATETIME = NULL,
        @IPAddress varchar(100) = NULL,
        @TransID nvarchar(250) = NULL,
        @Ts bigint = NULL
        
	AS
	BEGIN
		SELECT 
			Gen_FAQ.FAQID,
			Gen_FAQ.FAQCategoryID,
			Gen_FAQ.FAQQuestion,
			Gen_FAQ.FAQAnswer,
			Gen_FAQ.TransID,
			Gen_FAQ.CreatedByUserName,
			Gen_FAQ.CreatedDate,
			Gen_FAQ.UpdatedByUserName,
			Gen_FAQ.UpdatedDate,
			Gen_FAQ.IPAddress,
			CONVERT(bigint, TS) as TS
		FROM Gen_FAQ 
		where
			FAQID = @FAQID
	END  
GO	

            
            



            
            
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
Create PROCEDURE gen_faqcategory_GAPgListView 
		@FAQCategoryID bigint  = NULL,
		@FAQCategory nvarchar (150) = NULL,
				
        @CommonSerachParam nvarchar(256)= NULL,
        
        @TotalRecord bigint = null output,
        @SortExpression VARCHAR(MAX)  = NULL,
        @PageSize BIGINT = NULL,
        @CurrentPage BIGINT  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME= NULL,
        @UpdatedDate DATETIME= NULL,
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) = NULL,
        @TS varchar(100)= NULL
    
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					gen_faqcategory
				WHERE 
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 					Gen_FAQCategory.FAQCategoryID  like @CommonSerachParam
					 OR Gen_FAQCategory.FAQCategory  like @CommonSerachParam
					
					
					
					
					
					
					
 THEN 1 ELSE 0 END = 1)			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedgen_faqcategory AS
			(
				  SELECT 
			Gen_FAQCategory.FAQCategoryID,
			Gen_FAQCategory.FAQCategory,
			Gen_FAQCategory.TransID,
			Gen_FAQCategory.CreatedByUserName,
			Gen_FAQCategory.CreatedDate,
			Gen_FAQCategory.UpdatedByUserName,
			Gen_FAQCategory.UpdatedDate,
			Gen_FAQCategory.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='FAQCategoryID ASC' THEN Gen_FAQCategory.FAQCategoryID END ASC,
						CASE WHEN @SortExpression ='FAQCategoryID DESC' THEN Gen_FAQCategory.FAQCategoryID END DESC,
						CASE WHEN @SortExpression ='FAQCategory ASC' THEN Gen_FAQCategory.FAQCategory END ASC,
						CASE WHEN @SortExpression ='FAQCategory DESC' THEN Gen_FAQCategory.FAQCategory END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Gen_FAQCategory.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Gen_FAQCategory.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Gen_FAQCategory.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Gen_FAQCategory.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Gen_FAQCategory.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Gen_FAQCategory.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Gen_FAQCategory.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Gen_FAQCategory.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Gen_FAQCategory.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Gen_FAQCategory.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Gen_FAQCategory.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Gen_FAQCategory.IPAddress END DESC
				) as RowNumber
		FROM Gen_FAQCategory 
		where
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 			Gen_FAQCategory.FAQCategoryID  like @CommonSerachParam
			 OR Gen_FAQCategory.FAQCategory  like @CommonSerachParam
			
			
			
			
			
			
			
 THEN 1 ELSE 0 END = 1)			)
			SELECT * 
			FROM  tempPagedgen_faqcategory
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END  
GO
            
            
            
            
            
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
Create PROCEDURE gen_faqcategory_GS
		@FAQCategoryID bigint  = NULL,
		@FAQCategory nvarchar (150) = NULL,
		    
        @SortExpression VARCHAR(MAX)  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME = NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @UpdatedDate DATETIME = NULL,
        @IPAddress varchar(100) = NULL,
        @TransID nvarchar(250) = NULL,
        @Ts bigint = NULL
        
	AS
	BEGIN
		SELECT 
			Gen_FAQCategory.FAQCategoryID,
			Gen_FAQCategory.FAQCategory,
			Gen_FAQCategory.TransID,
			Gen_FAQCategory.CreatedByUserName,
			Gen_FAQCategory.CreatedDate,
			Gen_FAQCategory.UpdatedByUserName,
			Gen_FAQCategory.UpdatedDate,
			Gen_FAQCategory.IPAddress,
			CONVERT(bigint, TS) as TS
		FROM Gen_FAQCategory 
		where
			FAQCategoryID = @FAQCategoryID
	END  
GO	

            
            



            
            
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
Create PROCEDURE gen_imagegallary_GAPgListView 
		@ImageGallaryID bigint  = NULL,
		@ImageGallaryCategoryID bigint  = NULL,
		@ImagePath varchar (250) = NULL,
		@ImageType nvarchar (50) = NULL,
		@ImageExtension nvarchar (50) = NULL,
		@ImageName nvarchar (50) = NULL,
		@IsInSlider bit  = NULL,
				
        @CommonSerachParam nvarchar(256)= NULL,
        
        @TotalRecord bigint = null output,
        @SortExpression VARCHAR(MAX)  = NULL,
        @PageSize BIGINT = NULL,
        @CurrentPage BIGINT  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME= NULL,
        @UpdatedDate DATETIME= NULL,
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) = NULL,
        @TS varchar(100)= NULL
    
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					gen_imagegallary
				WHERE 
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 					Gen_ImageGallary.ImageGallaryID  like @CommonSerachParam
					 OR Gen_ImageGallary.ImageGallaryCategoryID  like @CommonSerachParam
					 OR Gen_ImageGallary.ImagePath  like @CommonSerachParam
					 OR Gen_ImageGallary.ImageType  like @CommonSerachParam
					 OR Gen_ImageGallary.ImageExtension  like @CommonSerachParam
					 OR Gen_ImageGallary.ImageName  like @CommonSerachParam
					 OR Gen_ImageGallary.IsInSlider  like @CommonSerachParam
					
					
					
					
					
					
					
 THEN 1 ELSE 0 END = 1)			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedgen_imagegallary AS
			(
				  SELECT 
			Gen_ImageGallary.ImageGallaryID,
			Gen_ImageGallary.ImageGallaryCategoryID,
			Gen_ImageGallary.ImagePath,
			Gen_ImageGallary.ImageType,
			Gen_ImageGallary.ImageExtension,
			Gen_ImageGallary.ImageName,
			Gen_ImageGallary.IsInSlider,
			Gen_ImageGallary.TransID,
			Gen_ImageGallary.CreatedByUserName,
			Gen_ImageGallary.CreatedDate,
			Gen_ImageGallary.UpdatedByUserName,
			Gen_ImageGallary.UpdatedDate,
			Gen_ImageGallary.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='ImageGallaryID ASC' THEN Gen_ImageGallary.ImageGallaryID END ASC,
						CASE WHEN @SortExpression ='ImageGallaryID DESC' THEN Gen_ImageGallary.ImageGallaryID END DESC,
						CASE WHEN @SortExpression ='ImageGallaryCategoryID ASC' THEN Gen_ImageGallary.ImageGallaryCategoryID END ASC,
						CASE WHEN @SortExpression ='ImageGallaryCategoryID DESC' THEN Gen_ImageGallary.ImageGallaryCategoryID END DESC,
						CASE WHEN @SortExpression ='ImagePath ASC' THEN Gen_ImageGallary.ImagePath END ASC,
						CASE WHEN @SortExpression ='ImagePath DESC' THEN Gen_ImageGallary.ImagePath END DESC,
						CASE WHEN @SortExpression ='ImageType ASC' THEN Gen_ImageGallary.ImageType END ASC,
						CASE WHEN @SortExpression ='ImageType DESC' THEN Gen_ImageGallary.ImageType END DESC,
						CASE WHEN @SortExpression ='ImageExtension ASC' THEN Gen_ImageGallary.ImageExtension END ASC,
						CASE WHEN @SortExpression ='ImageExtension DESC' THEN Gen_ImageGallary.ImageExtension END DESC,
						CASE WHEN @SortExpression ='ImageName ASC' THEN Gen_ImageGallary.ImageName END ASC,
						CASE WHEN @SortExpression ='ImageName DESC' THEN Gen_ImageGallary.ImageName END DESC,
						CASE WHEN @SortExpression ='IsInSlider ASC' THEN Gen_ImageGallary.IsInSlider END ASC,
						CASE WHEN @SortExpression ='IsInSlider DESC' THEN Gen_ImageGallary.IsInSlider END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Gen_ImageGallary.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Gen_ImageGallary.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Gen_ImageGallary.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Gen_ImageGallary.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Gen_ImageGallary.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Gen_ImageGallary.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Gen_ImageGallary.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Gen_ImageGallary.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Gen_ImageGallary.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Gen_ImageGallary.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Gen_ImageGallary.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Gen_ImageGallary.IPAddress END DESC
				) as RowNumber
		FROM Gen_ImageGallary 
		where
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 			Gen_ImageGallary.ImageGallaryID  like @CommonSerachParam
			 OR Gen_ImageGallary.ImageGallaryCategoryID  like @CommonSerachParam
			 OR Gen_ImageGallary.ImagePath  like @CommonSerachParam
			 OR Gen_ImageGallary.ImageType  like @CommonSerachParam
			 OR Gen_ImageGallary.ImageExtension  like @CommonSerachParam
			 OR Gen_ImageGallary.ImageName  like @CommonSerachParam
			 OR Gen_ImageGallary.IsInSlider  like @CommonSerachParam
			
			
			
			
			
			
			
 THEN 1 ELSE 0 END = 1)			)
			SELECT * 
			FROM  tempPagedgen_imagegallary
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END  
GO
            
            
            
            
            
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
Create PROCEDURE gen_imagegallary_GS
		@ImageGallaryID bigint  = NULL,
		@ImageGallaryCategoryID bigint  = NULL,
		@ImagePath varchar (250) = NULL,
		@ImageType nvarchar (50) = NULL,
		@ImageExtension nvarchar (50) = NULL,
		@ImageName nvarchar (50) = NULL,
		@IsInSlider bit  = NULL,
		    
        @SortExpression VARCHAR(MAX)  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME = NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @UpdatedDate DATETIME = NULL,
        @IPAddress varchar(100) = NULL,
        @TransID nvarchar(250) = NULL,
        @Ts bigint = NULL
        
	AS
	BEGIN
		SELECT 
			Gen_ImageGallary.ImageGallaryID,
			Gen_ImageGallary.ImageGallaryCategoryID,
			Gen_ImageGallary.ImagePath,
			Gen_ImageGallary.ImageType,
			Gen_ImageGallary.ImageExtension,
			Gen_ImageGallary.ImageName,
			Gen_ImageGallary.IsInSlider,
			Gen_ImageGallary.TransID,
			Gen_ImageGallary.CreatedByUserName,
			Gen_ImageGallary.CreatedDate,
			Gen_ImageGallary.UpdatedByUserName,
			Gen_ImageGallary.UpdatedDate,
			Gen_ImageGallary.IPAddress,
			CONVERT(bigint, TS) as TS
		FROM Gen_ImageGallary 
		where
			ImageGallaryID = @ImageGallaryID
	END  
GO	

            
            



            
            
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
Create PROCEDURE gen_imagegallarycategory_GAPgListView 
		@ImageGallaryCategoryID bigint  = NULL,
		@CategoryName nvarchar (150) = NULL,
		@CategoryDescription nvarchar (250) = NULL,
				
        @CommonSerachParam nvarchar(256)= NULL,
        
        @TotalRecord bigint = null output,
        @SortExpression VARCHAR(MAX)  = NULL,
        @PageSize BIGINT = NULL,
        @CurrentPage BIGINT  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME= NULL,
        @UpdatedDate DATETIME= NULL,
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) = NULL,
        @TS varchar(100)= NULL
    
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					gen_imagegallarycategory
				WHERE 
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 					Gen_ImageGallaryCategory.ImageGallaryCategoryID  like @CommonSerachParam
					 OR Gen_ImageGallaryCategory.CategoryName  like @CommonSerachParam
					 OR Gen_ImageGallaryCategory.CategoryDescription  like @CommonSerachParam
					
					
					
					
					
					
					
 THEN 1 ELSE 0 END = 1)			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedgen_imagegallarycategory AS
			(
				  SELECT 
			Gen_ImageGallaryCategory.ImageGallaryCategoryID,
			Gen_ImageGallaryCategory.CategoryName,
			Gen_ImageGallaryCategory.CategoryDescription,
			Gen_ImageGallaryCategory.TransID,
			Gen_ImageGallaryCategory.CreatedByUserName,
			Gen_ImageGallaryCategory.CreatedDate,
			Gen_ImageGallaryCategory.UpdatedByUserName,
			Gen_ImageGallaryCategory.UpdatedDate,
			Gen_ImageGallaryCategory.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='ImageGallaryCategoryID ASC' THEN Gen_ImageGallaryCategory.ImageGallaryCategoryID END ASC,
						CASE WHEN @SortExpression ='ImageGallaryCategoryID DESC' THEN Gen_ImageGallaryCategory.ImageGallaryCategoryID END DESC,
						CASE WHEN @SortExpression ='CategoryName ASC' THEN Gen_ImageGallaryCategory.CategoryName END ASC,
						CASE WHEN @SortExpression ='CategoryName DESC' THEN Gen_ImageGallaryCategory.CategoryName END DESC,
						CASE WHEN @SortExpression ='CategoryDescription ASC' THEN Gen_ImageGallaryCategory.CategoryDescription END ASC,
						CASE WHEN @SortExpression ='CategoryDescription DESC' THEN Gen_ImageGallaryCategory.CategoryDescription END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Gen_ImageGallaryCategory.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Gen_ImageGallaryCategory.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Gen_ImageGallaryCategory.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Gen_ImageGallaryCategory.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Gen_ImageGallaryCategory.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Gen_ImageGallaryCategory.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Gen_ImageGallaryCategory.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Gen_ImageGallaryCategory.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Gen_ImageGallaryCategory.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Gen_ImageGallaryCategory.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Gen_ImageGallaryCategory.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Gen_ImageGallaryCategory.IPAddress END DESC
				) as RowNumber
		FROM Gen_ImageGallaryCategory 
		where
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 			Gen_ImageGallaryCategory.ImageGallaryCategoryID  like @CommonSerachParam
			 OR Gen_ImageGallaryCategory.CategoryName  like @CommonSerachParam
			 OR Gen_ImageGallaryCategory.CategoryDescription  like @CommonSerachParam
			
			
			
			
			
			
			
 THEN 1 ELSE 0 END = 1)			)
			SELECT * 
			FROM  tempPagedgen_imagegallarycategory
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END  
GO
            
            
            
            
            
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
Create PROCEDURE gen_imagegallarycategory_GS
		@ImageGallaryCategoryID bigint  = NULL,
		@CategoryName nvarchar (150) = NULL,
		@CategoryDescription nvarchar (250) = NULL,
		    
        @SortExpression VARCHAR(MAX)  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME = NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @UpdatedDate DATETIME = NULL,
        @IPAddress varchar(100) = NULL,
        @TransID nvarchar(250) = NULL,
        @Ts bigint = NULL
        
	AS
	BEGIN
		SELECT 
			Gen_ImageGallaryCategory.ImageGallaryCategoryID,
			Gen_ImageGallaryCategory.CategoryName,
			Gen_ImageGallaryCategory.CategoryDescription,
			Gen_ImageGallaryCategory.TransID,
			Gen_ImageGallaryCategory.CreatedByUserName,
			Gen_ImageGallaryCategory.CreatedDate,
			Gen_ImageGallaryCategory.UpdatedByUserName,
			Gen_ImageGallaryCategory.UpdatedDate,
			Gen_ImageGallaryCategory.IPAddress,
			CONVERT(bigint, TS) as TS
		FROM Gen_ImageGallaryCategory 
		where
			ImageGallaryCategoryID = @ImageGallaryCategoryID
	END  
GO	

            
            



            
            
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
Create PROCEDURE gen_linkedservice_GAPgListView 
		@LinkedServiceID bigint  = NULL,
		@LinkedServiceNameEN nvarchar (250) = NULL,
		@LinkedServiceNameAR nvarchar (250) = NULL,
		@LinkServiceLOGOPath nvarchar (350) = NULL,
		@LinkedServiceHyperLink nvarchar (350) = NULL,
		@URLOpenTarget nvarchar (50) = NULL,
				
        @CommonSerachParam nvarchar(256)= NULL,
        
        @TotalRecord bigint = null output,
        @SortExpression VARCHAR(MAX)  = NULL,
        @PageSize BIGINT = NULL,
        @CurrentPage BIGINT  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME= NULL,
        @UpdatedDate DATETIME= NULL,
        @IPAddress varchar(100)= NULL,
        @TransID nvarchar(250) = NULL,
        @TS varchar(100)= NULL
    
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					gen_linkedservice
				WHERE 
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 					Gen_LinkedService.LinkedServiceID  like @CommonSerachParam
					 OR Gen_LinkedService.LinkedServiceNameEN  like @CommonSerachParam
					 OR Gen_LinkedService.LinkedServiceNameAR  like @CommonSerachParam
					 OR Gen_LinkedService.LinkServiceLOGOPath  like @CommonSerachParam
					 OR Gen_LinkedService.LinkedServiceHyperLink  like @CommonSerachParam
					 OR Gen_LinkedService.URLOpenTarget  like @CommonSerachParam
					
					
					
					
					
					
					
 THEN 1 ELSE 0 END = 1)			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedgen_linkedservice AS
			(
				  SELECT 
			Gen_LinkedService.LinkedServiceID,
			Gen_LinkedService.LinkedServiceNameEN,
			Gen_LinkedService.LinkedServiceNameAR,
			Gen_LinkedService.LinkServiceLOGOPath,
			Gen_LinkedService.LinkedServiceHyperLink,
			Gen_LinkedService.URLOpenTarget,
			Gen_LinkedService.TransID,
			Gen_LinkedService.CreatedByUserName,
			Gen_LinkedService.CreatedDate,
			Gen_LinkedService.UpdatedByUserName,
			Gen_LinkedService.UpdatedDate,
			Gen_LinkedService.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='LinkedServiceID ASC' THEN Gen_LinkedService.LinkedServiceID END ASC,
						CASE WHEN @SortExpression ='LinkedServiceID DESC' THEN Gen_LinkedService.LinkedServiceID END DESC,
						CASE WHEN @SortExpression ='LinkedServiceNameEN ASC' THEN Gen_LinkedService.LinkedServiceNameEN END ASC,
						CASE WHEN @SortExpression ='LinkedServiceNameEN DESC' THEN Gen_LinkedService.LinkedServiceNameEN END DESC,
						CASE WHEN @SortExpression ='LinkedServiceNameAR ASC' THEN Gen_LinkedService.LinkedServiceNameAR END ASC,
						CASE WHEN @SortExpression ='LinkedServiceNameAR DESC' THEN Gen_LinkedService.LinkedServiceNameAR END DESC,
						CASE WHEN @SortExpression ='LinkServiceLOGOPath ASC' THEN Gen_LinkedService.LinkServiceLOGOPath END ASC,
						CASE WHEN @SortExpression ='LinkServiceLOGOPath DESC' THEN Gen_LinkedService.LinkServiceLOGOPath END DESC,
						CASE WHEN @SortExpression ='LinkedServiceHyperLink ASC' THEN Gen_LinkedService.LinkedServiceHyperLink END ASC,
						CASE WHEN @SortExpression ='LinkedServiceHyperLink DESC' THEN Gen_LinkedService.LinkedServiceHyperLink END DESC,
						CASE WHEN @SortExpression ='URLOpenTarget ASC' THEN Gen_LinkedService.URLOpenTarget END ASC,
						CASE WHEN @SortExpression ='URLOpenTarget DESC' THEN Gen_LinkedService.URLOpenTarget END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Gen_LinkedService.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Gen_LinkedService.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Gen_LinkedService.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Gen_LinkedService.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Gen_LinkedService.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Gen_LinkedService.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Gen_LinkedService.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Gen_LinkedService.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Gen_LinkedService.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Gen_LinkedService.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Gen_LinkedService.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Gen_LinkedService.IPAddress END DESC
				) as RowNumber
		FROM Gen_LinkedService 
		where
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 			Gen_LinkedService.LinkedServiceID  like @CommonSerachParam
			 OR Gen_LinkedService.LinkedServiceNameEN  like @CommonSerachParam
			 OR Gen_LinkedService.LinkedServiceNameAR  like @CommonSerachParam
			 OR Gen_LinkedService.LinkServiceLOGOPath  like @CommonSerachParam
			 OR Gen_LinkedService.LinkedServiceHyperLink  like @CommonSerachParam
			 OR Gen_LinkedService.URLOpenTarget  like @CommonSerachParam
			
			
			
			
			
			
			
 THEN 1 ELSE 0 END = 1)			)
			SELECT * 
			FROM  tempPagedgen_linkedservice
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END  
GO
            
            
            
            
            
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
Create PROCEDURE gen_linkedservice_GS
		@LinkedServiceID bigint  = NULL,
		@LinkedServiceNameEN nvarchar (250) = NULL,
		@LinkedServiceNameAR nvarchar (250) = NULL,
		@LinkServiceLOGOPath nvarchar (350) = NULL,
		@LinkedServiceHyperLink nvarchar (350) = NULL,
		@URLOpenTarget nvarchar (50) = NULL,
		    
        @SortExpression VARCHAR(MAX)  = NULL,
        @CreatedByUserName nvarchar(256)= NULL,
        @CreatedDate DATETIME = NULL,
        @UpdatedByUserName nvarchar(256)= NULL,
        @UpdatedDate DATETIME = NULL,
        @IPAddress varchar(100) = NULL,
        @TransID nvarchar(250) = NULL,
        @Ts bigint = NULL
        
	AS
	BEGIN
		SELECT 
			Gen_LinkedService.LinkedServiceID,
			Gen_LinkedService.LinkedServiceNameEN,
			Gen_LinkedService.LinkedServiceNameAR,
			Gen_LinkedService.LinkServiceLOGOPath,
			Gen_LinkedService.LinkedServiceHyperLink,
			Gen_LinkedService.URLOpenTarget,
			Gen_LinkedService.TransID,
			Gen_LinkedService.CreatedByUserName,
			Gen_LinkedService.CreatedDate,
			Gen_LinkedService.UpdatedByUserName,
			Gen_LinkedService.UpdatedDate,
			Gen_LinkedService.IPAddress,
			CONVERT(bigint, TS) as TS
		FROM Gen_LinkedService 
		where
			LinkedServiceID = @LinkedServiceID
	END  
GO	

            
            




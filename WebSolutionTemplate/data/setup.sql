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


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	

/*
Creator : KAF
*/
CREATE PROCEDURE owin_formaction_Ins 
		@FormActionID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@ActionName nvarchar (150) = NULL,
		@ActionType nvarchar (250) = NULL,
		@IsView bit  = NULL,
		@EventName nvarchar (50) = NULL,
		@Sequence int  = NULL,
		        
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
		
        
		INSERT INTO Owin_FormAction (
			AppFormID,
			ActionName,
			ActionType,
			IsView,
			EventName,
			Sequence,
			TransID,
			CreatedByUserName,
			CreatedDate,
  			IPAddress
		)
		VALUES (
			@AppFormID,
			@ActionName,
			@ActionType,
			@IsView,
			@EventName,
			@Sequence,
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
CREATE PROCEDURE owin_formaction_Upd
		@FormActionID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@ActionName nvarchar (150) = NULL,
		@ActionType nvarchar (250) = NULL,
		@IsView bit  = NULL,
		@EventName nvarchar (50) = NULL,
		@Sequence int  = NULL,
		        
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
		UPDATE Owin_FormAction
		SET
			AppFormID = @AppFormID,
			ActionName = @ActionName,
			ActionType = @ActionType,
			IsView = @IsView,
			EventName = @EventName,
			Sequence = @Sequence,
			TransID = @TransID,
			UpdatedByUserName = @UpdatedByUserName,
			UpdatedDate = @UpdatedDate,
			IPAddress = @IPAddress
		WHERE
			FormActionID = @FormActionID
    SET @RETURN_KEY =@FormActionID
		    
	END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/	
CREATE PROCEDURE owin_formaction_Del		        
		@FormActionID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@ActionName nvarchar (150) = NULL,
		@ActionType nvarchar (250) = NULL,
		@IsView bit  = NULL,
		@EventName nvarchar (50) = NULL,
		@Sequence int  = NULL,
		        
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
		DELETE FROM Owin_FormAction
		WHERE 
			FormActionID = @FormActionID
		
    SET @RETURN_KEY =@FormActionID
		
		
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
CREATE PROCEDURE owin_formaction_GA 
		@FormActionID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@ActionName nvarchar (150) = NULL,
		@ActionType nvarchar (250) = NULL,
		@IsView bit  = NULL,
		@EventName nvarchar (50) = NULL,
		@Sequence int  = NULL,
		    
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
			Owin_FormAction.FormActionID,
			Owin_FormAction.AppFormID,
			Owin_FormAction.ActionName,
			Owin_FormAction.ActionType,
			Owin_FormAction.IsView,
			Owin_FormAction.EventName,
			Owin_FormAction.Sequence,
			Owin_FormAction.TransID,
			Owin_FormAction.CreatedByUserName,
			Owin_FormAction.CreatedDate,
			Owin_FormAction.UpdatedByUserName,
			Owin_FormAction.UpdatedDate,
			Owin_FormAction.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='FormActionID ASC' THEN Owin_FormAction.FormActionID END ASC,
						CASE WHEN @SortExpression ='FormActionID DESC' THEN Owin_FormAction.FormActionID END DESC,
						CASE WHEN @SortExpression ='AppFormID ASC' THEN Owin_FormAction.AppFormID END ASC,
						CASE WHEN @SortExpression ='AppFormID DESC' THEN Owin_FormAction.AppFormID END DESC,
						CASE WHEN @SortExpression ='ActionName ASC' THEN Owin_FormAction.ActionName END ASC,
						CASE WHEN @SortExpression ='ActionName DESC' THEN Owin_FormAction.ActionName END DESC,
						CASE WHEN @SortExpression ='ActionType ASC' THEN Owin_FormAction.ActionType END ASC,
						CASE WHEN @SortExpression ='ActionType DESC' THEN Owin_FormAction.ActionType END DESC,
						CASE WHEN @SortExpression ='IsView ASC' THEN Owin_FormAction.IsView END ASC,
						CASE WHEN @SortExpression ='IsView DESC' THEN Owin_FormAction.IsView END DESC,
						CASE WHEN @SortExpression ='EventName ASC' THEN Owin_FormAction.EventName END ASC,
						CASE WHEN @SortExpression ='EventName DESC' THEN Owin_FormAction.EventName END DESC,
						CASE WHEN @SortExpression ='Sequence ASC' THEN Owin_FormAction.Sequence END ASC,
						CASE WHEN @SortExpression ='Sequence DESC' THEN Owin_FormAction.Sequence END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_FormAction.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_FormAction.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_FormAction.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_FormAction.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_FormAction.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_FormAction.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_FormAction.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_FormAction.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_FormAction.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_FormAction.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_FormAction.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_FormAction.IPAddress END DESC
				) as RowNumber
		FROM Owin_FormAction 
		where
			(CASE WHEN @FormActionID is NULL THEN 1 WHEN Owin_FormAction.FormActionID  = @FormActionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @AppFormID is NULL THEN 1 WHEN Owin_FormAction.AppFormID  = @AppFormID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ActionName is NULL THEN 1 WHEN Owin_FormAction.ActionName  = @ActionName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ActionType is NULL THEN 1 WHEN Owin_FormAction.ActionType  = @ActionType THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsView is NULL THEN 1 WHEN Owin_FormAction.IsView  = @IsView THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @EventName is NULL THEN 1 WHEN Owin_FormAction.EventName  = @EventName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Sequence is NULL THEN 1 WHEN Owin_FormAction.Sequence  = @Sequence THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_FormAction.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_FormAction.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
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
CREATE PROCEDURE owin_formaction_GAPg 
		@FormActionID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@ActionName nvarchar (150) = NULL,
		@ActionType nvarchar (250) = NULL,
		@IsView bit  = NULL,
		@EventName nvarchar (50) = NULL,
		@Sequence int  = NULL,
		    
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
					owin_formaction
				WHERE 
					(CASE WHEN @FormActionID is NULL THEN 1 WHEN Owin_FormAction.FormActionID  = @FormActionID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @AppFormID is NULL THEN 1 WHEN Owin_FormAction.AppFormID  = @AppFormID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ActionName is NULL THEN 1 WHEN Owin_FormAction.ActionName  = @ActionName THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ActionType is NULL THEN 1 WHEN Owin_FormAction.ActionType  = @ActionType THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @IsView is NULL THEN 1 WHEN Owin_FormAction.IsView  = @IsView THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @EventName is NULL THEN 1 WHEN Owin_FormAction.EventName  = @EventName THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @Sequence is NULL THEN 1 WHEN Owin_FormAction.Sequence  = @Sequence THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_FormAction.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_FormAction.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
					
					
					
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_formaction AS
			(
				  SELECT 
			Owin_FormAction.FormActionID,
			Owin_FormAction.AppFormID,
			Owin_FormAction.ActionName,
			Owin_FormAction.ActionType,
			Owin_FormAction.IsView,
			Owin_FormAction.EventName,
			Owin_FormAction.Sequence,
			Owin_FormAction.TransID,
			Owin_FormAction.CreatedByUserName,
			Owin_FormAction.CreatedDate,
			Owin_FormAction.UpdatedByUserName,
			Owin_FormAction.UpdatedDate,
			Owin_FormAction.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='FormActionID ASC' THEN Owin_FormAction.FormActionID END ASC,
						CASE WHEN @SortExpression ='FormActionID DESC' THEN Owin_FormAction.FormActionID END DESC,
						CASE WHEN @SortExpression ='AppFormID ASC' THEN Owin_FormAction.AppFormID END ASC,
						CASE WHEN @SortExpression ='AppFormID DESC' THEN Owin_FormAction.AppFormID END DESC,
						CASE WHEN @SortExpression ='ActionName ASC' THEN Owin_FormAction.ActionName END ASC,
						CASE WHEN @SortExpression ='ActionName DESC' THEN Owin_FormAction.ActionName END DESC,
						CASE WHEN @SortExpression ='ActionType ASC' THEN Owin_FormAction.ActionType END ASC,
						CASE WHEN @SortExpression ='ActionType DESC' THEN Owin_FormAction.ActionType END DESC,
						CASE WHEN @SortExpression ='IsView ASC' THEN Owin_FormAction.IsView END ASC,
						CASE WHEN @SortExpression ='IsView DESC' THEN Owin_FormAction.IsView END DESC,
						CASE WHEN @SortExpression ='EventName ASC' THEN Owin_FormAction.EventName END ASC,
						CASE WHEN @SortExpression ='EventName DESC' THEN Owin_FormAction.EventName END DESC,
						CASE WHEN @SortExpression ='Sequence ASC' THEN Owin_FormAction.Sequence END ASC,
						CASE WHEN @SortExpression ='Sequence DESC' THEN Owin_FormAction.Sequence END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_FormAction.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_FormAction.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_FormAction.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_FormAction.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_FormAction.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_FormAction.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_FormAction.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_FormAction.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_FormAction.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_FormAction.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_FormAction.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_FormAction.IPAddress END DESC
				) as RowNumber
		FROM Owin_FormAction 
		where
			(CASE WHEN @FormActionID is NULL THEN 1 WHEN Owin_FormAction.FormActionID  = @FormActionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @AppFormID is NULL THEN 1 WHEN Owin_FormAction.AppFormID  = @AppFormID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ActionName is NULL THEN 1 WHEN Owin_FormAction.ActionName  = @ActionName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ActionType is NULL THEN 1 WHEN Owin_FormAction.ActionType  = @ActionType THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsView is NULL THEN 1 WHEN Owin_FormAction.IsView  = @IsView THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @EventName is NULL THEN 1 WHEN Owin_FormAction.EventName  = @EventName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Sequence is NULL THEN 1 WHEN Owin_FormAction.Sequence  = @Sequence THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_FormAction.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_FormAction.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
			)
			SELECT * 
			FROM  tempPagedowin_formaction
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
CREATE PROCEDURE owin_forminfo_Ins 
		@AppFormID bigint  = NULL,
		@FormName nvarchar (150) = NULL,
		@FormNameAr nvarchar (150) = NULL,
		@ParentID bigint  = NULL,
		@LevelID int  = NULL,
		@MenuLevel nvarchar (50) = NULL,
		@HasDirectChild bit  = NULL,
		@Icon image  = NULL,
		@ClassIcon nvarchar (50) = NULL,
		@Sequence int  = NULL,
		@URL nvarchar (200) = NULL,
		@IsView bit  = NULL,
		@IsDynamic bit  = NULL,
		@IsSuperAdmin bit  = NULL,
		@IsVisibleInMenu bit  = NULL,
		        
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
		
        
		INSERT INTO Owin_FormInfo (
			FormName,
			FormNameAr,
			ParentID,
			LevelID,
			MenuLevel,
			HasDirectChild,
			Icon,
			ClassIcon,
			Sequence,
			URL,
			IsView,
			IsDynamic,
			IsSuperAdmin,
			IsVisibleInMenu,
			TransID,
			CreatedByUserName,
			CreatedDate,
  			IPAddress
		)
		VALUES (
			@FormName,
			@FormNameAr,
			@ParentID,
			@LevelID,
			@MenuLevel,
			@HasDirectChild,
			@Icon,
			@ClassIcon,
			@Sequence,
			@URL,
			@IsView,
			@IsDynamic,
			@IsSuperAdmin,
			@IsVisibleInMenu,
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
CREATE PROCEDURE owin_forminfo_Upd
		@AppFormID bigint  = NULL,
		@FormName nvarchar (150) = NULL,
		@FormNameAr nvarchar (150) = NULL,
		@ParentID bigint  = NULL,
		@LevelID int  = NULL,
		@MenuLevel nvarchar (50) = NULL,
		@HasDirectChild bit  = NULL,
		@Icon image  = NULL,
		@ClassIcon nvarchar (50) = NULL,
		@Sequence int  = NULL,
		@URL nvarchar (200) = NULL,
		@IsView bit  = NULL,
		@IsDynamic bit  = NULL,
		@IsSuperAdmin bit  = NULL,
		@IsVisibleInMenu bit  = NULL,
		        
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
		UPDATE Owin_FormInfo
		SET
			FormName = @FormName,
			FormNameAr = @FormNameAr,
			ParentID = @ParentID,
			LevelID = @LevelID,
			MenuLevel = @MenuLevel,
			HasDirectChild = @HasDirectChild,
			Icon = @Icon,
			ClassIcon = @ClassIcon,
			Sequence = @Sequence,
			URL = @URL,
			IsView = @IsView,
			IsDynamic = @IsDynamic,
			IsSuperAdmin = @IsSuperAdmin,
			IsVisibleInMenu = @IsVisibleInMenu,
			TransID = @TransID,
			UpdatedByUserName = @UpdatedByUserName,
			UpdatedDate = @UpdatedDate,
			IPAddress = @IPAddress
		WHERE
			AppFormID = @AppFormID
    SET @RETURN_KEY =@AppFormID
		    
	END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/	
CREATE PROCEDURE owin_forminfo_Del		        
		@AppFormID bigint  = NULL,
		@FormName nvarchar (150) = NULL,
		@FormNameAr nvarchar (150) = NULL,
		@ParentID bigint  = NULL,
		@LevelID int  = NULL,
		@MenuLevel nvarchar (50) = NULL,
		@HasDirectChild bit  = NULL,
		@Icon image  = NULL,
		@ClassIcon nvarchar (50) = NULL,
		@Sequence int  = NULL,
		@URL nvarchar (200) = NULL,
		@IsView bit  = NULL,
		@IsDynamic bit  = NULL,
		@IsSuperAdmin bit  = NULL,
		@IsVisibleInMenu bit  = NULL,
		        
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
		DELETE FROM Owin_FormInfo
		WHERE 
			AppFormID = @AppFormID
		
    SET @RETURN_KEY =@AppFormID
		
		
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
CREATE PROCEDURE owin_forminfo_GA 
		@AppFormID bigint  = NULL,
		@FormName nvarchar (150) = NULL,
		@FormNameAr nvarchar (150) = NULL,
		@ParentID bigint  = NULL,
		@LevelID int  = NULL,
		@MenuLevel nvarchar (50) = NULL,
		@HasDirectChild bit  = NULL,
		@Icon image  = NULL,
		@ClassIcon nvarchar (50) = NULL,
		@Sequence int  = NULL,
		@URL nvarchar (200) = NULL,
		@IsView bit  = NULL,
		@IsDynamic bit  = NULL,
		@IsSuperAdmin bit  = NULL,
		@IsVisibleInMenu bit  = NULL,
		    
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
			Owin_FormInfo.AppFormID,
			Owin_FormInfo.FormName,
			Owin_FormInfo.FormNameAr,
			Owin_FormInfo.ParentID,
			Owin_FormInfo.LevelID,
			Owin_FormInfo.MenuLevel,
			Owin_FormInfo.HasDirectChild,
			Owin_FormInfo.Icon,
			Owin_FormInfo.ClassIcon,
			Owin_FormInfo.Sequence,
			Owin_FormInfo.URL,
			Owin_FormInfo.IsView,
			Owin_FormInfo.IsDynamic,
			Owin_FormInfo.IsSuperAdmin,
			Owin_FormInfo.IsVisibleInMenu,
			Owin_FormInfo.TransID,
			Owin_FormInfo.CreatedByUserName,
			Owin_FormInfo.CreatedDate,
			Owin_FormInfo.UpdatedByUserName,
			Owin_FormInfo.UpdatedDate,
			Owin_FormInfo.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='AppFormID ASC' THEN Owin_FormInfo.AppFormID END ASC,
						CASE WHEN @SortExpression ='AppFormID DESC' THEN Owin_FormInfo.AppFormID END DESC,
						CASE WHEN @SortExpression ='FormName ASC' THEN Owin_FormInfo.FormName END ASC,
						CASE WHEN @SortExpression ='FormName DESC' THEN Owin_FormInfo.FormName END DESC,
						CASE WHEN @SortExpression ='FormNameAr ASC' THEN Owin_FormInfo.FormNameAr END ASC,
						CASE WHEN @SortExpression ='FormNameAr DESC' THEN Owin_FormInfo.FormNameAr END DESC,
						CASE WHEN @SortExpression ='ParentID ASC' THEN Owin_FormInfo.ParentID END ASC,
						CASE WHEN @SortExpression ='ParentID DESC' THEN Owin_FormInfo.ParentID END DESC,
						CASE WHEN @SortExpression ='LevelID ASC' THEN Owin_FormInfo.LevelID END ASC,
						CASE WHEN @SortExpression ='LevelID DESC' THEN Owin_FormInfo.LevelID END DESC,
						CASE WHEN @SortExpression ='MenuLevel ASC' THEN Owin_FormInfo.MenuLevel END ASC,
						CASE WHEN @SortExpression ='MenuLevel DESC' THEN Owin_FormInfo.MenuLevel END DESC,
						CASE WHEN @SortExpression ='HasDirectChild ASC' THEN Owin_FormInfo.HasDirectChild END ASC,
						CASE WHEN @SortExpression ='HasDirectChild DESC' THEN Owin_FormInfo.HasDirectChild END DESC,
						CASE WHEN @SortExpression ='ClassIcon ASC' THEN Owin_FormInfo.ClassIcon END ASC,
						CASE WHEN @SortExpression ='ClassIcon DESC' THEN Owin_FormInfo.ClassIcon END DESC,
						CASE WHEN @SortExpression ='Sequence ASC' THEN Owin_FormInfo.Sequence END ASC,
						CASE WHEN @SortExpression ='Sequence DESC' THEN Owin_FormInfo.Sequence END DESC,
						CASE WHEN @SortExpression ='URL ASC' THEN Owin_FormInfo.URL END ASC,
						CASE WHEN @SortExpression ='URL DESC' THEN Owin_FormInfo.URL END DESC,
						CASE WHEN @SortExpression ='IsView ASC' THEN Owin_FormInfo.IsView END ASC,
						CASE WHEN @SortExpression ='IsView DESC' THEN Owin_FormInfo.IsView END DESC,
						CASE WHEN @SortExpression ='IsDynamic ASC' THEN Owin_FormInfo.IsDynamic END ASC,
						CASE WHEN @SortExpression ='IsDynamic DESC' THEN Owin_FormInfo.IsDynamic END DESC,
						CASE WHEN @SortExpression ='IsSuperAdmin ASC' THEN Owin_FormInfo.IsSuperAdmin END ASC,
						CASE WHEN @SortExpression ='IsSuperAdmin DESC' THEN Owin_FormInfo.IsSuperAdmin END DESC,
						CASE WHEN @SortExpression ='IsVisibleInMenu ASC' THEN Owin_FormInfo.IsVisibleInMenu END ASC,
						CASE WHEN @SortExpression ='IsVisibleInMenu DESC' THEN Owin_FormInfo.IsVisibleInMenu END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_FormInfo.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_FormInfo.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_FormInfo.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_FormInfo.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_FormInfo.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_FormInfo.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_FormInfo.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_FormInfo.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_FormInfo.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_FormInfo.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_FormInfo.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_FormInfo.IPAddress END DESC
				) as RowNumber
		FROM Owin_FormInfo 
		where
			(CASE WHEN @AppFormID is NULL THEN 1 WHEN Owin_FormInfo.AppFormID  = @AppFormID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FormName is NULL THEN 1 WHEN Owin_FormInfo.FormName  = @FormName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FormNameAr is NULL THEN 1 WHEN Owin_FormInfo.FormNameAr  = @FormNameAr THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ParentID is NULL THEN 1 WHEN Owin_FormInfo.ParentID  = @ParentID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LevelID is NULL THEN 1 WHEN Owin_FormInfo.LevelID  = @LevelID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MenuLevel is NULL THEN 1 WHEN Owin_FormInfo.MenuLevel  = @MenuLevel THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @HasDirectChild is NULL THEN 1 WHEN Owin_FormInfo.HasDirectChild  = @HasDirectChild THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @ClassIcon is NULL THEN 1 WHEN Owin_FormInfo.ClassIcon  = @ClassIcon THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Sequence is NULL THEN 1 WHEN Owin_FormInfo.Sequence  = @Sequence THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @URL is NULL THEN 1 WHEN Owin_FormInfo.URL  = @URL THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsView is NULL THEN 1 WHEN Owin_FormInfo.IsView  = @IsView THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsDynamic is NULL THEN 1 WHEN Owin_FormInfo.IsDynamic  = @IsDynamic THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsSuperAdmin is NULL THEN 1 WHEN Owin_FormInfo.IsSuperAdmin  = @IsSuperAdmin THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsVisibleInMenu is NULL THEN 1 WHEN Owin_FormInfo.IsVisibleInMenu  = @IsVisibleInMenu THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_FormInfo.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_FormInfo.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
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
CREATE PROCEDURE owin_forminfo_GAPg 
		@AppFormID bigint  = NULL,
		@FormName nvarchar (150) = NULL,
		@FormNameAr nvarchar (150) = NULL,
		@ParentID bigint  = NULL,
		@LevelID int  = NULL,
		@MenuLevel nvarchar (50) = NULL,
		@HasDirectChild bit  = NULL,
		@Icon image  = NULL,
		@ClassIcon nvarchar (50) = NULL,
		@Sequence int  = NULL,
		@URL nvarchar (200) = NULL,
		@IsView bit  = NULL,
		@IsDynamic bit  = NULL,
		@IsSuperAdmin bit  = NULL,
		@IsVisibleInMenu bit  = NULL,
		    
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
					owin_forminfo
				WHERE 
					(CASE WHEN @AppFormID is NULL THEN 1 WHEN Owin_FormInfo.AppFormID  = @AppFormID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @FormName is NULL THEN 1 WHEN Owin_FormInfo.FormName  = @FormName THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @FormNameAr is NULL THEN 1 WHEN Owin_FormInfo.FormNameAr  = @FormNameAr THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ParentID is NULL THEN 1 WHEN Owin_FormInfo.ParentID  = @ParentID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @LevelID is NULL THEN 1 WHEN Owin_FormInfo.LevelID  = @LevelID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @MenuLevel is NULL THEN 1 WHEN Owin_FormInfo.MenuLevel  = @MenuLevel THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @HasDirectChild is NULL THEN 1 WHEN Owin_FormInfo.HasDirectChild  = @HasDirectChild THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @ClassIcon is NULL THEN 1 WHEN Owin_FormInfo.ClassIcon  = @ClassIcon THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @Sequence is NULL THEN 1 WHEN Owin_FormInfo.Sequence  = @Sequence THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @URL is NULL THEN 1 WHEN Owin_FormInfo.URL  = @URL THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @IsView is NULL THEN 1 WHEN Owin_FormInfo.IsView  = @IsView THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @IsDynamic is NULL THEN 1 WHEN Owin_FormInfo.IsDynamic  = @IsDynamic THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @IsSuperAdmin is NULL THEN 1 WHEN Owin_FormInfo.IsSuperAdmin  = @IsSuperAdmin THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @IsVisibleInMenu is NULL THEN 1 WHEN Owin_FormInfo.IsVisibleInMenu  = @IsVisibleInMenu THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_FormInfo.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_FormInfo.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
					
					
					
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_forminfo AS
			(
				  SELECT 
			Owin_FormInfo.AppFormID,
			Owin_FormInfo.FormName,
			Owin_FormInfo.FormNameAr,
			Owin_FormInfo.ParentID,
			Owin_FormInfo.LevelID,
			Owin_FormInfo.MenuLevel,
			Owin_FormInfo.HasDirectChild,
			Owin_FormInfo.Icon,
			Owin_FormInfo.ClassIcon,
			Owin_FormInfo.Sequence,
			Owin_FormInfo.URL,
			Owin_FormInfo.IsView,
			Owin_FormInfo.IsDynamic,
			Owin_FormInfo.IsSuperAdmin,
			Owin_FormInfo.IsVisibleInMenu,
			Owin_FormInfo.TransID,
			Owin_FormInfo.CreatedByUserName,
			Owin_FormInfo.CreatedDate,
			Owin_FormInfo.UpdatedByUserName,
			Owin_FormInfo.UpdatedDate,
			Owin_FormInfo.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='AppFormID ASC' THEN Owin_FormInfo.AppFormID END ASC,
						CASE WHEN @SortExpression ='AppFormID DESC' THEN Owin_FormInfo.AppFormID END DESC,
						CASE WHEN @SortExpression ='FormName ASC' THEN Owin_FormInfo.FormName END ASC,
						CASE WHEN @SortExpression ='FormName DESC' THEN Owin_FormInfo.FormName END DESC,
						CASE WHEN @SortExpression ='FormNameAr ASC' THEN Owin_FormInfo.FormNameAr END ASC,
						CASE WHEN @SortExpression ='FormNameAr DESC' THEN Owin_FormInfo.FormNameAr END DESC,
						CASE WHEN @SortExpression ='ParentID ASC' THEN Owin_FormInfo.ParentID END ASC,
						CASE WHEN @SortExpression ='ParentID DESC' THEN Owin_FormInfo.ParentID END DESC,
						CASE WHEN @SortExpression ='LevelID ASC' THEN Owin_FormInfo.LevelID END ASC,
						CASE WHEN @SortExpression ='LevelID DESC' THEN Owin_FormInfo.LevelID END DESC,
						CASE WHEN @SortExpression ='MenuLevel ASC' THEN Owin_FormInfo.MenuLevel END ASC,
						CASE WHEN @SortExpression ='MenuLevel DESC' THEN Owin_FormInfo.MenuLevel END DESC,
						CASE WHEN @SortExpression ='HasDirectChild ASC' THEN Owin_FormInfo.HasDirectChild END ASC,
						CASE WHEN @SortExpression ='HasDirectChild DESC' THEN Owin_FormInfo.HasDirectChild END DESC,
						CASE WHEN @SortExpression ='ClassIcon ASC' THEN Owin_FormInfo.ClassIcon END ASC,
						CASE WHEN @SortExpression ='ClassIcon DESC' THEN Owin_FormInfo.ClassIcon END DESC,
						CASE WHEN @SortExpression ='Sequence ASC' THEN Owin_FormInfo.Sequence END ASC,
						CASE WHEN @SortExpression ='Sequence DESC' THEN Owin_FormInfo.Sequence END DESC,
						CASE WHEN @SortExpression ='URL ASC' THEN Owin_FormInfo.URL END ASC,
						CASE WHEN @SortExpression ='URL DESC' THEN Owin_FormInfo.URL END DESC,
						CASE WHEN @SortExpression ='IsView ASC' THEN Owin_FormInfo.IsView END ASC,
						CASE WHEN @SortExpression ='IsView DESC' THEN Owin_FormInfo.IsView END DESC,
						CASE WHEN @SortExpression ='IsDynamic ASC' THEN Owin_FormInfo.IsDynamic END ASC,
						CASE WHEN @SortExpression ='IsDynamic DESC' THEN Owin_FormInfo.IsDynamic END DESC,
						CASE WHEN @SortExpression ='IsSuperAdmin ASC' THEN Owin_FormInfo.IsSuperAdmin END ASC,
						CASE WHEN @SortExpression ='IsSuperAdmin DESC' THEN Owin_FormInfo.IsSuperAdmin END DESC,
						CASE WHEN @SortExpression ='IsVisibleInMenu ASC' THEN Owin_FormInfo.IsVisibleInMenu END ASC,
						CASE WHEN @SortExpression ='IsVisibleInMenu DESC' THEN Owin_FormInfo.IsVisibleInMenu END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_FormInfo.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_FormInfo.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_FormInfo.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_FormInfo.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_FormInfo.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_FormInfo.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_FormInfo.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_FormInfo.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_FormInfo.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_FormInfo.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_FormInfo.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_FormInfo.IPAddress END DESC
				) as RowNumber
		FROM Owin_FormInfo 
		where
			(CASE WHEN @AppFormID is NULL THEN 1 WHEN Owin_FormInfo.AppFormID  = @AppFormID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FormName is NULL THEN 1 WHEN Owin_FormInfo.FormName  = @FormName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FormNameAr is NULL THEN 1 WHEN Owin_FormInfo.FormNameAr  = @FormNameAr THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ParentID is NULL THEN 1 WHEN Owin_FormInfo.ParentID  = @ParentID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LevelID is NULL THEN 1 WHEN Owin_FormInfo.LevelID  = @LevelID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MenuLevel is NULL THEN 1 WHEN Owin_FormInfo.MenuLevel  = @MenuLevel THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @HasDirectChild is NULL THEN 1 WHEN Owin_FormInfo.HasDirectChild  = @HasDirectChild THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @ClassIcon is NULL THEN 1 WHEN Owin_FormInfo.ClassIcon  = @ClassIcon THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Sequence is NULL THEN 1 WHEN Owin_FormInfo.Sequence  = @Sequence THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @URL is NULL THEN 1 WHEN Owin_FormInfo.URL  = @URL THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsView is NULL THEN 1 WHEN Owin_FormInfo.IsView  = @IsView THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsDynamic is NULL THEN 1 WHEN Owin_FormInfo.IsDynamic  = @IsDynamic THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsSuperAdmin is NULL THEN 1 WHEN Owin_FormInfo.IsSuperAdmin  = @IsSuperAdmin THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsVisibleInMenu is NULL THEN 1 WHEN Owin_FormInfo.IsVisibleInMenu  = @IsVisibleInMenu THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_FormInfo.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_FormInfo.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
			)
			SELECT * 
			FROM  tempPagedowin_forminfo
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
CREATE PROCEDURE owin_lastworkingpage_Ins 
		@LastPageID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@LastEntryDate datetime  = NULL,
		        
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
		
        
		INSERT INTO Owin_LastWorkingPage (
			AppFormID,
			UserID,
			MasterUserID,
			LastEntryDate,
			TransID,
			CreatedByUserName,
			CreatedDate,
  			IPAddress
		)
		VALUES (
			@AppFormID,
			@UserID,
			@MasterUserID,
			@LastEntryDate,
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
CREATE PROCEDURE owin_lastworkingpage_Upd
		@LastPageID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@LastEntryDate datetime  = NULL,
		        
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
		UPDATE Owin_LastWorkingPage
		SET
			AppFormID = @AppFormID,
			UserID = @UserID,
			MasterUserID = @MasterUserID,
			LastEntryDate = @LastEntryDate,
			TransID = @TransID,
			UpdatedByUserName = @UpdatedByUserName,
			UpdatedDate = @UpdatedDate,
			IPAddress = @IPAddress
		WHERE
			LastPageID = @LastPageID
    SET @RETURN_KEY =@LastPageID
		    
	END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/	
CREATE PROCEDURE owin_lastworkingpage_Del		        
		@LastPageID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@LastEntryDate datetime  = NULL,
		        
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
		DELETE FROM Owin_LastWorkingPage
		WHERE 
			LastPageID = @LastPageID
		
    SET @RETURN_KEY =@LastPageID
		
		
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
CREATE PROCEDURE owin_lastworkingpage_GA 
		@LastPageID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@LastEntryDate datetime  = NULL,
		    
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
			Owin_LastWorkingPage.LastPageID,
			Owin_LastWorkingPage.AppFormID,
			Owin_LastWorkingPage.UserID,
			Owin_LastWorkingPage.MasterUserID,
			Owin_LastWorkingPage.LastEntryDate,
			Owin_LastWorkingPage.TransID,
			Owin_LastWorkingPage.CreatedByUserName,
			Owin_LastWorkingPage.CreatedDate,
			Owin_LastWorkingPage.UpdatedByUserName,
			Owin_LastWorkingPage.UpdatedDate,
			Owin_LastWorkingPage.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='LastPageID ASC' THEN Owin_LastWorkingPage.LastPageID END ASC,
						CASE WHEN @SortExpression ='LastPageID DESC' THEN Owin_LastWorkingPage.LastPageID END DESC,
						CASE WHEN @SortExpression ='AppFormID ASC' THEN Owin_LastWorkingPage.AppFormID END ASC,
						CASE WHEN @SortExpression ='AppFormID DESC' THEN Owin_LastWorkingPage.AppFormID END DESC,
						CASE WHEN @SortExpression ='UserID ASC' THEN Owin_LastWorkingPage.UserID END ASC,
						CASE WHEN @SortExpression ='UserID DESC' THEN Owin_LastWorkingPage.UserID END DESC,
						CASE WHEN @SortExpression ='MasterUserID ASC' THEN Owin_LastWorkingPage.MasterUserID END ASC,
						CASE WHEN @SortExpression ='MasterUserID DESC' THEN Owin_LastWorkingPage.MasterUserID END DESC,
						CASE WHEN @SortExpression ='LastEntryDate ASC' THEN Owin_LastWorkingPage.LastEntryDate END ASC,
						CASE WHEN @SortExpression ='LastEntryDate DESC' THEN Owin_LastWorkingPage.LastEntryDate END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_LastWorkingPage.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_LastWorkingPage.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_LastWorkingPage.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_LastWorkingPage.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_LastWorkingPage.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_LastWorkingPage.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_LastWorkingPage.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_LastWorkingPage.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_LastWorkingPage.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_LastWorkingPage.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_LastWorkingPage.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_LastWorkingPage.IPAddress END DESC
				) as RowNumber
		FROM Owin_LastWorkingPage 
		where
			(CASE WHEN @LastPageID is NULL THEN 1 WHEN Owin_LastWorkingPage.LastPageID  = @LastPageID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @AppFormID is NULL THEN 1 WHEN Owin_LastWorkingPage.AppFormID  = @AppFormID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserID is NULL THEN 1 WHEN Owin_LastWorkingPage.UserID  = @UserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MasterUserID is NULL THEN 1 WHEN Owin_LastWorkingPage.MasterUserID  = @MasterUserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LastEntryDate is NULL THEN 1 WHEN Owin_LastWorkingPage.LastEntryDate  = @LastEntryDate THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_LastWorkingPage.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_LastWorkingPage.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
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
CREATE PROCEDURE owin_lastworkingpage_GAPg 
		@LastPageID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@LastEntryDate datetime  = NULL,
		    
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
					owin_lastworkingpage
				WHERE 
					(CASE WHEN @LastPageID is NULL THEN 1 WHEN Owin_LastWorkingPage.LastPageID  = @LastPageID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @AppFormID is NULL THEN 1 WHEN Owin_LastWorkingPage.AppFormID  = @AppFormID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UserID is NULL THEN 1 WHEN Owin_LastWorkingPage.UserID  = @UserID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @MasterUserID is NULL THEN 1 WHEN Owin_LastWorkingPage.MasterUserID  = @MasterUserID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @LastEntryDate is NULL THEN 1 WHEN Owin_LastWorkingPage.LastEntryDate  = @LastEntryDate THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_LastWorkingPage.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_LastWorkingPage.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
					
					
					
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_lastworkingpage AS
			(
				  SELECT 
			Owin_LastWorkingPage.LastPageID,
			Owin_LastWorkingPage.AppFormID,
			Owin_LastWorkingPage.UserID,
			Owin_LastWorkingPage.MasterUserID,
			Owin_LastWorkingPage.LastEntryDate,
			Owin_LastWorkingPage.TransID,
			Owin_LastWorkingPage.CreatedByUserName,
			Owin_LastWorkingPage.CreatedDate,
			Owin_LastWorkingPage.UpdatedByUserName,
			Owin_LastWorkingPage.UpdatedDate,
			Owin_LastWorkingPage.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='LastPageID ASC' THEN Owin_LastWorkingPage.LastPageID END ASC,
						CASE WHEN @SortExpression ='LastPageID DESC' THEN Owin_LastWorkingPage.LastPageID END DESC,
						CASE WHEN @SortExpression ='AppFormID ASC' THEN Owin_LastWorkingPage.AppFormID END ASC,
						CASE WHEN @SortExpression ='AppFormID DESC' THEN Owin_LastWorkingPage.AppFormID END DESC,
						CASE WHEN @SortExpression ='UserID ASC' THEN Owin_LastWorkingPage.UserID END ASC,
						CASE WHEN @SortExpression ='UserID DESC' THEN Owin_LastWorkingPage.UserID END DESC,
						CASE WHEN @SortExpression ='MasterUserID ASC' THEN Owin_LastWorkingPage.MasterUserID END ASC,
						CASE WHEN @SortExpression ='MasterUserID DESC' THEN Owin_LastWorkingPage.MasterUserID END DESC,
						CASE WHEN @SortExpression ='LastEntryDate ASC' THEN Owin_LastWorkingPage.LastEntryDate END ASC,
						CASE WHEN @SortExpression ='LastEntryDate DESC' THEN Owin_LastWorkingPage.LastEntryDate END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_LastWorkingPage.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_LastWorkingPage.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_LastWorkingPage.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_LastWorkingPage.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_LastWorkingPage.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_LastWorkingPage.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_LastWorkingPage.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_LastWorkingPage.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_LastWorkingPage.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_LastWorkingPage.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_LastWorkingPage.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_LastWorkingPage.IPAddress END DESC
				) as RowNumber
		FROM Owin_LastWorkingPage 
		where
			(CASE WHEN @LastPageID is NULL THEN 1 WHEN Owin_LastWorkingPage.LastPageID  = @LastPageID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @AppFormID is NULL THEN 1 WHEN Owin_LastWorkingPage.AppFormID  = @AppFormID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserID is NULL THEN 1 WHEN Owin_LastWorkingPage.UserID  = @UserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MasterUserID is NULL THEN 1 WHEN Owin_LastWorkingPage.MasterUserID  = @MasterUserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LastEntryDate is NULL THEN 1 WHEN Owin_LastWorkingPage.LastEntryDate  = @LastEntryDate THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_LastWorkingPage.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_LastWorkingPage.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
			)
			SELECT * 
			FROM  tempPagedowin_lastworkingpage
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
CREATE PROCEDURE owin_role_Ins 
		@RoleID bigint  = NULL,
		@RoleName nvarchar (250) = NULL,
		@Description nvarchar (500) = NULL,
		        
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
		
        
		INSERT INTO Owin_Role (
			RoleName,
			Description,
			TransID,
			CreatedByUserName,
			CreatedDate,
  			IPAddress
		)
		VALUES (
			@RoleName,
			@Description,
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
CREATE PROCEDURE owin_role_Upd
		@RoleID bigint  = NULL,
		@RoleName nvarchar (250) = NULL,
		@Description nvarchar (500) = NULL,
		        
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
		UPDATE Owin_Role
		SET
			RoleName = @RoleName,
			Description = @Description,
			TransID = @TransID,
			UpdatedByUserName = @UpdatedByUserName,
			UpdatedDate = @UpdatedDate,
			IPAddress = @IPAddress
		WHERE
			RoleID = @RoleID
    SET @RETURN_KEY =@RoleID
		    
	END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/	
CREATE PROCEDURE owin_role_Del		        
		@RoleID bigint  = NULL,
		@RoleName nvarchar (250) = NULL,
		@Description nvarchar (500) = NULL,
		        
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
		DELETE FROM Owin_Role
		WHERE 
			RoleID = @RoleID
		
    SET @RETURN_KEY =@RoleID
		
		
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
CREATE PROCEDURE owin_role_GA 
		@RoleID bigint  = NULL,
		@RoleName nvarchar (250) = NULL,
		@Description nvarchar (500) = NULL,
		    
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
			Owin_Role.RoleID,
			Owin_Role.RoleName,
			Owin_Role.Description,
			Owin_Role.TransID,
			Owin_Role.CreatedByUserName,
			Owin_Role.CreatedDate,
			Owin_Role.UpdatedByUserName,
			Owin_Role.UpdatedDate,
			Owin_Role.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='RoleID ASC' THEN Owin_Role.RoleID END ASC,
						CASE WHEN @SortExpression ='RoleID DESC' THEN Owin_Role.RoleID END DESC,
						CASE WHEN @SortExpression ='RoleName ASC' THEN Owin_Role.RoleName END ASC,
						CASE WHEN @SortExpression ='RoleName DESC' THEN Owin_Role.RoleName END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_Role.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_Role.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_Role.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_Role.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_Role.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_Role.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_Role.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_Role.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_Role.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_Role.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_Role.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_Role.IPAddress END DESC
				) as RowNumber
		FROM Owin_Role 
		where
			(CASE WHEN @RoleID is NULL THEN 1 WHEN Owin_Role.RoleID  = @RoleID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @RoleName is NULL THEN 1 WHEN Owin_Role.RoleName  = @RoleName THEN 1 ELSE 0 END = 1)
			
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_Role.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_Role.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
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
CREATE PROCEDURE owin_role_GAPg 
		@RoleID bigint  = NULL,
		@RoleName nvarchar (250) = NULL,
		@Description nvarchar (500) = NULL,
		    
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
					owin_role
				WHERE 
					(CASE WHEN @RoleID is NULL THEN 1 WHEN Owin_Role.RoleID  = @RoleID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @RoleName is NULL THEN 1 WHEN Owin_Role.RoleName  = @RoleName THEN 1 ELSE 0 END = 1)
					
					
					AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_Role.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_Role.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
					
					
					
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_role AS
			(
				  SELECT 
			Owin_Role.RoleID,
			Owin_Role.RoleName,
			Owin_Role.Description,
			Owin_Role.TransID,
			Owin_Role.CreatedByUserName,
			Owin_Role.CreatedDate,
			Owin_Role.UpdatedByUserName,
			Owin_Role.UpdatedDate,
			Owin_Role.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='RoleID ASC' THEN Owin_Role.RoleID END ASC,
						CASE WHEN @SortExpression ='RoleID DESC' THEN Owin_Role.RoleID END DESC,
						CASE WHEN @SortExpression ='RoleName ASC' THEN Owin_Role.RoleName END ASC,
						CASE WHEN @SortExpression ='RoleName DESC' THEN Owin_Role.RoleName END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_Role.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_Role.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_Role.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_Role.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_Role.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_Role.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_Role.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_Role.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_Role.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_Role.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_Role.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_Role.IPAddress END DESC
				) as RowNumber
		FROM Owin_Role 
		where
			(CASE WHEN @RoleID is NULL THEN 1 WHEN Owin_Role.RoleID  = @RoleID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @RoleName is NULL THEN 1 WHEN Owin_Role.RoleName  = @RoleName THEN 1 ELSE 0 END = 1)
			
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_Role.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_Role.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
			)
			SELECT * 
			FROM  tempPagedowin_role
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
CREATE PROCEDURE owin_rolepermission_Ins 
		@RolePremissionID bigint  = NULL,
		@RoleID bigint  = NULL,
		@FormActionID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@Status bit  = NULL,
		        
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
		
        
		INSERT INTO Owin_RolePermission (
			RoleID,
			FormActionID,
			AppFormID,
			Status,
			TransID,
			CreatedByUserName,
			CreatedDate,
  			IPAddress
		)
		VALUES (
			@RoleID,
			@FormActionID,
			@AppFormID,
			@Status,
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
CREATE PROCEDURE owin_rolepermission_Upd
		@RolePremissionID bigint  = NULL,
		@RoleID bigint  = NULL,
		@FormActionID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@Status bit  = NULL,
		        
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
		UPDATE Owin_RolePermission
		SET
			RoleID = @RoleID,
			FormActionID = @FormActionID,
			AppFormID = @AppFormID,
			Status = @Status,
			TransID = @TransID,
			UpdatedByUserName = @UpdatedByUserName,
			UpdatedDate = @UpdatedDate,
			IPAddress = @IPAddress
		WHERE
			RolePremissionID = @RolePremissionID
    SET @RETURN_KEY =@RolePremissionID
		    
	END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/	
CREATE PROCEDURE owin_rolepermission_Del		        
		@RolePremissionID bigint  = NULL,
		@RoleID bigint  = NULL,
		@FormActionID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@Status bit  = NULL,
		        
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
		DELETE FROM Owin_RolePermission
		WHERE 
			RolePremissionID = @RolePremissionID
		
    SET @RETURN_KEY =@RolePremissionID
		
		
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
CREATE PROCEDURE owin_rolepermission_GA 
		@RolePremissionID bigint  = NULL,
		@RoleID bigint  = NULL,
		@FormActionID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@Status bit  = NULL,
		    
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
			Owin_RolePermission.RolePremissionID,
			Owin_RolePermission.RoleID,
			Owin_RolePermission.FormActionID,
			Owin_RolePermission.AppFormID,
			Owin_RolePermission.Status,
			Owin_RolePermission.TransID,
			Owin_RolePermission.CreatedByUserName,
			Owin_RolePermission.CreatedDate,
			Owin_RolePermission.UpdatedByUserName,
			Owin_RolePermission.UpdatedDate,
			Owin_RolePermission.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='RolePremissionID ASC' THEN Owin_RolePermission.RolePremissionID END ASC,
						CASE WHEN @SortExpression ='RolePremissionID DESC' THEN Owin_RolePermission.RolePremissionID END DESC,
						CASE WHEN @SortExpression ='RoleID ASC' THEN Owin_RolePermission.RoleID END ASC,
						CASE WHEN @SortExpression ='RoleID DESC' THEN Owin_RolePermission.RoleID END DESC,
						CASE WHEN @SortExpression ='FormActionID ASC' THEN Owin_RolePermission.FormActionID END ASC,
						CASE WHEN @SortExpression ='FormActionID DESC' THEN Owin_RolePermission.FormActionID END DESC,
						CASE WHEN @SortExpression ='AppFormID ASC' THEN Owin_RolePermission.AppFormID END ASC,
						CASE WHEN @SortExpression ='AppFormID DESC' THEN Owin_RolePermission.AppFormID END DESC,
						CASE WHEN @SortExpression ='Status ASC' THEN Owin_RolePermission.Status END ASC,
						CASE WHEN @SortExpression ='Status DESC' THEN Owin_RolePermission.Status END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_RolePermission.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_RolePermission.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_RolePermission.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_RolePermission.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_RolePermission.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_RolePermission.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_RolePermission.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_RolePermission.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_RolePermission.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_RolePermission.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_RolePermission.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_RolePermission.IPAddress END DESC
				) as RowNumber
		FROM Owin_RolePermission 
		where
			(CASE WHEN @RolePremissionID is NULL THEN 1 WHEN Owin_RolePermission.RolePremissionID  = @RolePremissionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @RoleID is NULL THEN 1 WHEN Owin_RolePermission.RoleID  = @RoleID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FormActionID is NULL THEN 1 WHEN Owin_RolePermission.FormActionID  = @FormActionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @AppFormID is NULL THEN 1 WHEN Owin_RolePermission.AppFormID  = @AppFormID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Status is NULL THEN 1 WHEN Owin_RolePermission.Status  = @Status THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_RolePermission.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_RolePermission.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
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
CREATE PROCEDURE owin_rolepermission_GAPg 
		@RolePremissionID bigint  = NULL,
		@RoleID bigint  = NULL,
		@FormActionID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@Status bit  = NULL,
		    
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
					owin_rolepermission
				WHERE 
					(CASE WHEN @RolePremissionID is NULL THEN 1 WHEN Owin_RolePermission.RolePremissionID  = @RolePremissionID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @RoleID is NULL THEN 1 WHEN Owin_RolePermission.RoleID  = @RoleID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @FormActionID is NULL THEN 1 WHEN Owin_RolePermission.FormActionID  = @FormActionID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @AppFormID is NULL THEN 1 WHEN Owin_RolePermission.AppFormID  = @AppFormID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @Status is NULL THEN 1 WHEN Owin_RolePermission.Status  = @Status THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_RolePermission.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_RolePermission.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
					
					
					
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_rolepermission AS
			(
				  SELECT 
			Owin_RolePermission.RolePremissionID,
			Owin_RolePermission.RoleID,
			Owin_RolePermission.FormActionID,
			Owin_RolePermission.AppFormID,
			Owin_RolePermission.Status,
			Owin_RolePermission.TransID,
			Owin_RolePermission.CreatedByUserName,
			Owin_RolePermission.CreatedDate,
			Owin_RolePermission.UpdatedByUserName,
			Owin_RolePermission.UpdatedDate,
			Owin_RolePermission.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='RolePremissionID ASC' THEN Owin_RolePermission.RolePremissionID END ASC,
						CASE WHEN @SortExpression ='RolePremissionID DESC' THEN Owin_RolePermission.RolePremissionID END DESC,
						CASE WHEN @SortExpression ='RoleID ASC' THEN Owin_RolePermission.RoleID END ASC,
						CASE WHEN @SortExpression ='RoleID DESC' THEN Owin_RolePermission.RoleID END DESC,
						CASE WHEN @SortExpression ='FormActionID ASC' THEN Owin_RolePermission.FormActionID END ASC,
						CASE WHEN @SortExpression ='FormActionID DESC' THEN Owin_RolePermission.FormActionID END DESC,
						CASE WHEN @SortExpression ='AppFormID ASC' THEN Owin_RolePermission.AppFormID END ASC,
						CASE WHEN @SortExpression ='AppFormID DESC' THEN Owin_RolePermission.AppFormID END DESC,
						CASE WHEN @SortExpression ='Status ASC' THEN Owin_RolePermission.Status END ASC,
						CASE WHEN @SortExpression ='Status DESC' THEN Owin_RolePermission.Status END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_RolePermission.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_RolePermission.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_RolePermission.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_RolePermission.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_RolePermission.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_RolePermission.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_RolePermission.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_RolePermission.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_RolePermission.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_RolePermission.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_RolePermission.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_RolePermission.IPAddress END DESC
				) as RowNumber
		FROM Owin_RolePermission 
		where
			(CASE WHEN @RolePremissionID is NULL THEN 1 WHEN Owin_RolePermission.RolePremissionID  = @RolePremissionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @RoleID is NULL THEN 1 WHEN Owin_RolePermission.RoleID  = @RoleID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FormActionID is NULL THEN 1 WHEN Owin_RolePermission.FormActionID  = @FormActionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @AppFormID is NULL THEN 1 WHEN Owin_RolePermission.AppFormID  = @AppFormID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Status is NULL THEN 1 WHEN Owin_RolePermission.Status  = @Status THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_RolePermission.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_RolePermission.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
			)
			SELECT * 
			FROM  tempPagedowin_rolepermission
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
CREATE PROCEDURE owin_user_Ins 
		@ApplicationId uniqueidentifier  = NULL,
		@UserId uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@UserName nvarchar (256) = NULL,
		@EmailAddress nvarchar (150) = NULL,
		@LoweredUserName nvarchar (256) = NULL,
		@MobileNumber nvarchar (16) = NULL,
		@UserProfilePhoto nvarchar (250) = NULL,
		@IsAnonymous bit  = NULL,
		@IsChildEnable bit  = NULL,
		@MasPrivateKey nvarchar (1000) = NULL,
		@MasPublicKey nvarchar (1000) = NULL,
		@Password nvarchar (500) = NULL,
		@PasswordSalt nvarchar (500) = NULL,
		@PasswordKey nvarchar (500) = NULL,
		@PasswordVector nvarchar (500) = NULL,
		@MobilePIN nvarchar (16) = NULL,
		@PasswordQuestion nvarchar (256) = NULL,
		@PasswordAnswer nvarchar (128) = NULL,
		@Approved bit  = NULL,
		@Locked bit  = NULL,
		@LastLoginDate datetime  = NULL,
		@LastPassChangedDate datetime  = NULL,
		@LastLockoutDate datetime  = NULL,
		@FailedPasswordAttemptCount int  = NULL,
		@Comment nvarchar (550) = NULL,
		@LastActivityDate datetime  = NULL,
		@IsReviewed bit  = NULL,
		@ReviewedBy bigint  = NULL,
		@ReviewedByUserName nvarchar (150) = NULL,
		@ReviewedDate datetime  = NULL,
		@IsApproved bit  = NULL,
		@ApprovedBy bigint  = NULL,
		@ApprovedByUserName nvarchar (150) = NULL,
		@ApprovedDate datetime  = NULL,
		@IsEmailConfirmed bit  = NULL,
		@EmailConfirmationByUserDate datetime  = NULL,
		@TwoFactorEnable bit  = NULL,
		@IsMobileNumberConfirmed bit  = NULL,
		@MobileNumberConfirmedByUserDate datetime  = NULL,
		@SecurityStamp nvarchar (MAX) = NULL,
		@ConcurrencyStamp nvarchar (MAX) = NULL,
		        
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
		
        
		INSERT INTO Owin_User (
			ApplicationId,
			MasterUserID,
			UserName,
			EmailAddress,
			LoweredUserName,
			MobileNumber,
			UserProfilePhoto,
			IsAnonymous,
			IsChildEnable,
			MasPrivateKey,
			MasPublicKey,
			Password,
			PasswordSalt,
			PasswordKey,
			PasswordVector,
			MobilePIN,
			PasswordQuestion,
			PasswordAnswer,
			Approved,
			Locked,
			LastLoginDate,
			LastPassChangedDate,
			LastLockoutDate,
			FailedPasswordAttemptCount,
			Comment,
			LastActivityDate,
			IsReviewed,
			ReviewedBy,
			ReviewedByUserName,
			ReviewedDate,
			IsApproved,
			ApprovedBy,
			ApprovedByUserName,
			ApprovedDate,
			IsEmailConfirmed,
			EmailConfirmationByUserDate,
			TwoFactorEnable,
			IsMobileNumberConfirmed,
			MobileNumberConfirmedByUserDate,
			SecurityStamp,
			ConcurrencyStamp,
			TransID,
			CreatedByUserName,
			CreatedDate,
  			IPAddress
		)
		VALUES (
			@ApplicationId,
			@MasterUserID,
			@UserName,
			@EmailAddress,
			@LoweredUserName,
			@MobileNumber,
			@UserProfilePhoto,
			@IsAnonymous,
			@IsChildEnable,
			@MasPrivateKey,
			@MasPublicKey,
			@Password,
			@PasswordSalt,
			@PasswordKey,
			@PasswordVector,
			@MobilePIN,
			@PasswordQuestion,
			@PasswordAnswer,
			@Approved,
			@Locked,
			@LastLoginDate,
			@LastPassChangedDate,
			@LastLockoutDate,
			@FailedPasswordAttemptCount,
			@Comment,
			@LastActivityDate,
			@IsReviewed,
			@ReviewedBy,
			@ReviewedByUserName,
			@ReviewedDate,
			@IsApproved,
			@ApprovedBy,
			@ApprovedByUserName,
			@ApprovedDate,
			@IsEmailConfirmed,
			@EmailConfirmationByUserDate,
			@TwoFactorEnable,
			@IsMobileNumberConfirmed,
			@MobileNumberConfirmedByUserDate,
			@SecurityStamp,
			@ConcurrencyStamp,
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
CREATE PROCEDURE owin_user_Upd
		@ApplicationId uniqueidentifier  = NULL,
		@UserId uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@UserName nvarchar (256) = NULL,
		@EmailAddress nvarchar (150) = NULL,
		@LoweredUserName nvarchar (256) = NULL,
		@MobileNumber nvarchar (16) = NULL,
		@UserProfilePhoto nvarchar (250) = NULL,
		@IsAnonymous bit  = NULL,
		@IsChildEnable bit  = NULL,
		@MasPrivateKey nvarchar (1000) = NULL,
		@MasPublicKey nvarchar (1000) = NULL,
		@Password nvarchar (500) = NULL,
		@PasswordSalt nvarchar (500) = NULL,
		@PasswordKey nvarchar (500) = NULL,
		@PasswordVector nvarchar (500) = NULL,
		@MobilePIN nvarchar (16) = NULL,
		@PasswordQuestion nvarchar (256) = NULL,
		@PasswordAnswer nvarchar (128) = NULL,
		@Approved bit  = NULL,
		@Locked bit  = NULL,
		@LastLoginDate datetime  = NULL,
		@LastPassChangedDate datetime  = NULL,
		@LastLockoutDate datetime  = NULL,
		@FailedPasswordAttemptCount int  = NULL,
		@Comment nvarchar (550) = NULL,
		@LastActivityDate datetime  = NULL,
		@IsReviewed bit  = NULL,
		@ReviewedBy bigint  = NULL,
		@ReviewedByUserName nvarchar (150) = NULL,
		@ReviewedDate datetime  = NULL,
		@IsApproved bit  = NULL,
		@ApprovedBy bigint  = NULL,
		@ApprovedByUserName nvarchar (150) = NULL,
		@ApprovedDate datetime  = NULL,
		@IsEmailConfirmed bit  = NULL,
		@EmailConfirmationByUserDate datetime  = NULL,
		@TwoFactorEnable bit  = NULL,
		@IsMobileNumberConfirmed bit  = NULL,
		@MobileNumberConfirmedByUserDate datetime  = NULL,
		@SecurityStamp nvarchar (MAX) = NULL,
		@ConcurrencyStamp nvarchar (MAX) = NULL,
		        
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
		UPDATE Owin_User
		SET
			ApplicationId = @ApplicationId,
			--MasterUserID = @MasterUserID,
			UserName = @UserName,
			EmailAddress = @EmailAddress,
			LoweredUserName = @LoweredUserName,
			MobileNumber = @MobileNumber,
			UserProfilePhoto = @UserProfilePhoto,
			IsAnonymous = @IsAnonymous,
			IsChildEnable = @IsChildEnable,
			MasPrivateKey = @MasPrivateKey,
			MasPublicKey = @MasPublicKey,
			Password = @Password,
			PasswordSalt = @PasswordSalt,
			PasswordKey = @PasswordKey,
			PasswordVector = @PasswordVector,
			MobilePIN = @MobilePIN,
			PasswordQuestion = @PasswordQuestion,
			PasswordAnswer = @PasswordAnswer,
			Approved = @Approved,
			Locked = @Locked,
			LastLoginDate = @LastLoginDate,
			LastPassChangedDate = @LastPassChangedDate,
			LastLockoutDate = @LastLockoutDate,
			FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
			Comment = @Comment,
			LastActivityDate = @LastActivityDate,
			IsReviewed = @IsReviewed,
			ReviewedBy = @ReviewedBy,
			ReviewedByUserName = @ReviewedByUserName,
			ReviewedDate = @ReviewedDate,
			IsApproved = @IsApproved,
			ApprovedBy = @ApprovedBy,
			ApprovedByUserName = @ApprovedByUserName,
			ApprovedDate = @ApprovedDate,
			IsEmailConfirmed = @IsEmailConfirmed,
			EmailConfirmationByUserDate = @EmailConfirmationByUserDate,
			TwoFactorEnable = @TwoFactorEnable,
			IsMobileNumberConfirmed = @IsMobileNumberConfirmed,
			MobileNumberConfirmedByUserDate = @MobileNumberConfirmedByUserDate,
			SecurityStamp = @SecurityStamp,
			ConcurrencyStamp = @ConcurrencyStamp,
			TransID = @TransID,
			UpdatedByUserName = @UpdatedByUserName,
			UpdatedDate = @UpdatedDate,
			IPAddress = @IPAddress
		WHERE
			UserId = @UserId
SET @RETURN_KEY = 1
		    
	END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/	
CREATE PROCEDURE owin_user_Del		        
		@ApplicationId uniqueidentifier  = NULL,
		@UserId uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@UserName nvarchar (256) = NULL,
		@EmailAddress nvarchar (150) = NULL,
		@LoweredUserName nvarchar (256) = NULL,
		@MobileNumber nvarchar (16) = NULL,
		@UserProfilePhoto nvarchar (250) = NULL,
		@IsAnonymous bit  = NULL,
		@IsChildEnable bit  = NULL,
		@MasPrivateKey nvarchar (1000) = NULL,
		@MasPublicKey nvarchar (1000) = NULL,
		@Password nvarchar (500) = NULL,
		@PasswordSalt nvarchar (500) = NULL,
		@PasswordKey nvarchar (500) = NULL,
		@PasswordVector nvarchar (500) = NULL,
		@MobilePIN nvarchar (16) = NULL,
		@PasswordQuestion nvarchar (256) = NULL,
		@PasswordAnswer nvarchar (128) = NULL,
		@Approved bit  = NULL,
		@Locked bit  = NULL,
		@LastLoginDate datetime  = NULL,
		@LastPassChangedDate datetime  = NULL,
		@LastLockoutDate datetime  = NULL,
		@FailedPasswordAttemptCount int  = NULL,
		@Comment nvarchar (550) = NULL,
		@LastActivityDate datetime  = NULL,
		@IsReviewed bit  = NULL,
		@ReviewedBy bigint  = NULL,
		@ReviewedByUserName nvarchar (150) = NULL,
		@ReviewedDate datetime  = NULL,
		@IsApproved bit  = NULL,
		@ApprovedBy bigint  = NULL,
		@ApprovedByUserName nvarchar (150) = NULL,
		@ApprovedDate datetime  = NULL,
		@IsEmailConfirmed bit  = NULL,
		@EmailConfirmationByUserDate datetime  = NULL,
		@TwoFactorEnable bit  = NULL,
		@IsMobileNumberConfirmed bit  = NULL,
		@MobileNumberConfirmedByUserDate datetime  = NULL,
		@SecurityStamp nvarchar (MAX) = NULL,
		@ConcurrencyStamp nvarchar (MAX) = NULL,
		        
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
		DELETE FROM Owin_User
		WHERE 
			UserId = @UserId
		
SET @RETURN_KEY = 1
		
		
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
CREATE PROCEDURE owin_user_GA 
		@ApplicationId uniqueidentifier  = NULL,
		@UserId uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@UserName nvarchar (256) = NULL,
		@EmailAddress nvarchar (150) = NULL,
		@LoweredUserName nvarchar (256) = NULL,
		@MobileNumber nvarchar (16) = NULL,
		@UserProfilePhoto nvarchar (250) = NULL,
		@IsAnonymous bit  = NULL,
		@IsChildEnable bit  = NULL,
		@MasPrivateKey nvarchar (1000) = NULL,
		@MasPublicKey nvarchar (1000) = NULL,
		@Password nvarchar (500) = NULL,
		@PasswordSalt nvarchar (500) = NULL,
		@PasswordKey nvarchar (500) = NULL,
		@PasswordVector nvarchar (500) = NULL,
		@MobilePIN nvarchar (16) = NULL,
		@PasswordQuestion nvarchar (256) = NULL,
		@PasswordAnswer nvarchar (128) = NULL,
		@Approved bit  = NULL,
		@Locked bit  = NULL,
		@LastLoginDate datetime  = NULL,
		@LastPassChangedDate datetime  = NULL,
		@LastLockoutDate datetime  = NULL,
		@FailedPasswordAttemptCount int  = NULL,
		@Comment nvarchar (550) = NULL,
		@LastActivityDate datetime  = NULL,
		@IsReviewed bit  = NULL,
		@ReviewedBy bigint  = NULL,
		@ReviewedByUserName nvarchar (150) = NULL,
		@ReviewedDate datetime  = NULL,
		@IsApproved bit  = NULL,
		@ApprovedBy bigint  = NULL,
		@ApprovedByUserName nvarchar (150) = NULL,
		@ApprovedDate datetime  = NULL,
		@IsEmailConfirmed bit  = NULL,
		@EmailConfirmationByUserDate datetime  = NULL,
		@TwoFactorEnable bit  = NULL,
		@IsMobileNumberConfirmed bit  = NULL,
		@MobileNumberConfirmedByUserDate datetime  = NULL,
		@SecurityStamp nvarchar (MAX) = NULL,
		@ConcurrencyStamp nvarchar (MAX) = NULL,
		    
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
			Owin_User.ApplicationId,
			Owin_User.UserId,
			Owin_User.MasterUserID,
			Owin_User.UserName,
			Owin_User.EmailAddress,
			Owin_User.LoweredUserName,
			Owin_User.MobileNumber,
			Owin_User.UserProfilePhoto,
			Owin_User.IsAnonymous,
			Owin_User.IsChildEnable,
			Owin_User.MasPrivateKey,
			Owin_User.MasPublicKey,
			Owin_User.Password,
			Owin_User.PasswordSalt,
			Owin_User.PasswordKey,
			Owin_User.PasswordVector,
			Owin_User.MobilePIN,
			Owin_User.PasswordQuestion,
			Owin_User.PasswordAnswer,
			Owin_User.Approved,
			Owin_User.Locked,
			Owin_User.LastLoginDate,
			Owin_User.LastPassChangedDate,
			Owin_User.LastLockoutDate,
			Owin_User.FailedPasswordAttemptCount,
			Owin_User.Comment,
			Owin_User.LastActivityDate,
			Owin_User.IsReviewed,
			Owin_User.ReviewedBy,
			Owin_User.ReviewedByUserName,
			Owin_User.ReviewedDate,
			Owin_User.IsApproved,
			Owin_User.ApprovedBy,
			Owin_User.ApprovedByUserName,
			Owin_User.ApprovedDate,
			Owin_User.IsEmailConfirmed,
			Owin_User.EmailConfirmationByUserDate,
			Owin_User.TwoFactorEnable,
			Owin_User.IsMobileNumberConfirmed,
			Owin_User.MobileNumberConfirmedByUserDate,
			Owin_User.SecurityStamp,
			Owin_User.ConcurrencyStamp,
			Owin_User.TransID,
			Owin_User.CreatedByUserName,
			Owin_User.CreatedDate,
			Owin_User.UpdatedByUserName,
			Owin_User.UpdatedDate,
			Owin_User.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='ApplicationId ASC' THEN Owin_User.ApplicationId END ASC,
						CASE WHEN @SortExpression ='ApplicationId DESC' THEN Owin_User.ApplicationId END DESC,
						CASE WHEN @SortExpression ='UserId ASC' THEN Owin_User.UserId END ASC,
						CASE WHEN @SortExpression ='UserId DESC' THEN Owin_User.UserId END DESC,
						CASE WHEN @SortExpression ='MasterUserID ASC' THEN Owin_User.MasterUserID END ASC,
						CASE WHEN @SortExpression ='MasterUserID DESC' THEN Owin_User.MasterUserID END DESC,
						CASE WHEN @SortExpression ='UserName ASC' THEN Owin_User.UserName END ASC,
						CASE WHEN @SortExpression ='UserName DESC' THEN Owin_User.UserName END DESC,
						CASE WHEN @SortExpression ='EmailAddress ASC' THEN Owin_User.EmailAddress END ASC,
						CASE WHEN @SortExpression ='EmailAddress DESC' THEN Owin_User.EmailAddress END DESC,
						CASE WHEN @SortExpression ='LoweredUserName ASC' THEN Owin_User.LoweredUserName END ASC,
						CASE WHEN @SortExpression ='LoweredUserName DESC' THEN Owin_User.LoweredUserName END DESC,
						CASE WHEN @SortExpression ='MobileNumber ASC' THEN Owin_User.MobileNumber END ASC,
						CASE WHEN @SortExpression ='MobileNumber DESC' THEN Owin_User.MobileNumber END DESC,
						CASE WHEN @SortExpression ='UserProfilePhoto ASC' THEN Owin_User.UserProfilePhoto END ASC,
						CASE WHEN @SortExpression ='UserProfilePhoto DESC' THEN Owin_User.UserProfilePhoto END DESC,
						CASE WHEN @SortExpression ='IsAnonymous ASC' THEN Owin_User.IsAnonymous END ASC,
						CASE WHEN @SortExpression ='IsAnonymous DESC' THEN Owin_User.IsAnonymous END DESC,
						CASE WHEN @SortExpression ='IsChildEnable ASC' THEN Owin_User.IsChildEnable END ASC,
						CASE WHEN @SortExpression ='IsChildEnable DESC' THEN Owin_User.IsChildEnable END DESC,
						CASE WHEN @SortExpression ='MobilePIN ASC' THEN Owin_User.MobilePIN END ASC,
						CASE WHEN @SortExpression ='MobilePIN DESC' THEN Owin_User.MobilePIN END DESC,
						CASE WHEN @SortExpression ='PasswordQuestion ASC' THEN Owin_User.PasswordQuestion END ASC,
						CASE WHEN @SortExpression ='PasswordQuestion DESC' THEN Owin_User.PasswordQuestion END DESC,
						CASE WHEN @SortExpression ='PasswordAnswer ASC' THEN Owin_User.PasswordAnswer END ASC,
						CASE WHEN @SortExpression ='PasswordAnswer DESC' THEN Owin_User.PasswordAnswer END DESC,
						CASE WHEN @SortExpression ='Approved ASC' THEN Owin_User.Approved END ASC,
						CASE WHEN @SortExpression ='Approved DESC' THEN Owin_User.Approved END DESC,
						CASE WHEN @SortExpression ='Locked ASC' THEN Owin_User.Locked END ASC,
						CASE WHEN @SortExpression ='Locked DESC' THEN Owin_User.Locked END DESC,
						CASE WHEN @SortExpression ='LastLoginDate ASC' THEN Owin_User.LastLoginDate END ASC,
						CASE WHEN @SortExpression ='LastLoginDate DESC' THEN Owin_User.LastLoginDate END DESC,
						CASE WHEN @SortExpression ='LastPassChangedDate ASC' THEN Owin_User.LastPassChangedDate END ASC,
						CASE WHEN @SortExpression ='LastPassChangedDate DESC' THEN Owin_User.LastPassChangedDate END DESC,
						CASE WHEN @SortExpression ='LastLockoutDate ASC' THEN Owin_User.LastLockoutDate END ASC,
						CASE WHEN @SortExpression ='LastLockoutDate DESC' THEN Owin_User.LastLockoutDate END DESC,
						CASE WHEN @SortExpression ='FailedPasswordAttemptCount ASC' THEN Owin_User.FailedPasswordAttemptCount END ASC,
						CASE WHEN @SortExpression ='FailedPasswordAttemptCount DESC' THEN Owin_User.FailedPasswordAttemptCount END DESC,
						CASE WHEN @SortExpression ='LastActivityDate ASC' THEN Owin_User.LastActivityDate END ASC,
						CASE WHEN @SortExpression ='LastActivityDate DESC' THEN Owin_User.LastActivityDate END DESC,
						CASE WHEN @SortExpression ='IsReviewed ASC' THEN Owin_User.IsReviewed END ASC,
						CASE WHEN @SortExpression ='IsReviewed DESC' THEN Owin_User.IsReviewed END DESC,
						CASE WHEN @SortExpression ='ReviewedBy ASC' THEN Owin_User.ReviewedBy END ASC,
						CASE WHEN @SortExpression ='ReviewedBy DESC' THEN Owin_User.ReviewedBy END DESC,
						CASE WHEN @SortExpression ='ReviewedByUserName ASC' THEN Owin_User.ReviewedByUserName END ASC,
						CASE WHEN @SortExpression ='ReviewedByUserName DESC' THEN Owin_User.ReviewedByUserName END DESC,
						CASE WHEN @SortExpression ='ReviewedDate ASC' THEN Owin_User.ReviewedDate END ASC,
						CASE WHEN @SortExpression ='ReviewedDate DESC' THEN Owin_User.ReviewedDate END DESC,
						CASE WHEN @SortExpression ='IsApproved ASC' THEN Owin_User.IsApproved END ASC,
						CASE WHEN @SortExpression ='IsApproved DESC' THEN Owin_User.IsApproved END DESC,
						CASE WHEN @SortExpression ='ApprovedBy ASC' THEN Owin_User.ApprovedBy END ASC,
						CASE WHEN @SortExpression ='ApprovedBy DESC' THEN Owin_User.ApprovedBy END DESC,
						CASE WHEN @SortExpression ='ApprovedByUserName ASC' THEN Owin_User.ApprovedByUserName END ASC,
						CASE WHEN @SortExpression ='ApprovedByUserName DESC' THEN Owin_User.ApprovedByUserName END DESC,
						CASE WHEN @SortExpression ='ApprovedDate ASC' THEN Owin_User.ApprovedDate END ASC,
						CASE WHEN @SortExpression ='ApprovedDate DESC' THEN Owin_User.ApprovedDate END DESC,
						CASE WHEN @SortExpression ='IsEmailConfirmed ASC' THEN Owin_User.IsEmailConfirmed END ASC,
						CASE WHEN @SortExpression ='IsEmailConfirmed DESC' THEN Owin_User.IsEmailConfirmed END DESC,
						CASE WHEN @SortExpression ='EmailConfirmationByUserDate ASC' THEN Owin_User.EmailConfirmationByUserDate END ASC,
						CASE WHEN @SortExpression ='EmailConfirmationByUserDate DESC' THEN Owin_User.EmailConfirmationByUserDate END DESC,
						CASE WHEN @SortExpression ='TwoFactorEnable ASC' THEN Owin_User.TwoFactorEnable END ASC,
						CASE WHEN @SortExpression ='TwoFactorEnable DESC' THEN Owin_User.TwoFactorEnable END DESC,
						CASE WHEN @SortExpression ='IsMobileNumberConfirmed ASC' THEN Owin_User.IsMobileNumberConfirmed END ASC,
						CASE WHEN @SortExpression ='IsMobileNumberConfirmed DESC' THEN Owin_User.IsMobileNumberConfirmed END DESC,
						CASE WHEN @SortExpression ='MobileNumberConfirmedByUserDate ASC' THEN Owin_User.MobileNumberConfirmedByUserDate END ASC,
						CASE WHEN @SortExpression ='MobileNumberConfirmedByUserDate DESC' THEN Owin_User.MobileNumberConfirmedByUserDate END DESC,
						CASE WHEN @SortExpression ='SecurityStamp ASC' THEN Owin_User.SecurityStamp END ASC,
						CASE WHEN @SortExpression ='SecurityStamp DESC' THEN Owin_User.SecurityStamp END DESC,
						CASE WHEN @SortExpression ='ConcurrencyStamp ASC' THEN Owin_User.ConcurrencyStamp END ASC,
						CASE WHEN @SortExpression ='ConcurrencyStamp DESC' THEN Owin_User.ConcurrencyStamp END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_User.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_User.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_User.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_User.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_User.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_User.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_User.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_User.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_User.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_User.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_User.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_User.IPAddress END DESC
				) as RowNumber
		FROM Owin_User 
		where
			(CASE WHEN @ApplicationId is NULL THEN 1 WHEN Owin_User.ApplicationId  = @ApplicationId THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserId is NULL THEN 1 WHEN Owin_User.UserId  = @UserId THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MasterUserID is NULL THEN 1 WHEN Owin_User.MasterUserID  = @MasterUserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserName is NULL THEN 1 WHEN Owin_User.UserName  = @UserName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @EmailAddress is NULL THEN 1 WHEN Owin_User.EmailAddress  = @EmailAddress THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LoweredUserName is NULL THEN 1 WHEN Owin_User.LoweredUserName  = @LoweredUserName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MobileNumber is NULL THEN 1 WHEN Owin_User.MobileNumber  = @MobileNumber THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserProfilePhoto is NULL THEN 1 WHEN Owin_User.UserProfilePhoto  = @UserProfilePhoto THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsAnonymous is NULL THEN 1 WHEN Owin_User.IsAnonymous  = @IsAnonymous THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsChildEnable is NULL THEN 1 WHEN Owin_User.IsChildEnable  = @IsChildEnable THEN 1 ELSE 0 END = 1)
			
			
			
			
			
			
			AND (CASE WHEN @MobilePIN is NULL THEN 1 WHEN Owin_User.MobilePIN  = @MobilePIN THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @PasswordQuestion is NULL THEN 1 WHEN Owin_User.PasswordQuestion  = @PasswordQuestion THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @PasswordAnswer is NULL THEN 1 WHEN Owin_User.PasswordAnswer  = @PasswordAnswer THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Approved is NULL THEN 1 WHEN Owin_User.Approved  = @Approved THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Locked is NULL THEN 1 WHEN Owin_User.Locked  = @Locked THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LastLoginDate is NULL THEN 1 WHEN Owin_User.LastLoginDate  = @LastLoginDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LastPassChangedDate is NULL THEN 1 WHEN Owin_User.LastPassChangedDate  = @LastPassChangedDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LastLockoutDate is NULL THEN 1 WHEN Owin_User.LastLockoutDate  = @LastLockoutDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FailedPasswordAttemptCount is NULL THEN 1 WHEN Owin_User.FailedPasswordAttemptCount  = @FailedPasswordAttemptCount THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @LastActivityDate is NULL THEN 1 WHEN Owin_User.LastActivityDate  = @LastActivityDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsReviewed is NULL THEN 1 WHEN Owin_User.IsReviewed  = @IsReviewed THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ReviewedBy is NULL THEN 1 WHEN Owin_User.ReviewedBy  = @ReviewedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ReviewedByUserName is NULL THEN 1 WHEN Owin_User.ReviewedByUserName  = @ReviewedByUserName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ReviewedDate is NULL THEN 1 WHEN Owin_User.ReviewedDate  = @ReviewedDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsApproved is NULL THEN 1 WHEN Owin_User.IsApproved  = @IsApproved THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ApprovedBy is NULL THEN 1 WHEN Owin_User.ApprovedBy  = @ApprovedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ApprovedByUserName is NULL THEN 1 WHEN Owin_User.ApprovedByUserName  = @ApprovedByUserName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ApprovedDate is NULL THEN 1 WHEN Owin_User.ApprovedDate  = @ApprovedDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsEmailConfirmed is NULL THEN 1 WHEN Owin_User.IsEmailConfirmed  = @IsEmailConfirmed THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @EmailConfirmationByUserDate is NULL THEN 1 WHEN Owin_User.EmailConfirmationByUserDate  = @EmailConfirmationByUserDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TwoFactorEnable is NULL THEN 1 WHEN Owin_User.TwoFactorEnable  = @TwoFactorEnable THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsMobileNumberConfirmed is NULL THEN 1 WHEN Owin_User.IsMobileNumberConfirmed  = @IsMobileNumberConfirmed THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MobileNumberConfirmedByUserDate is NULL THEN 1 WHEN Owin_User.MobileNumberConfirmedByUserDate  = @MobileNumberConfirmedByUserDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @SecurityStamp is NULL THEN 1 WHEN Owin_User.SecurityStamp  = @SecurityStamp THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ConcurrencyStamp is NULL THEN 1 WHEN Owin_User.ConcurrencyStamp  = @ConcurrencyStamp THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_User.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_User.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
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
CREATE PROCEDURE owin_user_GAPg 
		@ApplicationId uniqueidentifier  = NULL,
		@UserId uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@UserName nvarchar (256) = NULL,
		@EmailAddress nvarchar (150) = NULL,
		@LoweredUserName nvarchar (256) = NULL,
		@MobileNumber nvarchar (16) = NULL,
		@UserProfilePhoto nvarchar (250) = NULL,
		@IsAnonymous bit  = NULL,
		@IsChildEnable bit  = NULL,
		@MasPrivateKey nvarchar (1000) = NULL,
		@MasPublicKey nvarchar (1000) = NULL,
		@Password nvarchar (500) = NULL,
		@PasswordSalt nvarchar (500) = NULL,
		@PasswordKey nvarchar (500) = NULL,
		@PasswordVector nvarchar (500) = NULL,
		@MobilePIN nvarchar (16) = NULL,
		@PasswordQuestion nvarchar (256) = NULL,
		@PasswordAnswer nvarchar (128) = NULL,
		@Approved bit  = NULL,
		@Locked bit  = NULL,
		@LastLoginDate datetime  = NULL,
		@LastPassChangedDate datetime  = NULL,
		@LastLockoutDate datetime  = NULL,
		@FailedPasswordAttemptCount int  = NULL,
		@Comment nvarchar (550) = NULL,
		@LastActivityDate datetime  = NULL,
		@IsReviewed bit  = NULL,
		@ReviewedBy bigint  = NULL,
		@ReviewedByUserName nvarchar (150) = NULL,
		@ReviewedDate datetime  = NULL,
		@IsApproved bit  = NULL,
		@ApprovedBy bigint  = NULL,
		@ApprovedByUserName nvarchar (150) = NULL,
		@ApprovedDate datetime  = NULL,
		@IsEmailConfirmed bit  = NULL,
		@EmailConfirmationByUserDate datetime  = NULL,
		@TwoFactorEnable bit  = NULL,
		@IsMobileNumberConfirmed bit  = NULL,
		@MobileNumberConfirmedByUserDate datetime  = NULL,
		@SecurityStamp nvarchar (MAX) = NULL,
		@ConcurrencyStamp nvarchar (MAX) = NULL,
		    
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
					owin_user
				WHERE 
					(CASE WHEN @ApplicationId is NULL THEN 1 WHEN Owin_User.ApplicationId  = @ApplicationId THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UserId is NULL THEN 1 WHEN Owin_User.UserId  = @UserId THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @MasterUserID is NULL THEN 1 WHEN Owin_User.MasterUserID  = @MasterUserID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UserName is NULL THEN 1 WHEN Owin_User.UserName  = @UserName THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @EmailAddress is NULL THEN 1 WHEN Owin_User.EmailAddress  = @EmailAddress THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @LoweredUserName is NULL THEN 1 WHEN Owin_User.LoweredUserName  = @LoweredUserName THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @MobileNumber is NULL THEN 1 WHEN Owin_User.MobileNumber  = @MobileNumber THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UserProfilePhoto is NULL THEN 1 WHEN Owin_User.UserProfilePhoto  = @UserProfilePhoto THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @IsAnonymous is NULL THEN 1 WHEN Owin_User.IsAnonymous  = @IsAnonymous THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @IsChildEnable is NULL THEN 1 WHEN Owin_User.IsChildEnable  = @IsChildEnable THEN 1 ELSE 0 END = 1)
					
					
					
					
					
					
					AND (CASE WHEN @MobilePIN is NULL THEN 1 WHEN Owin_User.MobilePIN  = @MobilePIN THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @PasswordQuestion is NULL THEN 1 WHEN Owin_User.PasswordQuestion  = @PasswordQuestion THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @PasswordAnswer is NULL THEN 1 WHEN Owin_User.PasswordAnswer  = @PasswordAnswer THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @Approved is NULL THEN 1 WHEN Owin_User.Approved  = @Approved THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @Locked is NULL THEN 1 WHEN Owin_User.Locked  = @Locked THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @LastLoginDate is NULL THEN 1 WHEN Owin_User.LastLoginDate  = @LastLoginDate THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @LastPassChangedDate is NULL THEN 1 WHEN Owin_User.LastPassChangedDate  = @LastPassChangedDate THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @LastLockoutDate is NULL THEN 1 WHEN Owin_User.LastLockoutDate  = @LastLockoutDate THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @FailedPasswordAttemptCount is NULL THEN 1 WHEN Owin_User.FailedPasswordAttemptCount  = @FailedPasswordAttemptCount THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @LastActivityDate is NULL THEN 1 WHEN Owin_User.LastActivityDate  = @LastActivityDate THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @IsReviewed is NULL THEN 1 WHEN Owin_User.IsReviewed  = @IsReviewed THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ReviewedBy is NULL THEN 1 WHEN Owin_User.ReviewedBy  = @ReviewedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ReviewedByUserName is NULL THEN 1 WHEN Owin_User.ReviewedByUserName  = @ReviewedByUserName THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ReviewedDate is NULL THEN 1 WHEN Owin_User.ReviewedDate  = @ReviewedDate THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @IsApproved is NULL THEN 1 WHEN Owin_User.IsApproved  = @IsApproved THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ApprovedBy is NULL THEN 1 WHEN Owin_User.ApprovedBy  = @ApprovedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ApprovedByUserName is NULL THEN 1 WHEN Owin_User.ApprovedByUserName  = @ApprovedByUserName THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ApprovedDate is NULL THEN 1 WHEN Owin_User.ApprovedDate  = @ApprovedDate THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @IsEmailConfirmed is NULL THEN 1 WHEN Owin_User.IsEmailConfirmed  = @IsEmailConfirmed THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @EmailConfirmationByUserDate is NULL THEN 1 WHEN Owin_User.EmailConfirmationByUserDate  = @EmailConfirmationByUserDate THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TwoFactorEnable is NULL THEN 1 WHEN Owin_User.TwoFactorEnable  = @TwoFactorEnable THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @IsMobileNumberConfirmed is NULL THEN 1 WHEN Owin_User.IsMobileNumberConfirmed  = @IsMobileNumberConfirmed THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @MobileNumberConfirmedByUserDate is NULL THEN 1 WHEN Owin_User.MobileNumberConfirmedByUserDate  = @MobileNumberConfirmedByUserDate THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @SecurityStamp is NULL THEN 1 WHEN Owin_User.SecurityStamp  = @SecurityStamp THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ConcurrencyStamp is NULL THEN 1 WHEN Owin_User.ConcurrencyStamp  = @ConcurrencyStamp THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_User.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_User.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
					
					
					
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_user AS
			(
				  SELECT 
			Owin_User.ApplicationId,
			Owin_User.UserId,
			Owin_User.MasterUserID,
			Owin_User.UserName,
			Owin_User.EmailAddress,
			Owin_User.LoweredUserName,
			Owin_User.MobileNumber,
			Owin_User.UserProfilePhoto,
			Owin_User.IsAnonymous,
			Owin_User.IsChildEnable,
			Owin_User.MasPrivateKey,
			Owin_User.MasPublicKey,
			Owin_User.Password,
			Owin_User.PasswordSalt,
			Owin_User.PasswordKey,
			Owin_User.PasswordVector,
			Owin_User.MobilePIN,
			Owin_User.PasswordQuestion,
			Owin_User.PasswordAnswer,
			Owin_User.Approved,
			Owin_User.Locked,
			Owin_User.LastLoginDate,
			Owin_User.LastPassChangedDate,
			Owin_User.LastLockoutDate,
			Owin_User.FailedPasswordAttemptCount,
			Owin_User.Comment,
			Owin_User.LastActivityDate,
			Owin_User.IsReviewed,
			Owin_User.ReviewedBy,
			Owin_User.ReviewedByUserName,
			Owin_User.ReviewedDate,
			Owin_User.IsApproved,
			Owin_User.ApprovedBy,
			Owin_User.ApprovedByUserName,
			Owin_User.ApprovedDate,
			Owin_User.IsEmailConfirmed,
			Owin_User.EmailConfirmationByUserDate,
			Owin_User.TwoFactorEnable,
			Owin_User.IsMobileNumberConfirmed,
			Owin_User.MobileNumberConfirmedByUserDate,
			Owin_User.SecurityStamp,
			Owin_User.ConcurrencyStamp,
			Owin_User.TransID,
			Owin_User.CreatedByUserName,
			Owin_User.CreatedDate,
			Owin_User.UpdatedByUserName,
			Owin_User.UpdatedDate,
			Owin_User.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='ApplicationId ASC' THEN Owin_User.ApplicationId END ASC,
						CASE WHEN @SortExpression ='ApplicationId DESC' THEN Owin_User.ApplicationId END DESC,
						CASE WHEN @SortExpression ='UserId ASC' THEN Owin_User.UserId END ASC,
						CASE WHEN @SortExpression ='UserId DESC' THEN Owin_User.UserId END DESC,
						CASE WHEN @SortExpression ='MasterUserID ASC' THEN Owin_User.MasterUserID END ASC,
						CASE WHEN @SortExpression ='MasterUserID DESC' THEN Owin_User.MasterUserID END DESC,
						CASE WHEN @SortExpression ='UserName ASC' THEN Owin_User.UserName END ASC,
						CASE WHEN @SortExpression ='UserName DESC' THEN Owin_User.UserName END DESC,
						CASE WHEN @SortExpression ='EmailAddress ASC' THEN Owin_User.EmailAddress END ASC,
						CASE WHEN @SortExpression ='EmailAddress DESC' THEN Owin_User.EmailAddress END DESC,
						CASE WHEN @SortExpression ='LoweredUserName ASC' THEN Owin_User.LoweredUserName END ASC,
						CASE WHEN @SortExpression ='LoweredUserName DESC' THEN Owin_User.LoweredUserName END DESC,
						CASE WHEN @SortExpression ='MobileNumber ASC' THEN Owin_User.MobileNumber END ASC,
						CASE WHEN @SortExpression ='MobileNumber DESC' THEN Owin_User.MobileNumber END DESC,
						CASE WHEN @SortExpression ='UserProfilePhoto ASC' THEN Owin_User.UserProfilePhoto END ASC,
						CASE WHEN @SortExpression ='UserProfilePhoto DESC' THEN Owin_User.UserProfilePhoto END DESC,
						CASE WHEN @SortExpression ='IsAnonymous ASC' THEN Owin_User.IsAnonymous END ASC,
						CASE WHEN @SortExpression ='IsAnonymous DESC' THEN Owin_User.IsAnonymous END DESC,
						CASE WHEN @SortExpression ='IsChildEnable ASC' THEN Owin_User.IsChildEnable END ASC,
						CASE WHEN @SortExpression ='IsChildEnable DESC' THEN Owin_User.IsChildEnable END DESC,
						CASE WHEN @SortExpression ='MobilePIN ASC' THEN Owin_User.MobilePIN END ASC,
						CASE WHEN @SortExpression ='MobilePIN DESC' THEN Owin_User.MobilePIN END DESC,
						CASE WHEN @SortExpression ='PasswordQuestion ASC' THEN Owin_User.PasswordQuestion END ASC,
						CASE WHEN @SortExpression ='PasswordQuestion DESC' THEN Owin_User.PasswordQuestion END DESC,
						CASE WHEN @SortExpression ='PasswordAnswer ASC' THEN Owin_User.PasswordAnswer END ASC,
						CASE WHEN @SortExpression ='PasswordAnswer DESC' THEN Owin_User.PasswordAnswer END DESC,
						CASE WHEN @SortExpression ='Approved ASC' THEN Owin_User.Approved END ASC,
						CASE WHEN @SortExpression ='Approved DESC' THEN Owin_User.Approved END DESC,
						CASE WHEN @SortExpression ='Locked ASC' THEN Owin_User.Locked END ASC,
						CASE WHEN @SortExpression ='Locked DESC' THEN Owin_User.Locked END DESC,
						CASE WHEN @SortExpression ='LastLoginDate ASC' THEN Owin_User.LastLoginDate END ASC,
						CASE WHEN @SortExpression ='LastLoginDate DESC' THEN Owin_User.LastLoginDate END DESC,
						CASE WHEN @SortExpression ='LastPassChangedDate ASC' THEN Owin_User.LastPassChangedDate END ASC,
						CASE WHEN @SortExpression ='LastPassChangedDate DESC' THEN Owin_User.LastPassChangedDate END DESC,
						CASE WHEN @SortExpression ='LastLockoutDate ASC' THEN Owin_User.LastLockoutDate END ASC,
						CASE WHEN @SortExpression ='LastLockoutDate DESC' THEN Owin_User.LastLockoutDate END DESC,
						CASE WHEN @SortExpression ='FailedPasswordAttemptCount ASC' THEN Owin_User.FailedPasswordAttemptCount END ASC,
						CASE WHEN @SortExpression ='FailedPasswordAttemptCount DESC' THEN Owin_User.FailedPasswordAttemptCount END DESC,
						CASE WHEN @SortExpression ='LastActivityDate ASC' THEN Owin_User.LastActivityDate END ASC,
						CASE WHEN @SortExpression ='LastActivityDate DESC' THEN Owin_User.LastActivityDate END DESC,
						CASE WHEN @SortExpression ='IsReviewed ASC' THEN Owin_User.IsReviewed END ASC,
						CASE WHEN @SortExpression ='IsReviewed DESC' THEN Owin_User.IsReviewed END DESC,
						CASE WHEN @SortExpression ='ReviewedBy ASC' THEN Owin_User.ReviewedBy END ASC,
						CASE WHEN @SortExpression ='ReviewedBy DESC' THEN Owin_User.ReviewedBy END DESC,
						CASE WHEN @SortExpression ='ReviewedByUserName ASC' THEN Owin_User.ReviewedByUserName END ASC,
						CASE WHEN @SortExpression ='ReviewedByUserName DESC' THEN Owin_User.ReviewedByUserName END DESC,
						CASE WHEN @SortExpression ='ReviewedDate ASC' THEN Owin_User.ReviewedDate END ASC,
						CASE WHEN @SortExpression ='ReviewedDate DESC' THEN Owin_User.ReviewedDate END DESC,
						CASE WHEN @SortExpression ='IsApproved ASC' THEN Owin_User.IsApproved END ASC,
						CASE WHEN @SortExpression ='IsApproved DESC' THEN Owin_User.IsApproved END DESC,
						CASE WHEN @SortExpression ='ApprovedBy ASC' THEN Owin_User.ApprovedBy END ASC,
						CASE WHEN @SortExpression ='ApprovedBy DESC' THEN Owin_User.ApprovedBy END DESC,
						CASE WHEN @SortExpression ='ApprovedByUserName ASC' THEN Owin_User.ApprovedByUserName END ASC,
						CASE WHEN @SortExpression ='ApprovedByUserName DESC' THEN Owin_User.ApprovedByUserName END DESC,
						CASE WHEN @SortExpression ='ApprovedDate ASC' THEN Owin_User.ApprovedDate END ASC,
						CASE WHEN @SortExpression ='ApprovedDate DESC' THEN Owin_User.ApprovedDate END DESC,
						CASE WHEN @SortExpression ='IsEmailConfirmed ASC' THEN Owin_User.IsEmailConfirmed END ASC,
						CASE WHEN @SortExpression ='IsEmailConfirmed DESC' THEN Owin_User.IsEmailConfirmed END DESC,
						CASE WHEN @SortExpression ='EmailConfirmationByUserDate ASC' THEN Owin_User.EmailConfirmationByUserDate END ASC,
						CASE WHEN @SortExpression ='EmailConfirmationByUserDate DESC' THEN Owin_User.EmailConfirmationByUserDate END DESC,
						CASE WHEN @SortExpression ='TwoFactorEnable ASC' THEN Owin_User.TwoFactorEnable END ASC,
						CASE WHEN @SortExpression ='TwoFactorEnable DESC' THEN Owin_User.TwoFactorEnable END DESC,
						CASE WHEN @SortExpression ='IsMobileNumberConfirmed ASC' THEN Owin_User.IsMobileNumberConfirmed END ASC,
						CASE WHEN @SortExpression ='IsMobileNumberConfirmed DESC' THEN Owin_User.IsMobileNumberConfirmed END DESC,
						CASE WHEN @SortExpression ='MobileNumberConfirmedByUserDate ASC' THEN Owin_User.MobileNumberConfirmedByUserDate END ASC,
						CASE WHEN @SortExpression ='MobileNumberConfirmedByUserDate DESC' THEN Owin_User.MobileNumberConfirmedByUserDate END DESC,
						CASE WHEN @SortExpression ='SecurityStamp ASC' THEN Owin_User.SecurityStamp END ASC,
						CASE WHEN @SortExpression ='SecurityStamp DESC' THEN Owin_User.SecurityStamp END DESC,
						CASE WHEN @SortExpression ='ConcurrencyStamp ASC' THEN Owin_User.ConcurrencyStamp END ASC,
						CASE WHEN @SortExpression ='ConcurrencyStamp DESC' THEN Owin_User.ConcurrencyStamp END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_User.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_User.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_User.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_User.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_User.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_User.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_User.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_User.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_User.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_User.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_User.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_User.IPAddress END DESC
				) as RowNumber
		FROM Owin_User 
		where
			(CASE WHEN @ApplicationId is NULL THEN 1 WHEN Owin_User.ApplicationId  = @ApplicationId THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserId is NULL THEN 1 WHEN Owin_User.UserId  = @UserId THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MasterUserID is NULL THEN 1 WHEN Owin_User.MasterUserID  = @MasterUserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserName is NULL THEN 1 WHEN Owin_User.UserName  = @UserName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @EmailAddress is NULL THEN 1 WHEN Owin_User.EmailAddress  = @EmailAddress THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LoweredUserName is NULL THEN 1 WHEN Owin_User.LoweredUserName  = @LoweredUserName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MobileNumber is NULL THEN 1 WHEN Owin_User.MobileNumber  = @MobileNumber THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserProfilePhoto is NULL THEN 1 WHEN Owin_User.UserProfilePhoto  = @UserProfilePhoto THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsAnonymous is NULL THEN 1 WHEN Owin_User.IsAnonymous  = @IsAnonymous THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsChildEnable is NULL THEN 1 WHEN Owin_User.IsChildEnable  = @IsChildEnable THEN 1 ELSE 0 END = 1)
			
			
			
			
			
			
			AND (CASE WHEN @MobilePIN is NULL THEN 1 WHEN Owin_User.MobilePIN  = @MobilePIN THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @PasswordQuestion is NULL THEN 1 WHEN Owin_User.PasswordQuestion  = @PasswordQuestion THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @PasswordAnswer is NULL THEN 1 WHEN Owin_User.PasswordAnswer  = @PasswordAnswer THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Approved is NULL THEN 1 WHEN Owin_User.Approved  = @Approved THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Locked is NULL THEN 1 WHEN Owin_User.Locked  = @Locked THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LastLoginDate is NULL THEN 1 WHEN Owin_User.LastLoginDate  = @LastLoginDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LastPassChangedDate is NULL THEN 1 WHEN Owin_User.LastPassChangedDate  = @LastPassChangedDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LastLockoutDate is NULL THEN 1 WHEN Owin_User.LastLockoutDate  = @LastLockoutDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FailedPasswordAttemptCount is NULL THEN 1 WHEN Owin_User.FailedPasswordAttemptCount  = @FailedPasswordAttemptCount THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @LastActivityDate is NULL THEN 1 WHEN Owin_User.LastActivityDate  = @LastActivityDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsReviewed is NULL THEN 1 WHEN Owin_User.IsReviewed  = @IsReviewed THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ReviewedBy is NULL THEN 1 WHEN Owin_User.ReviewedBy  = @ReviewedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ReviewedByUserName is NULL THEN 1 WHEN Owin_User.ReviewedByUserName  = @ReviewedByUserName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ReviewedDate is NULL THEN 1 WHEN Owin_User.ReviewedDate  = @ReviewedDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsApproved is NULL THEN 1 WHEN Owin_User.IsApproved  = @IsApproved THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ApprovedBy is NULL THEN 1 WHEN Owin_User.ApprovedBy  = @ApprovedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ApprovedByUserName is NULL THEN 1 WHEN Owin_User.ApprovedByUserName  = @ApprovedByUserName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ApprovedDate is NULL THEN 1 WHEN Owin_User.ApprovedDate  = @ApprovedDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsEmailConfirmed is NULL THEN 1 WHEN Owin_User.IsEmailConfirmed  = @IsEmailConfirmed THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @EmailConfirmationByUserDate is NULL THEN 1 WHEN Owin_User.EmailConfirmationByUserDate  = @EmailConfirmationByUserDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TwoFactorEnable is NULL THEN 1 WHEN Owin_User.TwoFactorEnable  = @TwoFactorEnable THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsMobileNumberConfirmed is NULL THEN 1 WHEN Owin_User.IsMobileNumberConfirmed  = @IsMobileNumberConfirmed THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MobileNumberConfirmedByUserDate is NULL THEN 1 WHEN Owin_User.MobileNumberConfirmedByUserDate  = @MobileNumberConfirmedByUserDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @SecurityStamp is NULL THEN 1 WHEN Owin_User.SecurityStamp  = @SecurityStamp THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ConcurrencyStamp is NULL THEN 1 WHEN Owin_User.ConcurrencyStamp  = @ConcurrencyStamp THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_User.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_User.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
			)
			SELECT * 
			FROM  tempPagedowin_user
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
CREATE PROCEDURE owin_userclaims_Ins 
		@Id int  = NULL,
		@ClaimType nvarchar (MAX) = NULL,
		@ClaimValue nvarchar (MAX) = NULL,
		@UserId uniqueidentifier  = NULL,
		        
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
		
        
		INSERT INTO Owin_UserClaims (
			ClaimType,
			ClaimValue,
			UserId,
			TransID,
			CreatedByUserName,
			CreatedDate,
  			IPAddress
		)
		VALUES (
			@ClaimType,
			@ClaimValue,
			@UserId,
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
CREATE PROCEDURE owin_userclaims_Upd
		@Id int  = NULL,
		@ClaimType nvarchar (MAX) = NULL,
		@ClaimValue nvarchar (MAX) = NULL,
		@UserId uniqueidentifier  = NULL,
		        
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
		UPDATE Owin_UserClaims
		SET
			ClaimType = @ClaimType,
			ClaimValue = @ClaimValue,
			UserId = @UserId,
			TransID = @TransID,
			UpdatedByUserName = @UpdatedByUserName,
			UpdatedDate = @UpdatedDate,
			IPAddress = @IPAddress
		WHERE
			Id = @Id
    SET @RETURN_KEY =@Id
		    
	END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/	
CREATE PROCEDURE owin_userclaims_Del		        
		@Id int  = NULL,
		@ClaimType nvarchar (MAX) = NULL,
		@ClaimValue nvarchar (MAX) = NULL,
		@UserId uniqueidentifier  = NULL,
		        
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
		DELETE FROM Owin_UserClaims
		WHERE 
			Id = @Id
		
    SET @RETURN_KEY =@Id
		
		
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
CREATE PROCEDURE owin_userclaims_GA 
		@Id int  = NULL,
		@ClaimType nvarchar (MAX) = NULL,
		@ClaimValue nvarchar (MAX) = NULL,
		@UserId uniqueidentifier  = NULL,
		    
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
			Owin_UserClaims.Id,
			Owin_UserClaims.ClaimType,
			Owin_UserClaims.ClaimValue,
			Owin_UserClaims.UserId,
			Owin_UserClaims.TransID,
			Owin_UserClaims.CreatedByUserName,
			Owin_UserClaims.CreatedDate,
			Owin_UserClaims.UpdatedByUserName,
			Owin_UserClaims.UpdatedDate,
			Owin_UserClaims.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='Id ASC' THEN Owin_UserClaims.Id END ASC,
						CASE WHEN @SortExpression ='Id DESC' THEN Owin_UserClaims.Id END DESC,
						CASE WHEN @SortExpression ='ClaimType ASC' THEN Owin_UserClaims.ClaimType END ASC,
						CASE WHEN @SortExpression ='ClaimType DESC' THEN Owin_UserClaims.ClaimType END DESC,
						CASE WHEN @SortExpression ='ClaimValue ASC' THEN Owin_UserClaims.ClaimValue END ASC,
						CASE WHEN @SortExpression ='ClaimValue DESC' THEN Owin_UserClaims.ClaimValue END DESC,
						CASE WHEN @SortExpression ='UserId ASC' THEN Owin_UserClaims.UserId END ASC,
						CASE WHEN @SortExpression ='UserId DESC' THEN Owin_UserClaims.UserId END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_UserClaims.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_UserClaims.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_UserClaims.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_UserClaims.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_UserClaims.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_UserClaims.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_UserClaims.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_UserClaims.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_UserClaims.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_UserClaims.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_UserClaims.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_UserClaims.IPAddress END DESC
				) as RowNumber
		FROM Owin_UserClaims 
		where
			(CASE WHEN @Id is NULL THEN 1 WHEN Owin_UserClaims.Id  = @Id THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ClaimType is NULL THEN 1 WHEN Owin_UserClaims.ClaimType  = @ClaimType THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ClaimValue is NULL THEN 1 WHEN Owin_UserClaims.ClaimValue  = @ClaimValue THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserId is NULL THEN 1 WHEN Owin_UserClaims.UserId  = @UserId THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_UserClaims.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_UserClaims.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
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
CREATE PROCEDURE owin_userclaims_GAPg 
		@Id int  = NULL,
		@ClaimType nvarchar (MAX) = NULL,
		@ClaimValue nvarchar (MAX) = NULL,
		@UserId uniqueidentifier  = NULL,
		    
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
					owin_userclaims
				WHERE 
					(CASE WHEN @Id is NULL THEN 1 WHEN Owin_UserClaims.Id  = @Id THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ClaimType is NULL THEN 1 WHEN Owin_UserClaims.ClaimType  = @ClaimType THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ClaimValue is NULL THEN 1 WHEN Owin_UserClaims.ClaimValue  = @ClaimValue THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UserId is NULL THEN 1 WHEN Owin_UserClaims.UserId  = @UserId THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_UserClaims.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_UserClaims.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
					
					
					
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_userclaims AS
			(
				  SELECT 
			Owin_UserClaims.Id,
			Owin_UserClaims.ClaimType,
			Owin_UserClaims.ClaimValue,
			Owin_UserClaims.UserId,
			Owin_UserClaims.TransID,
			Owin_UserClaims.CreatedByUserName,
			Owin_UserClaims.CreatedDate,
			Owin_UserClaims.UpdatedByUserName,
			Owin_UserClaims.UpdatedDate,
			Owin_UserClaims.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='Id ASC' THEN Owin_UserClaims.Id END ASC,
						CASE WHEN @SortExpression ='Id DESC' THEN Owin_UserClaims.Id END DESC,
						CASE WHEN @SortExpression ='ClaimType ASC' THEN Owin_UserClaims.ClaimType END ASC,
						CASE WHEN @SortExpression ='ClaimType DESC' THEN Owin_UserClaims.ClaimType END DESC,
						CASE WHEN @SortExpression ='ClaimValue ASC' THEN Owin_UserClaims.ClaimValue END ASC,
						CASE WHEN @SortExpression ='ClaimValue DESC' THEN Owin_UserClaims.ClaimValue END DESC,
						CASE WHEN @SortExpression ='UserId ASC' THEN Owin_UserClaims.UserId END ASC,
						CASE WHEN @SortExpression ='UserId DESC' THEN Owin_UserClaims.UserId END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_UserClaims.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_UserClaims.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_UserClaims.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_UserClaims.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_UserClaims.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_UserClaims.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_UserClaims.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_UserClaims.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_UserClaims.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_UserClaims.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_UserClaims.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_UserClaims.IPAddress END DESC
				) as RowNumber
		FROM Owin_UserClaims 
		where
			(CASE WHEN @Id is NULL THEN 1 WHEN Owin_UserClaims.Id  = @Id THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ClaimType is NULL THEN 1 WHEN Owin_UserClaims.ClaimType  = @ClaimType THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ClaimValue is NULL THEN 1 WHEN Owin_UserClaims.ClaimValue  = @ClaimValue THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserId is NULL THEN 1 WHEN Owin_UserClaims.UserId  = @UserId THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_UserClaims.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_UserClaims.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
			)
			SELECT * 
			FROM  tempPagedowin_userclaims
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
CREATE PROCEDURE owin_userlogintrail_Ins 
		@SerialNo bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@LoginFrom varchar (150) = NULL,
		@LoginDate datetime  = NULL,
		@LogoutDate datetime  = NULL,
		@MachineIP varchar (150) = NULL,
		@LoginStatus varchar (150) = NULL,
		@LoginStatusBit bit  = NULL,
		@SessionID varchar (150) = NULL,
		@UserToken varchar (250) = NULL,
		        
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
		
        
		INSERT INTO Owin_UserLoginTrail (
			UserID,
			MasterUserID,
			LoginFrom,
			LoginDate,
			LogoutDate,
			MachineIP,
			LoginStatus,
			LoginStatusBit,
			SessionID,
			UserToken,
			TransID,
			CreatedByUserName,
			CreatedDate,
  			IPAddress
		)
		VALUES (
			@UserID,
			@MasterUserID,
			@LoginFrom,
			@LoginDate,
			@LogoutDate,
			@MachineIP,
			@LoginStatus,
			@LoginStatusBit,
			@SessionID,
			@UserToken,
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
CREATE PROCEDURE owin_userlogintrail_Upd
		@SerialNo bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@LoginFrom varchar (150) = NULL,
		@LoginDate datetime  = NULL,
		@LogoutDate datetime  = NULL,
		@MachineIP varchar (150) = NULL,
		@LoginStatus varchar (150) = NULL,
		@LoginStatusBit bit  = NULL,
		@SessionID varchar (150) = NULL,
		@UserToken varchar (250) = NULL,
		        
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
		UPDATE Owin_UserLoginTrail
		SET
			UserID = @UserID,
			MasterUserID = @MasterUserID,
			LoginFrom = @LoginFrom,
			LoginDate = @LoginDate,
			LogoutDate = @LogoutDate,
			MachineIP = @MachineIP,
			LoginStatus = @LoginStatus,
			LoginStatusBit = @LoginStatusBit,
			SessionID = @SessionID,
			UserToken = @UserToken,
			TransID = @TransID,
			UpdatedByUserName = @UpdatedByUserName,
			UpdatedDate = @UpdatedDate,
			IPAddress = @IPAddress
		WHERE
			SerialNo = @SerialNo
    SET @RETURN_KEY =@SerialNo
		    
	END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/	
CREATE PROCEDURE owin_userlogintrail_Del		        
		@SerialNo bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@LoginFrom varchar (150) = NULL,
		@LoginDate datetime  = NULL,
		@LogoutDate datetime  = NULL,
		@MachineIP varchar (150) = NULL,
		@LoginStatus varchar (150) = NULL,
		@LoginStatusBit bit  = NULL,
		@SessionID varchar (150) = NULL,
		@UserToken varchar (250) = NULL,
		        
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
		DELETE FROM Owin_UserLoginTrail
		WHERE 
			SerialNo = @SerialNo
		
    SET @RETURN_KEY =@SerialNo
		
		
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
CREATE PROCEDURE owin_userlogintrail_GA 
		@SerialNo bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@LoginFrom varchar (150) = NULL,
		@LoginDate datetime  = NULL,
		@LogoutDate datetime  = NULL,
		@MachineIP varchar (150) = NULL,
		@LoginStatus varchar (150) = NULL,
		@LoginStatusBit bit  = NULL,
		@SessionID varchar (150) = NULL,
		@UserToken varchar (250) = NULL,
		    
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
			Owin_UserLoginTrail.SerialNo,
			Owin_UserLoginTrail.UserID,
			Owin_UserLoginTrail.MasterUserID,
			Owin_UserLoginTrail.LoginFrom,
			Owin_UserLoginTrail.LoginDate,
			Owin_UserLoginTrail.LogoutDate,
			Owin_UserLoginTrail.MachineIP,
			Owin_UserLoginTrail.LoginStatus,
			Owin_UserLoginTrail.LoginStatusBit,
			Owin_UserLoginTrail.SessionID,
			Owin_UserLoginTrail.UserToken,
			Owin_UserLoginTrail.TransID,
			Owin_UserLoginTrail.CreatedByUserName,
			Owin_UserLoginTrail.CreatedDate,
			Owin_UserLoginTrail.UpdatedByUserName,
			Owin_UserLoginTrail.UpdatedDate,
			Owin_UserLoginTrail.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='SerialNo ASC' THEN Owin_UserLoginTrail.SerialNo END ASC,
						CASE WHEN @SortExpression ='SerialNo DESC' THEN Owin_UserLoginTrail.SerialNo END DESC,
						CASE WHEN @SortExpression ='UserID ASC' THEN Owin_UserLoginTrail.UserID END ASC,
						CASE WHEN @SortExpression ='UserID DESC' THEN Owin_UserLoginTrail.UserID END DESC,
						CASE WHEN @SortExpression ='MasterUserID ASC' THEN Owin_UserLoginTrail.MasterUserID END ASC,
						CASE WHEN @SortExpression ='MasterUserID DESC' THEN Owin_UserLoginTrail.MasterUserID END DESC,
						CASE WHEN @SortExpression ='LoginFrom ASC' THEN Owin_UserLoginTrail.LoginFrom END ASC,
						CASE WHEN @SortExpression ='LoginFrom DESC' THEN Owin_UserLoginTrail.LoginFrom END DESC,
						CASE WHEN @SortExpression ='LoginDate ASC' THEN Owin_UserLoginTrail.LoginDate END ASC,
						CASE WHEN @SortExpression ='LoginDate DESC' THEN Owin_UserLoginTrail.LoginDate END DESC,
						CASE WHEN @SortExpression ='LogoutDate ASC' THEN Owin_UserLoginTrail.LogoutDate END ASC,
						CASE WHEN @SortExpression ='LogoutDate DESC' THEN Owin_UserLoginTrail.LogoutDate END DESC,
						CASE WHEN @SortExpression ='MachineIP ASC' THEN Owin_UserLoginTrail.MachineIP END ASC,
						CASE WHEN @SortExpression ='MachineIP DESC' THEN Owin_UserLoginTrail.MachineIP END DESC,
						CASE WHEN @SortExpression ='LoginStatus ASC' THEN Owin_UserLoginTrail.LoginStatus END ASC,
						CASE WHEN @SortExpression ='LoginStatus DESC' THEN Owin_UserLoginTrail.LoginStatus END DESC,
						CASE WHEN @SortExpression ='LoginStatusBit ASC' THEN Owin_UserLoginTrail.LoginStatusBit END ASC,
						CASE WHEN @SortExpression ='LoginStatusBit DESC' THEN Owin_UserLoginTrail.LoginStatusBit END DESC,
						CASE WHEN @SortExpression ='SessionID ASC' THEN Owin_UserLoginTrail.SessionID END ASC,
						CASE WHEN @SortExpression ='SessionID DESC' THEN Owin_UserLoginTrail.SessionID END DESC,
						CASE WHEN @SortExpression ='UserToken ASC' THEN Owin_UserLoginTrail.UserToken END ASC,
						CASE WHEN @SortExpression ='UserToken DESC' THEN Owin_UserLoginTrail.UserToken END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_UserLoginTrail.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_UserLoginTrail.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_UserLoginTrail.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_UserLoginTrail.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_UserLoginTrail.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_UserLoginTrail.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_UserLoginTrail.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_UserLoginTrail.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_UserLoginTrail.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_UserLoginTrail.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_UserLoginTrail.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_UserLoginTrail.IPAddress END DESC
				) as RowNumber
		FROM Owin_UserLoginTrail 
		where
			(CASE WHEN @SerialNo is NULL THEN 1 WHEN Owin_UserLoginTrail.SerialNo  = @SerialNo THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserID is NULL THEN 1 WHEN Owin_UserLoginTrail.UserID  = @UserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MasterUserID is NULL THEN 1 WHEN Owin_UserLoginTrail.MasterUserID  = @MasterUserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LoginFrom is NULL THEN 1 WHEN Owin_UserLoginTrail.LoginFrom  = @LoginFrom THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LoginDate is NULL THEN 1 WHEN Owin_UserLoginTrail.LoginDate  = @LoginDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LogoutDate is NULL THEN 1 WHEN Owin_UserLoginTrail.LogoutDate  = @LogoutDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MachineIP is NULL THEN 1 WHEN Owin_UserLoginTrail.MachineIP  = @MachineIP THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LoginStatus is NULL THEN 1 WHEN Owin_UserLoginTrail.LoginStatus  = @LoginStatus THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LoginStatusBit is NULL THEN 1 WHEN Owin_UserLoginTrail.LoginStatusBit  = @LoginStatusBit THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @SessionID is NULL THEN 1 WHEN Owin_UserLoginTrail.SessionID  = @SessionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserToken is NULL THEN 1 WHEN Owin_UserLoginTrail.UserToken  = @UserToken THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_UserLoginTrail.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_UserLoginTrail.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
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
CREATE PROCEDURE owin_userlogintrail_GAPg 
		@SerialNo bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@LoginFrom varchar (150) = NULL,
		@LoginDate datetime  = NULL,
		@LogoutDate datetime  = NULL,
		@MachineIP varchar (150) = NULL,
		@LoginStatus varchar (150) = NULL,
		@LoginStatusBit bit  = NULL,
		@SessionID varchar (150) = NULL,
		@UserToken varchar (250) = NULL,
		    
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
					owin_userlogintrail
				WHERE 
					(CASE WHEN @SerialNo is NULL THEN 1 WHEN Owin_UserLoginTrail.SerialNo  = @SerialNo THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UserID is NULL THEN 1 WHEN Owin_UserLoginTrail.UserID  = @UserID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @MasterUserID is NULL THEN 1 WHEN Owin_UserLoginTrail.MasterUserID  = @MasterUserID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @LoginFrom is NULL THEN 1 WHEN Owin_UserLoginTrail.LoginFrom  = @LoginFrom THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @LoginDate is NULL THEN 1 WHEN Owin_UserLoginTrail.LoginDate  = @LoginDate THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @LogoutDate is NULL THEN 1 WHEN Owin_UserLoginTrail.LogoutDate  = @LogoutDate THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @MachineIP is NULL THEN 1 WHEN Owin_UserLoginTrail.MachineIP  = @MachineIP THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @LoginStatus is NULL THEN 1 WHEN Owin_UserLoginTrail.LoginStatus  = @LoginStatus THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @LoginStatusBit is NULL THEN 1 WHEN Owin_UserLoginTrail.LoginStatusBit  = @LoginStatusBit THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @SessionID is NULL THEN 1 WHEN Owin_UserLoginTrail.SessionID  = @SessionID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UserToken is NULL THEN 1 WHEN Owin_UserLoginTrail.UserToken  = @UserToken THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_UserLoginTrail.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_UserLoginTrail.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
					
					
					
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_userlogintrail AS
			(
				  SELECT 
			Owin_UserLoginTrail.SerialNo,
			Owin_UserLoginTrail.UserID,
			Owin_UserLoginTrail.MasterUserID,
			Owin_UserLoginTrail.LoginFrom,
			Owin_UserLoginTrail.LoginDate,
			Owin_UserLoginTrail.LogoutDate,
			Owin_UserLoginTrail.MachineIP,
			Owin_UserLoginTrail.LoginStatus,
			Owin_UserLoginTrail.LoginStatusBit,
			Owin_UserLoginTrail.SessionID,
			Owin_UserLoginTrail.UserToken,
			Owin_UserLoginTrail.TransID,
			Owin_UserLoginTrail.CreatedByUserName,
			Owin_UserLoginTrail.CreatedDate,
			Owin_UserLoginTrail.UpdatedByUserName,
			Owin_UserLoginTrail.UpdatedDate,
			Owin_UserLoginTrail.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='SerialNo ASC' THEN Owin_UserLoginTrail.SerialNo END ASC,
						CASE WHEN @SortExpression ='SerialNo DESC' THEN Owin_UserLoginTrail.SerialNo END DESC,
						CASE WHEN @SortExpression ='UserID ASC' THEN Owin_UserLoginTrail.UserID END ASC,
						CASE WHEN @SortExpression ='UserID DESC' THEN Owin_UserLoginTrail.UserID END DESC,
						CASE WHEN @SortExpression ='MasterUserID ASC' THEN Owin_UserLoginTrail.MasterUserID END ASC,
						CASE WHEN @SortExpression ='MasterUserID DESC' THEN Owin_UserLoginTrail.MasterUserID END DESC,
						CASE WHEN @SortExpression ='LoginFrom ASC' THEN Owin_UserLoginTrail.LoginFrom END ASC,
						CASE WHEN @SortExpression ='LoginFrom DESC' THEN Owin_UserLoginTrail.LoginFrom END DESC,
						CASE WHEN @SortExpression ='LoginDate ASC' THEN Owin_UserLoginTrail.LoginDate END ASC,
						CASE WHEN @SortExpression ='LoginDate DESC' THEN Owin_UserLoginTrail.LoginDate END DESC,
						CASE WHEN @SortExpression ='LogoutDate ASC' THEN Owin_UserLoginTrail.LogoutDate END ASC,
						CASE WHEN @SortExpression ='LogoutDate DESC' THEN Owin_UserLoginTrail.LogoutDate END DESC,
						CASE WHEN @SortExpression ='MachineIP ASC' THEN Owin_UserLoginTrail.MachineIP END ASC,
						CASE WHEN @SortExpression ='MachineIP DESC' THEN Owin_UserLoginTrail.MachineIP END DESC,
						CASE WHEN @SortExpression ='LoginStatus ASC' THEN Owin_UserLoginTrail.LoginStatus END ASC,
						CASE WHEN @SortExpression ='LoginStatus DESC' THEN Owin_UserLoginTrail.LoginStatus END DESC,
						CASE WHEN @SortExpression ='LoginStatusBit ASC' THEN Owin_UserLoginTrail.LoginStatusBit END ASC,
						CASE WHEN @SortExpression ='LoginStatusBit DESC' THEN Owin_UserLoginTrail.LoginStatusBit END DESC,
						CASE WHEN @SortExpression ='SessionID ASC' THEN Owin_UserLoginTrail.SessionID END ASC,
						CASE WHEN @SortExpression ='SessionID DESC' THEN Owin_UserLoginTrail.SessionID END DESC,
						CASE WHEN @SortExpression ='UserToken ASC' THEN Owin_UserLoginTrail.UserToken END ASC,
						CASE WHEN @SortExpression ='UserToken DESC' THEN Owin_UserLoginTrail.UserToken END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_UserLoginTrail.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_UserLoginTrail.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_UserLoginTrail.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_UserLoginTrail.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_UserLoginTrail.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_UserLoginTrail.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_UserLoginTrail.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_UserLoginTrail.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_UserLoginTrail.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_UserLoginTrail.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_UserLoginTrail.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_UserLoginTrail.IPAddress END DESC
				) as RowNumber
		FROM Owin_UserLoginTrail 
		where
			(CASE WHEN @SerialNo is NULL THEN 1 WHEN Owin_UserLoginTrail.SerialNo  = @SerialNo THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserID is NULL THEN 1 WHEN Owin_UserLoginTrail.UserID  = @UserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MasterUserID is NULL THEN 1 WHEN Owin_UserLoginTrail.MasterUserID  = @MasterUserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LoginFrom is NULL THEN 1 WHEN Owin_UserLoginTrail.LoginFrom  = @LoginFrom THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LoginDate is NULL THEN 1 WHEN Owin_UserLoginTrail.LoginDate  = @LoginDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LogoutDate is NULL THEN 1 WHEN Owin_UserLoginTrail.LogoutDate  = @LogoutDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MachineIP is NULL THEN 1 WHEN Owin_UserLoginTrail.MachineIP  = @MachineIP THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LoginStatus is NULL THEN 1 WHEN Owin_UserLoginTrail.LoginStatus  = @LoginStatus THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LoginStatusBit is NULL THEN 1 WHEN Owin_UserLoginTrail.LoginStatusBit  = @LoginStatusBit THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @SessionID is NULL THEN 1 WHEN Owin_UserLoginTrail.SessionID  = @SessionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserToken is NULL THEN 1 WHEN Owin_UserLoginTrail.UserToken  = @UserToken THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_UserLoginTrail.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_UserLoginTrail.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
			)
			SELECT * 
			FROM  tempPagedowin_userlogintrail
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
CREATE PROCEDURE owin_userpasswordresetinfo_Ins 
		@Serial bigint  = NULL,
		@SessionID varchar (250) = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@SessionToken nvarchar (550) = NULL,
		@UserName nvarchar (150) = NULL,
		@IsActive bit  = NULL,
		        
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
		
        
		INSERT INTO Owin_UserPasswordResetInfo (
			SessionID,
			UserID,
			MasterUserID,
			SessionToken,
			UserName,
			IsActive,
			TransID,
			CreatedByUserName,
			CreatedDate,
  			IPAddress
		)
		VALUES (
			@SessionID,
			@UserID,
			@MasterUserID,
			@SessionToken,
			@UserName,
			@IsActive,
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
CREATE PROCEDURE owin_userpasswordresetinfo_Upd
		@Serial bigint  = NULL,
		@SessionID varchar (250) = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@SessionToken nvarchar (550) = NULL,
		@UserName nvarchar (150) = NULL,
		@IsActive bit  = NULL,
		        
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
		UPDATE Owin_UserPasswordResetInfo
		SET
			SessionID = @SessionID,
			UserID = @UserID,
			MasterUserID = @MasterUserID,
			SessionToken = @SessionToken,
			UserName = @UserName,
			IsActive = @IsActive,
			TransID = @TransID,
			UpdatedByUserName = @UpdatedByUserName,
			UpdatedDate = @UpdatedDate,
			IPAddress = @IPAddress
		WHERE
			Serial = @Serial
    SET @RETURN_KEY =@Serial
		    
	END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/	
CREATE PROCEDURE owin_userpasswordresetinfo_Del		        
		@Serial bigint  = NULL,
		@SessionID varchar (250) = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@SessionToken nvarchar (550) = NULL,
		@UserName nvarchar (150) = NULL,
		@IsActive bit  = NULL,
		        
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
		DELETE FROM Owin_UserPasswordResetInfo
		WHERE 
			Serial = @Serial
		
    SET @RETURN_KEY =@Serial
		
		
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
CREATE PROCEDURE owin_userpasswordresetinfo_GA 
		@Serial bigint  = NULL,
		@SessionID varchar (250) = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@SessionToken nvarchar (550) = NULL,
		@UserName nvarchar (150) = NULL,
		@IsActive bit  = NULL,
		    
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
			Owin_UserPasswordResetInfo.Serial,
			Owin_UserPasswordResetInfo.SessionID,
			Owin_UserPasswordResetInfo.UserID,
			Owin_UserPasswordResetInfo.MasterUserID,
			Owin_UserPasswordResetInfo.SessionToken,
			Owin_UserPasswordResetInfo.UserName,
			Owin_UserPasswordResetInfo.IsActive,
			Owin_UserPasswordResetInfo.TransID,
			Owin_UserPasswordResetInfo.CreatedByUserName,
			Owin_UserPasswordResetInfo.CreatedDate,
			Owin_UserPasswordResetInfo.UpdatedByUserName,
			Owin_UserPasswordResetInfo.UpdatedDate,
			Owin_UserPasswordResetInfo.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='Serial ASC' THEN Owin_UserPasswordResetInfo.Serial END ASC,
						CASE WHEN @SortExpression ='Serial DESC' THEN Owin_UserPasswordResetInfo.Serial END DESC,
						CASE WHEN @SortExpression ='SessionID ASC' THEN Owin_UserPasswordResetInfo.SessionID END ASC,
						CASE WHEN @SortExpression ='SessionID DESC' THEN Owin_UserPasswordResetInfo.SessionID END DESC,
						CASE WHEN @SortExpression ='UserID ASC' THEN Owin_UserPasswordResetInfo.UserID END ASC,
						CASE WHEN @SortExpression ='UserID DESC' THEN Owin_UserPasswordResetInfo.UserID END DESC,
						CASE WHEN @SortExpression ='MasterUserID ASC' THEN Owin_UserPasswordResetInfo.MasterUserID END ASC,
						CASE WHEN @SortExpression ='MasterUserID DESC' THEN Owin_UserPasswordResetInfo.MasterUserID END DESC,
						CASE WHEN @SortExpression ='UserName ASC' THEN Owin_UserPasswordResetInfo.UserName END ASC,
						CASE WHEN @SortExpression ='UserName DESC' THEN Owin_UserPasswordResetInfo.UserName END DESC,
						CASE WHEN @SortExpression ='IsActive ASC' THEN Owin_UserPasswordResetInfo.IsActive END ASC,
						CASE WHEN @SortExpression ='IsActive DESC' THEN Owin_UserPasswordResetInfo.IsActive END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_UserPasswordResetInfo.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_UserPasswordResetInfo.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_UserPasswordResetInfo.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_UserPasswordResetInfo.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_UserPasswordResetInfo.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_UserPasswordResetInfo.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_UserPasswordResetInfo.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_UserPasswordResetInfo.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_UserPasswordResetInfo.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_UserPasswordResetInfo.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_UserPasswordResetInfo.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_UserPasswordResetInfo.IPAddress END DESC
				) as RowNumber
		FROM Owin_UserPasswordResetInfo 
		where
			(CASE WHEN @Serial is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.Serial  = @Serial THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @SessionID is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.SessionID  = @SessionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserID is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.UserID  = @UserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MasterUserID is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.MasterUserID  = @MasterUserID THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UserName is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.UserName  = @UserName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsActive is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.IsActive  = @IsActive THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
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
CREATE PROCEDURE owin_userpasswordresetinfo_GAPg 
		@Serial bigint  = NULL,
		@SessionID varchar (250) = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@SessionToken nvarchar (550) = NULL,
		@UserName nvarchar (150) = NULL,
		@IsActive bit  = NULL,
		    
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
					owin_userpasswordresetinfo
				WHERE 
					(CASE WHEN @Serial is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.Serial  = @Serial THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @SessionID is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.SessionID  = @SessionID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UserID is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.UserID  = @UserID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @MasterUserID is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.MasterUserID  = @MasterUserID THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @UserName is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.UserName  = @UserName THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @IsActive is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.IsActive  = @IsActive THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
					
					
					
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_userpasswordresetinfo AS
			(
				  SELECT 
			Owin_UserPasswordResetInfo.Serial,
			Owin_UserPasswordResetInfo.SessionID,
			Owin_UserPasswordResetInfo.UserID,
			Owin_UserPasswordResetInfo.MasterUserID,
			Owin_UserPasswordResetInfo.SessionToken,
			Owin_UserPasswordResetInfo.UserName,
			Owin_UserPasswordResetInfo.IsActive,
			Owin_UserPasswordResetInfo.TransID,
			Owin_UserPasswordResetInfo.CreatedByUserName,
			Owin_UserPasswordResetInfo.CreatedDate,
			Owin_UserPasswordResetInfo.UpdatedByUserName,
			Owin_UserPasswordResetInfo.UpdatedDate,
			Owin_UserPasswordResetInfo.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='Serial ASC' THEN Owin_UserPasswordResetInfo.Serial END ASC,
						CASE WHEN @SortExpression ='Serial DESC' THEN Owin_UserPasswordResetInfo.Serial END DESC,
						CASE WHEN @SortExpression ='SessionID ASC' THEN Owin_UserPasswordResetInfo.SessionID END ASC,
						CASE WHEN @SortExpression ='SessionID DESC' THEN Owin_UserPasswordResetInfo.SessionID END DESC,
						CASE WHEN @SortExpression ='UserID ASC' THEN Owin_UserPasswordResetInfo.UserID END ASC,
						CASE WHEN @SortExpression ='UserID DESC' THEN Owin_UserPasswordResetInfo.UserID END DESC,
						CASE WHEN @SortExpression ='MasterUserID ASC' THEN Owin_UserPasswordResetInfo.MasterUserID END ASC,
						CASE WHEN @SortExpression ='MasterUserID DESC' THEN Owin_UserPasswordResetInfo.MasterUserID END DESC,
						CASE WHEN @SortExpression ='UserName ASC' THEN Owin_UserPasswordResetInfo.UserName END ASC,
						CASE WHEN @SortExpression ='UserName DESC' THEN Owin_UserPasswordResetInfo.UserName END DESC,
						CASE WHEN @SortExpression ='IsActive ASC' THEN Owin_UserPasswordResetInfo.IsActive END ASC,
						CASE WHEN @SortExpression ='IsActive DESC' THEN Owin_UserPasswordResetInfo.IsActive END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_UserPasswordResetInfo.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_UserPasswordResetInfo.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_UserPasswordResetInfo.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_UserPasswordResetInfo.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_UserPasswordResetInfo.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_UserPasswordResetInfo.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_UserPasswordResetInfo.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_UserPasswordResetInfo.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_UserPasswordResetInfo.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_UserPasswordResetInfo.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_UserPasswordResetInfo.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_UserPasswordResetInfo.IPAddress END DESC
				) as RowNumber
		FROM Owin_UserPasswordResetInfo 
		where
			(CASE WHEN @Serial is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.Serial  = @Serial THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @SessionID is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.SessionID  = @SessionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserID is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.UserID  = @UserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MasterUserID is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.MasterUserID  = @MasterUserID THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UserName is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.UserName  = @UserName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsActive is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.IsActive  = @IsActive THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_UserPasswordResetInfo.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
			)
			SELECT * 
			FROM  tempPagedowin_userpasswordresetinfo
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
CREATE PROCEDURE owin_userprefferencessettings_Ins 
		@SerialNo bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@PrePageSize int  = NULL,
		        
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
		
        
		INSERT INTO Owin_UserPrefferencesSettings (
			UserID,
			MasterUserID,
			AppFormID,
			PrePageSize,
			TransID,
			CreatedByUserName,
			CreatedDate,
  			IPAddress
		)
		VALUES (
			@UserID,
			@MasterUserID,
			@AppFormID,
			@PrePageSize,
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
CREATE PROCEDURE owin_userprefferencessettings_Upd
		@SerialNo bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@PrePageSize int  = NULL,
		        
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
		UPDATE Owin_UserPrefferencesSettings
		SET
			UserID = @UserID,
			MasterUserID = @MasterUserID,
			AppFormID = @AppFormID,
			PrePageSize = @PrePageSize,
			TransID = @TransID,
			UpdatedByUserName = @UpdatedByUserName,
			UpdatedDate = @UpdatedDate,
			IPAddress = @IPAddress
		WHERE
			SerialNo = @SerialNo
    SET @RETURN_KEY =@SerialNo
		    
	END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/	
CREATE PROCEDURE owin_userprefferencessettings_Del		        
		@SerialNo bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@PrePageSize int  = NULL,
		        
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
		DELETE FROM Owin_UserPrefferencesSettings
		WHERE 
			SerialNo = @SerialNo
		
    SET @RETURN_KEY =@SerialNo
		
		
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
CREATE PROCEDURE owin_userprefferencessettings_GA 
		@SerialNo bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@PrePageSize int  = NULL,
		    
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
			Owin_UserPrefferencesSettings.SerialNo,
			Owin_UserPrefferencesSettings.UserID,
			Owin_UserPrefferencesSettings.MasterUserID,
			Owin_UserPrefferencesSettings.AppFormID,
			Owin_UserPrefferencesSettings.PrePageSize,
			Owin_UserPrefferencesSettings.TransID,
			Owin_UserPrefferencesSettings.CreatedByUserName,
			Owin_UserPrefferencesSettings.CreatedDate,
			Owin_UserPrefferencesSettings.UpdatedByUserName,
			Owin_UserPrefferencesSettings.UpdatedDate,
			Owin_UserPrefferencesSettings.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='SerialNo ASC' THEN Owin_UserPrefferencesSettings.SerialNo END ASC,
						CASE WHEN @SortExpression ='SerialNo DESC' THEN Owin_UserPrefferencesSettings.SerialNo END DESC,
						CASE WHEN @SortExpression ='UserID ASC' THEN Owin_UserPrefferencesSettings.UserID END ASC,
						CASE WHEN @SortExpression ='UserID DESC' THEN Owin_UserPrefferencesSettings.UserID END DESC,
						CASE WHEN @SortExpression ='MasterUserID ASC' THEN Owin_UserPrefferencesSettings.MasterUserID END ASC,
						CASE WHEN @SortExpression ='MasterUserID DESC' THEN Owin_UserPrefferencesSettings.MasterUserID END DESC,
						CASE WHEN @SortExpression ='AppFormID ASC' THEN Owin_UserPrefferencesSettings.AppFormID END ASC,
						CASE WHEN @SortExpression ='AppFormID DESC' THEN Owin_UserPrefferencesSettings.AppFormID END DESC,
						CASE WHEN @SortExpression ='PrePageSize ASC' THEN Owin_UserPrefferencesSettings.PrePageSize END ASC,
						CASE WHEN @SortExpression ='PrePageSize DESC' THEN Owin_UserPrefferencesSettings.PrePageSize END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_UserPrefferencesSettings.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_UserPrefferencesSettings.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_UserPrefferencesSettings.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_UserPrefferencesSettings.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_UserPrefferencesSettings.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_UserPrefferencesSettings.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_UserPrefferencesSettings.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_UserPrefferencesSettings.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_UserPrefferencesSettings.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_UserPrefferencesSettings.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_UserPrefferencesSettings.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_UserPrefferencesSettings.IPAddress END DESC
				) as RowNumber
		FROM Owin_UserPrefferencesSettings 
		where
			(CASE WHEN @SerialNo is NULL THEN 1 WHEN Owin_UserPrefferencesSettings.SerialNo  = @SerialNo THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserID is NULL THEN 1 WHEN Owin_UserPrefferencesSettings.UserID  = @UserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MasterUserID is NULL THEN 1 WHEN Owin_UserPrefferencesSettings.MasterUserID  = @MasterUserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @AppFormID is NULL THEN 1 WHEN Owin_UserPrefferencesSettings.AppFormID  = @AppFormID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @PrePageSize is NULL THEN 1 WHEN Owin_UserPrefferencesSettings.PrePageSize  = @PrePageSize THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_UserPrefferencesSettings.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_UserPrefferencesSettings.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
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
CREATE PROCEDURE owin_userprefferencessettings_GAPg 
		@SerialNo bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@PrePageSize int  = NULL,
		    
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
					owin_userprefferencessettings
				WHERE 
					(CASE WHEN @SerialNo is NULL THEN 1 WHEN Owin_UserPrefferencesSettings.SerialNo  = @SerialNo THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UserID is NULL THEN 1 WHEN Owin_UserPrefferencesSettings.UserID  = @UserID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @MasterUserID is NULL THEN 1 WHEN Owin_UserPrefferencesSettings.MasterUserID  = @MasterUserID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @AppFormID is NULL THEN 1 WHEN Owin_UserPrefferencesSettings.AppFormID  = @AppFormID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @PrePageSize is NULL THEN 1 WHEN Owin_UserPrefferencesSettings.PrePageSize  = @PrePageSize THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_UserPrefferencesSettings.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_UserPrefferencesSettings.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
					
					
					
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_userprefferencessettings AS
			(
				  SELECT 
			Owin_UserPrefferencesSettings.SerialNo,
			Owin_UserPrefferencesSettings.UserID,
			Owin_UserPrefferencesSettings.MasterUserID,
			Owin_UserPrefferencesSettings.AppFormID,
			Owin_UserPrefferencesSettings.PrePageSize,
			Owin_UserPrefferencesSettings.TransID,
			Owin_UserPrefferencesSettings.CreatedByUserName,
			Owin_UserPrefferencesSettings.CreatedDate,
			Owin_UserPrefferencesSettings.UpdatedByUserName,
			Owin_UserPrefferencesSettings.UpdatedDate,
			Owin_UserPrefferencesSettings.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='SerialNo ASC' THEN Owin_UserPrefferencesSettings.SerialNo END ASC,
						CASE WHEN @SortExpression ='SerialNo DESC' THEN Owin_UserPrefferencesSettings.SerialNo END DESC,
						CASE WHEN @SortExpression ='UserID ASC' THEN Owin_UserPrefferencesSettings.UserID END ASC,
						CASE WHEN @SortExpression ='UserID DESC' THEN Owin_UserPrefferencesSettings.UserID END DESC,
						CASE WHEN @SortExpression ='MasterUserID ASC' THEN Owin_UserPrefferencesSettings.MasterUserID END ASC,
						CASE WHEN @SortExpression ='MasterUserID DESC' THEN Owin_UserPrefferencesSettings.MasterUserID END DESC,
						CASE WHEN @SortExpression ='AppFormID ASC' THEN Owin_UserPrefferencesSettings.AppFormID END ASC,
						CASE WHEN @SortExpression ='AppFormID DESC' THEN Owin_UserPrefferencesSettings.AppFormID END DESC,
						CASE WHEN @SortExpression ='PrePageSize ASC' THEN Owin_UserPrefferencesSettings.PrePageSize END ASC,
						CASE WHEN @SortExpression ='PrePageSize DESC' THEN Owin_UserPrefferencesSettings.PrePageSize END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_UserPrefferencesSettings.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_UserPrefferencesSettings.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_UserPrefferencesSettings.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_UserPrefferencesSettings.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_UserPrefferencesSettings.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_UserPrefferencesSettings.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_UserPrefferencesSettings.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_UserPrefferencesSettings.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_UserPrefferencesSettings.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_UserPrefferencesSettings.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_UserPrefferencesSettings.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_UserPrefferencesSettings.IPAddress END DESC
				) as RowNumber
		FROM Owin_UserPrefferencesSettings 
		where
			(CASE WHEN @SerialNo is NULL THEN 1 WHEN Owin_UserPrefferencesSettings.SerialNo  = @SerialNo THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserID is NULL THEN 1 WHEN Owin_UserPrefferencesSettings.UserID  = @UserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MasterUserID is NULL THEN 1 WHEN Owin_UserPrefferencesSettings.MasterUserID  = @MasterUserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @AppFormID is NULL THEN 1 WHEN Owin_UserPrefferencesSettings.AppFormID  = @AppFormID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @PrePageSize is NULL THEN 1 WHEN Owin_UserPrefferencesSettings.PrePageSize  = @PrePageSize THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_UserPrefferencesSettings.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_UserPrefferencesSettings.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
			)
			SELECT * 
			FROM  tempPagedowin_userprefferencessettings
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
CREATE PROCEDURE owin_userrole_Ins 
		@UserRoleID bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@RoleID bigint  = NULL,
		@IsEnable bit  = NULL,
		        
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
		
        
		INSERT INTO Owin_UserRole (
			UserID,
			MasterUserID,
			RoleID,
			IsEnable,
			TransID,
			CreatedByUserName,
			CreatedDate,
  			IPAddress
		)
		VALUES (
			@UserID,
			@MasterUserID,
			@RoleID,
			@IsEnable,
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
CREATE PROCEDURE owin_userrole_Upd
		@UserRoleID bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@RoleID bigint  = NULL,
		@IsEnable bit  = NULL,
		        
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
		UPDATE Owin_UserRole
		SET
			UserID = @UserID,
			MasterUserID = @MasterUserID,
			RoleID = @RoleID,
			IsEnable = @IsEnable,
			TransID = @TransID,
			UpdatedByUserName = @UpdatedByUserName,
			UpdatedDate = @UpdatedDate,
			IPAddress = @IPAddress
		WHERE
			UserRoleID = @UserRoleID
    SET @RETURN_KEY =@UserRoleID
		    
	END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/	
CREATE PROCEDURE owin_userrole_Del		        
		@UserRoleID bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@RoleID bigint  = NULL,
		@IsEnable bit  = NULL,
		        
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
		DELETE FROM Owin_UserRole
		WHERE 
			UserRoleID = @UserRoleID
		
    SET @RETURN_KEY =@UserRoleID
		
		
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
CREATE PROCEDURE owin_userrole_GA 
		@UserRoleID bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@RoleID bigint  = NULL,
		@IsEnable bit  = NULL,
		    
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
			Owin_UserRole.UserRoleID,
			Owin_UserRole.UserID,
			Owin_UserRole.MasterUserID,
			Owin_UserRole.RoleID,
			Owin_UserRole.IsEnable,
			Owin_UserRole.TransID,
			Owin_UserRole.CreatedByUserName,
			Owin_UserRole.CreatedDate,
			Owin_UserRole.UpdatedByUserName,
			Owin_UserRole.UpdatedDate,
			Owin_UserRole.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='UserRoleID ASC' THEN Owin_UserRole.UserRoleID END ASC,
						CASE WHEN @SortExpression ='UserRoleID DESC' THEN Owin_UserRole.UserRoleID END DESC,
						CASE WHEN @SortExpression ='UserID ASC' THEN Owin_UserRole.UserID END ASC,
						CASE WHEN @SortExpression ='UserID DESC' THEN Owin_UserRole.UserID END DESC,
						CASE WHEN @SortExpression ='MasterUserID ASC' THEN Owin_UserRole.MasterUserID END ASC,
						CASE WHEN @SortExpression ='MasterUserID DESC' THEN Owin_UserRole.MasterUserID END DESC,
						CASE WHEN @SortExpression ='RoleID ASC' THEN Owin_UserRole.RoleID END ASC,
						CASE WHEN @SortExpression ='RoleID DESC' THEN Owin_UserRole.RoleID END DESC,
						CASE WHEN @SortExpression ='IsEnable ASC' THEN Owin_UserRole.IsEnable END ASC,
						CASE WHEN @SortExpression ='IsEnable DESC' THEN Owin_UserRole.IsEnable END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_UserRole.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_UserRole.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_UserRole.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_UserRole.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_UserRole.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_UserRole.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_UserRole.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_UserRole.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_UserRole.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_UserRole.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_UserRole.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_UserRole.IPAddress END DESC
				) as RowNumber
		FROM Owin_UserRole 
		where
			(CASE WHEN @UserRoleID is NULL THEN 1 WHEN Owin_UserRole.UserRoleID  = @UserRoleID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserID is NULL THEN 1 WHEN Owin_UserRole.UserID  = @UserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MasterUserID is NULL THEN 1 WHEN Owin_UserRole.MasterUserID  = @MasterUserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @RoleID is NULL THEN 1 WHEN Owin_UserRole.RoleID  = @RoleID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsEnable is NULL THEN 1 WHEN Owin_UserRole.IsEnable  = @IsEnable THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_UserRole.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_UserRole.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
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
CREATE PROCEDURE owin_userrole_GAPg 
		@UserRoleID bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@RoleID bigint  = NULL,
		@IsEnable bit  = NULL,
		    
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
					owin_userrole
				WHERE 
					(CASE WHEN @UserRoleID is NULL THEN 1 WHEN Owin_UserRole.UserRoleID  = @UserRoleID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UserID is NULL THEN 1 WHEN Owin_UserRole.UserID  = @UserID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @MasterUserID is NULL THEN 1 WHEN Owin_UserRole.MasterUserID  = @MasterUserID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @RoleID is NULL THEN 1 WHEN Owin_UserRole.RoleID  = @RoleID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @IsEnable is NULL THEN 1 WHEN Owin_UserRole.IsEnable  = @IsEnable THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_UserRole.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_UserRole.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
					
					
					
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_userrole AS
			(
				  SELECT 
			Owin_UserRole.UserRoleID,
			Owin_UserRole.UserID,
			Owin_UserRole.MasterUserID,
			Owin_UserRole.RoleID,
			Owin_UserRole.IsEnable,
			Owin_UserRole.TransID,
			Owin_UserRole.CreatedByUserName,
			Owin_UserRole.CreatedDate,
			Owin_UserRole.UpdatedByUserName,
			Owin_UserRole.UpdatedDate,
			Owin_UserRole.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='UserRoleID ASC' THEN Owin_UserRole.UserRoleID END ASC,
						CASE WHEN @SortExpression ='UserRoleID DESC' THEN Owin_UserRole.UserRoleID END DESC,
						CASE WHEN @SortExpression ='UserID ASC' THEN Owin_UserRole.UserID END ASC,
						CASE WHEN @SortExpression ='UserID DESC' THEN Owin_UserRole.UserID END DESC,
						CASE WHEN @SortExpression ='MasterUserID ASC' THEN Owin_UserRole.MasterUserID END ASC,
						CASE WHEN @SortExpression ='MasterUserID DESC' THEN Owin_UserRole.MasterUserID END DESC,
						CASE WHEN @SortExpression ='RoleID ASC' THEN Owin_UserRole.RoleID END ASC,
						CASE WHEN @SortExpression ='RoleID DESC' THEN Owin_UserRole.RoleID END DESC,
						CASE WHEN @SortExpression ='IsEnable ASC' THEN Owin_UserRole.IsEnable END ASC,
						CASE WHEN @SortExpression ='IsEnable DESC' THEN Owin_UserRole.IsEnable END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_UserRole.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_UserRole.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_UserRole.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_UserRole.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_UserRole.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_UserRole.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_UserRole.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_UserRole.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_UserRole.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_UserRole.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_UserRole.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_UserRole.IPAddress END DESC
				) as RowNumber
		FROM Owin_UserRole 
		where
			(CASE WHEN @UserRoleID is NULL THEN 1 WHEN Owin_UserRole.UserRoleID  = @UserRoleID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserID is NULL THEN 1 WHEN Owin_UserRole.UserID  = @UserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MasterUserID is NULL THEN 1 WHEN Owin_UserRole.MasterUserID  = @MasterUserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @RoleID is NULL THEN 1 WHEN Owin_UserRole.RoleID  = @RoleID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsEnable is NULL THEN 1 WHEN Owin_UserRole.IsEnable  = @IsEnable THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_UserRole.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_UserRole.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
			)
			SELECT * 
			FROM  tempPagedowin_userrole
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
CREATE PROCEDURE owin_userstatuschangehistory_Ins 
		@Serial bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@StatusChanged bit  = NULL,
		@StatusRemark nvarchar (250) = NULL,
		@Comment nvarchar (450) = NULL,
		@ExtraFLD nvarchar (500) = NULL,
		        
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
		
        
		INSERT INTO Owin_UserStatusChangeHistory (
			UserID,
			MasterUserID,
			StatusChanged,
			StatusRemark,
			Comment,
			ExtraFLD,
			TransID,
			CreatedByUserName,
			CreatedDate,
  			IPAddress
		)
		VALUES (
			@UserID,
			@MasterUserID,
			@StatusChanged,
			@StatusRemark,
			@Comment,
			@ExtraFLD,
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
CREATE PROCEDURE owin_userstatuschangehistory_Upd
		@Serial bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@StatusChanged bit  = NULL,
		@StatusRemark nvarchar (250) = NULL,
		@Comment nvarchar (450) = NULL,
		@ExtraFLD nvarchar (500) = NULL,
		        
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
		UPDATE Owin_UserStatusChangeHistory
		SET
			UserID = @UserID,
			MasterUserID = @MasterUserID,
			StatusChanged = @StatusChanged,
			StatusRemark = @StatusRemark,
			Comment = @Comment,
			ExtraFLD = @ExtraFLD,
			TransID = @TransID,
			UpdatedByUserName = @UpdatedByUserName,
			UpdatedDate = @UpdatedDate,
			IPAddress = @IPAddress
		WHERE
			Serial = @Serial
    SET @RETURN_KEY =@Serial
		    
	END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/	
CREATE PROCEDURE owin_userstatuschangehistory_Del		        
		@Serial bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@StatusChanged bit  = NULL,
		@StatusRemark nvarchar (250) = NULL,
		@Comment nvarchar (450) = NULL,
		@ExtraFLD nvarchar (500) = NULL,
		        
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
		DELETE FROM Owin_UserStatusChangeHistory
		WHERE 
			Serial = @Serial
		
    SET @RETURN_KEY =@Serial
		
		
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
CREATE PROCEDURE owin_userstatuschangehistory_GA 
		@Serial bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@StatusChanged bit  = NULL,
		@StatusRemark nvarchar (250) = NULL,
		@Comment nvarchar (450) = NULL,
		@ExtraFLD nvarchar (500) = NULL,
		    
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
			Owin_UserStatusChangeHistory.Serial,
			Owin_UserStatusChangeHistory.UserID,
			Owin_UserStatusChangeHistory.MasterUserID,
			Owin_UserStatusChangeHistory.StatusChanged,
			Owin_UserStatusChangeHistory.StatusRemark,
			Owin_UserStatusChangeHistory.Comment,
			Owin_UserStatusChangeHistory.ExtraFLD,
			Owin_UserStatusChangeHistory.TransID,
			Owin_UserStatusChangeHistory.CreatedByUserName,
			Owin_UserStatusChangeHistory.CreatedDate,
			Owin_UserStatusChangeHistory.UpdatedByUserName,
			Owin_UserStatusChangeHistory.UpdatedDate,
			Owin_UserStatusChangeHistory.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='Serial ASC' THEN Owin_UserStatusChangeHistory.Serial END ASC,
						CASE WHEN @SortExpression ='Serial DESC' THEN Owin_UserStatusChangeHistory.Serial END DESC,
						CASE WHEN @SortExpression ='UserID ASC' THEN Owin_UserStatusChangeHistory.UserID END ASC,
						CASE WHEN @SortExpression ='UserID DESC' THEN Owin_UserStatusChangeHistory.UserID END DESC,
						CASE WHEN @SortExpression ='MasterUserID ASC' THEN Owin_UserStatusChangeHistory.MasterUserID END ASC,
						CASE WHEN @SortExpression ='MasterUserID DESC' THEN Owin_UserStatusChangeHistory.MasterUserID END DESC,
						CASE WHEN @SortExpression ='StatusChanged ASC' THEN Owin_UserStatusChangeHistory.StatusChanged END ASC,
						CASE WHEN @SortExpression ='StatusChanged DESC' THEN Owin_UserStatusChangeHistory.StatusChanged END DESC,
						CASE WHEN @SortExpression ='StatusRemark ASC' THEN Owin_UserStatusChangeHistory.StatusRemark END ASC,
						CASE WHEN @SortExpression ='StatusRemark DESC' THEN Owin_UserStatusChangeHistory.StatusRemark END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_UserStatusChangeHistory.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_UserStatusChangeHistory.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_UserStatusChangeHistory.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_UserStatusChangeHistory.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_UserStatusChangeHistory.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_UserStatusChangeHistory.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_UserStatusChangeHistory.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_UserStatusChangeHistory.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_UserStatusChangeHistory.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_UserStatusChangeHistory.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_UserStatusChangeHistory.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_UserStatusChangeHistory.IPAddress END DESC
				) as RowNumber
		FROM Owin_UserStatusChangeHistory 
		where
			(CASE WHEN @Serial is NULL THEN 1 WHEN Owin_UserStatusChangeHistory.Serial  = @Serial THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserID is NULL THEN 1 WHEN Owin_UserStatusChangeHistory.UserID  = @UserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MasterUserID is NULL THEN 1 WHEN Owin_UserStatusChangeHistory.MasterUserID  = @MasterUserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @StatusChanged is NULL THEN 1 WHEN Owin_UserStatusChangeHistory.StatusChanged  = @StatusChanged THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @StatusRemark is NULL THEN 1 WHEN Owin_UserStatusChangeHistory.StatusRemark  = @StatusRemark THEN 1 ELSE 0 END = 1)
			
			
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_UserStatusChangeHistory.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_UserStatusChangeHistory.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
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
CREATE PROCEDURE owin_userstatuschangehistory_GAPg 
		@Serial bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@StatusChanged bit  = NULL,
		@StatusRemark nvarchar (250) = NULL,
		@Comment nvarchar (450) = NULL,
		@ExtraFLD nvarchar (500) = NULL,
		    
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
					owin_userstatuschangehistory
				WHERE 
					(CASE WHEN @Serial is NULL THEN 1 WHEN Owin_UserStatusChangeHistory.Serial  = @Serial THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UserID is NULL THEN 1 WHEN Owin_UserStatusChangeHistory.UserID  = @UserID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @MasterUserID is NULL THEN 1 WHEN Owin_UserStatusChangeHistory.MasterUserID  = @MasterUserID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @StatusChanged is NULL THEN 1 WHEN Owin_UserStatusChangeHistory.StatusChanged  = @StatusChanged THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @StatusRemark is NULL THEN 1 WHEN Owin_UserStatusChangeHistory.StatusRemark  = @StatusRemark THEN 1 ELSE 0 END = 1)
					
					
					
					AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_UserStatusChangeHistory.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_UserStatusChangeHistory.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
					
					
					
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_userstatuschangehistory AS
			(
				  SELECT 
			Owin_UserStatusChangeHistory.Serial,
			Owin_UserStatusChangeHistory.UserID,
			Owin_UserStatusChangeHistory.MasterUserID,
			Owin_UserStatusChangeHistory.StatusChanged,
			Owin_UserStatusChangeHistory.StatusRemark,
			Owin_UserStatusChangeHistory.Comment,
			Owin_UserStatusChangeHistory.ExtraFLD,
			Owin_UserStatusChangeHistory.TransID,
			Owin_UserStatusChangeHistory.CreatedByUserName,
			Owin_UserStatusChangeHistory.CreatedDate,
			Owin_UserStatusChangeHistory.UpdatedByUserName,
			Owin_UserStatusChangeHistory.UpdatedDate,
			Owin_UserStatusChangeHistory.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='Serial ASC' THEN Owin_UserStatusChangeHistory.Serial END ASC,
						CASE WHEN @SortExpression ='Serial DESC' THEN Owin_UserStatusChangeHistory.Serial END DESC,
						CASE WHEN @SortExpression ='UserID ASC' THEN Owin_UserStatusChangeHistory.UserID END ASC,
						CASE WHEN @SortExpression ='UserID DESC' THEN Owin_UserStatusChangeHistory.UserID END DESC,
						CASE WHEN @SortExpression ='MasterUserID ASC' THEN Owin_UserStatusChangeHistory.MasterUserID END ASC,
						CASE WHEN @SortExpression ='MasterUserID DESC' THEN Owin_UserStatusChangeHistory.MasterUserID END DESC,
						CASE WHEN @SortExpression ='StatusChanged ASC' THEN Owin_UserStatusChangeHistory.StatusChanged END ASC,
						CASE WHEN @SortExpression ='StatusChanged DESC' THEN Owin_UserStatusChangeHistory.StatusChanged END DESC,
						CASE WHEN @SortExpression ='StatusRemark ASC' THEN Owin_UserStatusChangeHistory.StatusRemark END ASC,
						CASE WHEN @SortExpression ='StatusRemark DESC' THEN Owin_UserStatusChangeHistory.StatusRemark END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_UserStatusChangeHistory.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_UserStatusChangeHistory.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_UserStatusChangeHistory.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_UserStatusChangeHistory.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_UserStatusChangeHistory.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_UserStatusChangeHistory.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_UserStatusChangeHistory.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_UserStatusChangeHistory.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_UserStatusChangeHistory.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_UserStatusChangeHistory.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_UserStatusChangeHistory.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_UserStatusChangeHistory.IPAddress END DESC
				) as RowNumber
		FROM Owin_UserStatusChangeHistory 
		where
			(CASE WHEN @Serial is NULL THEN 1 WHEN Owin_UserStatusChangeHistory.Serial  = @Serial THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserID is NULL THEN 1 WHEN Owin_UserStatusChangeHistory.UserID  = @UserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MasterUserID is NULL THEN 1 WHEN Owin_UserStatusChangeHistory.MasterUserID  = @MasterUserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @StatusChanged is NULL THEN 1 WHEN Owin_UserStatusChangeHistory.StatusChanged  = @StatusChanged THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @StatusRemark is NULL THEN 1 WHEN Owin_UserStatusChangeHistory.StatusRemark  = @StatusRemark THEN 1 ELSE 0 END = 1)
			
			
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Owin_UserStatusChangeHistory.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Owin_UserStatusChangeHistory.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
			)
			SELECT * 
			FROM  tempPagedowin_userstatuschangehistory
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
CREATE PROCEDURE tran_login_Ins 
		@SerialLoginID bigint  = NULL,
		@ParentSerialLoginID bigint  = NULL,
		@SAMAccount nvarchar (MAX) = NULL,
		@SAMEmail nvarchar (MAX) = NULL,
		@UserID uniqueidentifier  = NULL,
		@LoginDate datetime  = NULL,
		@LoginToken nvarchar (MAX) = NULL,
		@RefreshToken nvarchar (MAX) = NULL,
		@TokenIssueDate datetime  = NULL,
		@Expires datetime  = NULL,
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
		
        
		INSERT INTO Tran_Login (
			ParentSerialLoginID,
			SAMAccount,
			SAMEmail,
			UserID,
			LoginDate,
			LoginToken,
			RefreshToken,
			TokenIssueDate,
			Expires,
			Remarks,
			TransID,
			CreatedByUserName,
			CreatedDate,
  			IPAddress
		)
		VALUES (
			@ParentSerialLoginID,
			@SAMAccount,
			@SAMEmail,
			@UserID,
			@LoginDate,
			@LoginToken,
			@RefreshToken,
			@TokenIssueDate,
			@Expires,
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
CREATE PROCEDURE tran_login_Upd
		@SerialLoginID bigint  = NULL,
		@ParentSerialLoginID bigint  = NULL,
		@SAMAccount nvarchar (MAX) = NULL,
		@SAMEmail nvarchar (MAX) = NULL,
		@UserID uniqueidentifier  = NULL,
		@LoginDate datetime  = NULL,
		@LoginToken nvarchar (MAX) = NULL,
		@RefreshToken nvarchar (MAX) = NULL,
		@TokenIssueDate datetime  = NULL,
		@Expires datetime  = NULL,
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
		UPDATE Tran_Login
		SET
			ParentSerialLoginID = @ParentSerialLoginID,
			SAMAccount = @SAMAccount,
			SAMEmail = @SAMEmail,
			UserID = @UserID,
			LoginDate = @LoginDate,
			LoginToken = @LoginToken,
			RefreshToken = @RefreshToken,
			TokenIssueDate = @TokenIssueDate,
			Expires = @Expires,
			Remarks = @Remarks,
			TransID = @TransID,
			UpdatedByUserName = @UpdatedByUserName,
			UpdatedDate = @UpdatedDate,
			IPAddress = @IPAddress
		WHERE
			SerialLoginID = @SerialLoginID
    SET @RETURN_KEY =@SerialLoginID
		    
	END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/	
CREATE PROCEDURE tran_login_Del		        
		@SerialLoginID bigint  = NULL,
		@ParentSerialLoginID bigint  = NULL,
		@SAMAccount nvarchar (MAX) = NULL,
		@SAMEmail nvarchar (MAX) = NULL,
		@UserID uniqueidentifier  = NULL,
		@LoginDate datetime  = NULL,
		@LoginToken nvarchar (MAX) = NULL,
		@RefreshToken nvarchar (MAX) = NULL,
		@TokenIssueDate datetime  = NULL,
		@Expires datetime  = NULL,
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
		DELETE FROM Tran_Login
		WHERE 
			SerialLoginID = @SerialLoginID
		
    SET @RETURN_KEY =@SerialLoginID
		
		
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
CREATE PROCEDURE tran_login_GA 
		@SerialLoginID bigint  = NULL,
		@ParentSerialLoginID bigint  = NULL,
		@SAMAccount nvarchar (MAX) = NULL,
		@SAMEmail nvarchar (MAX) = NULL,
		@UserID uniqueidentifier  = NULL,
		@LoginDate datetime  = NULL,
		@LoginToken nvarchar (MAX) = NULL,
		@RefreshToken nvarchar (MAX) = NULL,
		@TokenIssueDate datetime  = NULL,
		@Expires datetime  = NULL,
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
			Tran_Login.SerialLoginID,
			Tran_Login.ParentSerialLoginID,
			Tran_Login.SAMAccount,
			Tran_Login.SAMEmail,
			Tran_Login.UserID,
			Tran_Login.LoginDate,
			Tran_Login.LoginToken,
			Tran_Login.RefreshToken,
			Tran_Login.TokenIssueDate,
			Tran_Login.Expires,
			Tran_Login.Remarks,
			Tran_Login.TransID,
			Tran_Login.CreatedByUserName,
			Tran_Login.CreatedDate,
			Tran_Login.UpdatedByUserName,
			Tran_Login.UpdatedDate,
			Tran_Login.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='SerialLoginID ASC' THEN Tran_Login.SerialLoginID END ASC,
						CASE WHEN @SortExpression ='SerialLoginID DESC' THEN Tran_Login.SerialLoginID END DESC,
						CASE WHEN @SortExpression ='ParentSerialLoginID ASC' THEN Tran_Login.ParentSerialLoginID END ASC,
						CASE WHEN @SortExpression ='ParentSerialLoginID DESC' THEN Tran_Login.ParentSerialLoginID END DESC,
						CASE WHEN @SortExpression ='SAMAccount ASC' THEN Tran_Login.SAMAccount END ASC,
						CASE WHEN @SortExpression ='SAMAccount DESC' THEN Tran_Login.SAMAccount END DESC,
						CASE WHEN @SortExpression ='SAMEmail ASC' THEN Tran_Login.SAMEmail END ASC,
						CASE WHEN @SortExpression ='SAMEmail DESC' THEN Tran_Login.SAMEmail END DESC,
						CASE WHEN @SortExpression ='UserID ASC' THEN Tran_Login.UserID END ASC,
						CASE WHEN @SortExpression ='UserID DESC' THEN Tran_Login.UserID END DESC,
						CASE WHEN @SortExpression ='LoginDate ASC' THEN Tran_Login.LoginDate END ASC,
						CASE WHEN @SortExpression ='LoginDate DESC' THEN Tran_Login.LoginDate END DESC,
						CASE WHEN @SortExpression ='LoginToken ASC' THEN Tran_Login.LoginToken END ASC,
						CASE WHEN @SortExpression ='LoginToken DESC' THEN Tran_Login.LoginToken END DESC,
						CASE WHEN @SortExpression ='RefreshToken ASC' THEN Tran_Login.RefreshToken END ASC,
						CASE WHEN @SortExpression ='RefreshToken DESC' THEN Tran_Login.RefreshToken END DESC,
						CASE WHEN @SortExpression ='TokenIssueDate ASC' THEN Tran_Login.TokenIssueDate END ASC,
						CASE WHEN @SortExpression ='TokenIssueDate DESC' THEN Tran_Login.TokenIssueDate END DESC,
						CASE WHEN @SortExpression ='Expires ASC' THEN Tran_Login.Expires END ASC,
						CASE WHEN @SortExpression ='Expires DESC' THEN Tran_Login.Expires END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Tran_Login.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Tran_Login.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Tran_Login.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Tran_Login.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Tran_Login.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Tran_Login.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Tran_Login.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Tran_Login.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Tran_Login.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Tran_Login.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Tran_Login.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Tran_Login.IPAddress END DESC
				) as RowNumber
		FROM Tran_Login 
		where
			(CASE WHEN @SerialLoginID is NULL THEN 1 WHEN Tran_Login.SerialLoginID  = @SerialLoginID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ParentSerialLoginID is NULL THEN 1 WHEN Tran_Login.ParentSerialLoginID  = @ParentSerialLoginID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @SAMAccount is NULL THEN 1 WHEN Tran_Login.SAMAccount  = @SAMAccount THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @SAMEmail is NULL THEN 1 WHEN Tran_Login.SAMEmail  = @SAMEmail THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserID is NULL THEN 1 WHEN Tran_Login.UserID  = @UserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LoginDate is NULL THEN 1 WHEN Tran_Login.LoginDate  = @LoginDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LoginToken is NULL THEN 1 WHEN Tran_Login.LoginToken  = @LoginToken THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @RefreshToken is NULL THEN 1 WHEN Tran_Login.RefreshToken  = @RefreshToken THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TokenIssueDate is NULL THEN 1 WHEN Tran_Login.TokenIssueDate  = @TokenIssueDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Expires is NULL THEN 1 WHEN Tran_Login.Expires  = @Expires THEN 1 ELSE 0 END = 1)
			
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Tran_Login.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Tran_Login.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
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
CREATE PROCEDURE tran_login_GAPg 
		@SerialLoginID bigint  = NULL,
		@ParentSerialLoginID bigint  = NULL,
		@SAMAccount nvarchar (MAX) = NULL,
		@SAMEmail nvarchar (MAX) = NULL,
		@UserID uniqueidentifier  = NULL,
		@LoginDate datetime  = NULL,
		@LoginToken nvarchar (MAX) = NULL,
		@RefreshToken nvarchar (MAX) = NULL,
		@TokenIssueDate datetime  = NULL,
		@Expires datetime  = NULL,
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
					tran_login
				WHERE 
					(CASE WHEN @SerialLoginID is NULL THEN 1 WHEN Tran_Login.SerialLoginID  = @SerialLoginID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ParentSerialLoginID is NULL THEN 1 WHEN Tran_Login.ParentSerialLoginID  = @ParentSerialLoginID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @SAMAccount is NULL THEN 1 WHEN Tran_Login.SAMAccount  = @SAMAccount THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @SAMEmail is NULL THEN 1 WHEN Tran_Login.SAMEmail  = @SAMEmail THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UserID is NULL THEN 1 WHEN Tran_Login.UserID  = @UserID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @LoginDate is NULL THEN 1 WHEN Tran_Login.LoginDate  = @LoginDate THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @LoginToken is NULL THEN 1 WHEN Tran_Login.LoginToken  = @LoginToken THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @RefreshToken is NULL THEN 1 WHEN Tran_Login.RefreshToken  = @RefreshToken THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TokenIssueDate is NULL THEN 1 WHEN Tran_Login.TokenIssueDate  = @TokenIssueDate THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @Expires is NULL THEN 1 WHEN Tran_Login.Expires  = @Expires THEN 1 ELSE 0 END = 1)
					
					
					AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Tran_Login.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
					
					AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Tran_Login.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
					
					
					
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedtran_login AS
			(
				  SELECT 
			Tran_Login.SerialLoginID,
			Tran_Login.ParentSerialLoginID,
			Tran_Login.SAMAccount,
			Tran_Login.SAMEmail,
			Tran_Login.UserID,
			Tran_Login.LoginDate,
			Tran_Login.LoginToken,
			Tran_Login.RefreshToken,
			Tran_Login.TokenIssueDate,
			Tran_Login.Expires,
			Tran_Login.Remarks,
			Tran_Login.TransID,
			Tran_Login.CreatedByUserName,
			Tran_Login.CreatedDate,
			Tran_Login.UpdatedByUserName,
			Tran_Login.UpdatedDate,
			Tran_Login.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='SerialLoginID ASC' THEN Tran_Login.SerialLoginID END ASC,
						CASE WHEN @SortExpression ='SerialLoginID DESC' THEN Tran_Login.SerialLoginID END DESC,
						CASE WHEN @SortExpression ='ParentSerialLoginID ASC' THEN Tran_Login.ParentSerialLoginID END ASC,
						CASE WHEN @SortExpression ='ParentSerialLoginID DESC' THEN Tran_Login.ParentSerialLoginID END DESC,
						CASE WHEN @SortExpression ='SAMAccount ASC' THEN Tran_Login.SAMAccount END ASC,
						CASE WHEN @SortExpression ='SAMAccount DESC' THEN Tran_Login.SAMAccount END DESC,
						CASE WHEN @SortExpression ='SAMEmail ASC' THEN Tran_Login.SAMEmail END ASC,
						CASE WHEN @SortExpression ='SAMEmail DESC' THEN Tran_Login.SAMEmail END DESC,
						CASE WHEN @SortExpression ='UserID ASC' THEN Tran_Login.UserID END ASC,
						CASE WHEN @SortExpression ='UserID DESC' THEN Tran_Login.UserID END DESC,
						CASE WHEN @SortExpression ='LoginDate ASC' THEN Tran_Login.LoginDate END ASC,
						CASE WHEN @SortExpression ='LoginDate DESC' THEN Tran_Login.LoginDate END DESC,
						CASE WHEN @SortExpression ='LoginToken ASC' THEN Tran_Login.LoginToken END ASC,
						CASE WHEN @SortExpression ='LoginToken DESC' THEN Tran_Login.LoginToken END DESC,
						CASE WHEN @SortExpression ='RefreshToken ASC' THEN Tran_Login.RefreshToken END ASC,
						CASE WHEN @SortExpression ='RefreshToken DESC' THEN Tran_Login.RefreshToken END DESC,
						CASE WHEN @SortExpression ='TokenIssueDate ASC' THEN Tran_Login.TokenIssueDate END ASC,
						CASE WHEN @SortExpression ='TokenIssueDate DESC' THEN Tran_Login.TokenIssueDate END DESC,
						CASE WHEN @SortExpression ='Expires ASC' THEN Tran_Login.Expires END ASC,
						CASE WHEN @SortExpression ='Expires DESC' THEN Tran_Login.Expires END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Tran_Login.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Tran_Login.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Tran_Login.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Tran_Login.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Tran_Login.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Tran_Login.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Tran_Login.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Tran_Login.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Tran_Login.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Tran_Login.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Tran_Login.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Tran_Login.IPAddress END DESC
				) as RowNumber
		FROM Tran_Login 
		where
			(CASE WHEN @SerialLoginID is NULL THEN 1 WHEN Tran_Login.SerialLoginID  = @SerialLoginID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ParentSerialLoginID is NULL THEN 1 WHEN Tran_Login.ParentSerialLoginID  = @ParentSerialLoginID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @SAMAccount is NULL THEN 1 WHEN Tran_Login.SAMAccount  = @SAMAccount THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @SAMEmail is NULL THEN 1 WHEN Tran_Login.SAMEmail  = @SAMEmail THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserID is NULL THEN 1 WHEN Tran_Login.UserID  = @UserID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LoginDate is NULL THEN 1 WHEN Tran_Login.LoginDate  = @LoginDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LoginToken is NULL THEN 1 WHEN Tran_Login.LoginToken  = @LoginToken THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @RefreshToken is NULL THEN 1 WHEN Tran_Login.RefreshToken  = @RefreshToken THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TokenIssueDate is NULL THEN 1 WHEN Tran_Login.TokenIssueDate  = @TokenIssueDate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Expires is NULL THEN 1 WHEN Tran_Login.Expires  = @Expires THEN 1 ELSE 0 END = 1)
			
			
			AND (CASE WHEN @CreatedByUserName is NULL THEN 1 WHEN Tran_Login.CreatedByUserName  = @CreatedByUserName THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @UpdatedByUserName is NULL THEN 1 WHEN Tran_Login.UpdatedByUserName  = @UpdatedByUserName THEN 1 ELSE 0 END = 1)
			
			
			
			)
			SELECT * 
			FROM  tempPagedtran_login
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

            
            



            
            
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
Create PROCEDURE owin_formaction_GAPgListView 
		@FormActionID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@ActionName nvarchar (150) = NULL,
		@ActionType nvarchar (250) = NULL,
		@IsView bit  = NULL,
		@EventName nvarchar (50) = NULL,
		@Sequence int  = NULL,
				
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
					owin_formaction
				WHERE 
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 					Owin_FormAction.FormActionID  like @CommonSerachParam
					 OR Owin_FormAction.AppFormID  like @CommonSerachParam
					 OR Owin_FormAction.ActionName  like @CommonSerachParam
					 OR Owin_FormAction.ActionType  like @CommonSerachParam
					 OR Owin_FormAction.IsView  like @CommonSerachParam
					 OR Owin_FormAction.EventName  like @CommonSerachParam
					 OR Owin_FormAction.Sequence  like @CommonSerachParam
					
					
					
					
					
					
					
 THEN 1 ELSE 0 END = 1)			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_formaction AS
			(
				  SELECT 
			Owin_FormAction.FormActionID,
			Owin_FormAction.AppFormID,
			Owin_FormAction.ActionName,
			Owin_FormAction.ActionType,
			Owin_FormAction.IsView,
			Owin_FormAction.EventName,
			Owin_FormAction.Sequence,
			Owin_FormAction.TransID,
			Owin_FormAction.CreatedByUserName,
			Owin_FormAction.CreatedDate,
			Owin_FormAction.UpdatedByUserName,
			Owin_FormAction.UpdatedDate,
			Owin_FormAction.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='FormActionID ASC' THEN Owin_FormAction.FormActionID END ASC,
						CASE WHEN @SortExpression ='FormActionID DESC' THEN Owin_FormAction.FormActionID END DESC,
						CASE WHEN @SortExpression ='AppFormID ASC' THEN Owin_FormAction.AppFormID END ASC,
						CASE WHEN @SortExpression ='AppFormID DESC' THEN Owin_FormAction.AppFormID END DESC,
						CASE WHEN @SortExpression ='ActionName ASC' THEN Owin_FormAction.ActionName END ASC,
						CASE WHEN @SortExpression ='ActionName DESC' THEN Owin_FormAction.ActionName END DESC,
						CASE WHEN @SortExpression ='ActionType ASC' THEN Owin_FormAction.ActionType END ASC,
						CASE WHEN @SortExpression ='ActionType DESC' THEN Owin_FormAction.ActionType END DESC,
						CASE WHEN @SortExpression ='IsView ASC' THEN Owin_FormAction.IsView END ASC,
						CASE WHEN @SortExpression ='IsView DESC' THEN Owin_FormAction.IsView END DESC,
						CASE WHEN @SortExpression ='EventName ASC' THEN Owin_FormAction.EventName END ASC,
						CASE WHEN @SortExpression ='EventName DESC' THEN Owin_FormAction.EventName END DESC,
						CASE WHEN @SortExpression ='Sequence ASC' THEN Owin_FormAction.Sequence END ASC,
						CASE WHEN @SortExpression ='Sequence DESC' THEN Owin_FormAction.Sequence END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_FormAction.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_FormAction.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_FormAction.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_FormAction.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_FormAction.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_FormAction.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_FormAction.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_FormAction.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_FormAction.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_FormAction.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_FormAction.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_FormAction.IPAddress END DESC
				) as RowNumber
		FROM Owin_FormAction 
		where
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 			Owin_FormAction.FormActionID  like @CommonSerachParam
			 OR Owin_FormAction.AppFormID  like @CommonSerachParam
			 OR Owin_FormAction.ActionName  like @CommonSerachParam
			 OR Owin_FormAction.ActionType  like @CommonSerachParam
			 OR Owin_FormAction.IsView  like @CommonSerachParam
			 OR Owin_FormAction.EventName  like @CommonSerachParam
			 OR Owin_FormAction.Sequence  like @CommonSerachParam
			
			
			
			
			
			
			
 THEN 1 ELSE 0 END = 1)			)
			SELECT * 
			FROM  tempPagedowin_formaction
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
Create PROCEDURE owin_formaction_GS
		@FormActionID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@ActionName nvarchar (150) = NULL,
		@ActionType nvarchar (250) = NULL,
		@IsView bit  = NULL,
		@EventName nvarchar (50) = NULL,
		@Sequence int  = NULL,
		    
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
			Owin_FormAction.FormActionID,
			Owin_FormAction.AppFormID,
			Owin_FormAction.ActionName,
			Owin_FormAction.ActionType,
			Owin_FormAction.IsView,
			Owin_FormAction.EventName,
			Owin_FormAction.Sequence,
			Owin_FormAction.TransID,
			Owin_FormAction.CreatedByUserName,
			Owin_FormAction.CreatedDate,
			Owin_FormAction.UpdatedByUserName,
			Owin_FormAction.UpdatedDate,
			Owin_FormAction.IPAddress,
			CONVERT(bigint, TS) as TS
		FROM Owin_FormAction 
		where
			FormActionID = @FormActionID
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
Create PROCEDURE owin_forminfo_GAPgListView 
		@AppFormID bigint  = NULL,
		@FormName nvarchar (150) = NULL,
		@FormNameAr nvarchar (150) = NULL,
		@ParentID bigint  = NULL,
		@LevelID int  = NULL,
		@MenuLevel nvarchar (50) = NULL,
		@HasDirectChild bit  = NULL,
		@Icon image  = NULL,
		@ClassIcon nvarchar (50) = NULL,
		@Sequence int  = NULL,
		@URL nvarchar (200) = NULL,
		@IsView bit  = NULL,
		@IsDynamic bit  = NULL,
		@IsSuperAdmin bit  = NULL,
		@IsVisibleInMenu bit  = NULL,
				
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
					owin_forminfo
				WHERE 
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 					Owin_FormInfo.AppFormID  like @CommonSerachParam
					 OR Owin_FormInfo.FormName  like @CommonSerachParam
					 OR Owin_FormInfo.FormNameAr  like @CommonSerachParam
					 OR Owin_FormInfo.ParentID  like @CommonSerachParam
					 OR Owin_FormInfo.LevelID  like @CommonSerachParam
					 OR Owin_FormInfo.MenuLevel  like @CommonSerachParam
					 OR Owin_FormInfo.HasDirectChild  like @CommonSerachParam
					
					 OR Owin_FormInfo.ClassIcon  like @CommonSerachParam
					 OR Owin_FormInfo.Sequence  like @CommonSerachParam
					 OR Owin_FormInfo.URL  like @CommonSerachParam
					 OR Owin_FormInfo.IsView  like @CommonSerachParam
					 OR Owin_FormInfo.IsDynamic  like @CommonSerachParam
					 OR Owin_FormInfo.IsSuperAdmin  like @CommonSerachParam
					 OR Owin_FormInfo.IsVisibleInMenu  like @CommonSerachParam
					
					
					
					
					
					
					
 THEN 1 ELSE 0 END = 1)			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_forminfo AS
			(
				  SELECT 
			Owin_FormInfo.AppFormID,
			Owin_FormInfo.FormName,
			Owin_FormInfo.FormNameAr,
			Owin_FormInfo.ParentID,
			Owin_FormInfo.LevelID,
			Owin_FormInfo.MenuLevel,
			Owin_FormInfo.HasDirectChild,
			Owin_FormInfo.Icon,
			Owin_FormInfo.ClassIcon,
			Owin_FormInfo.Sequence,
			Owin_FormInfo.URL,
			Owin_FormInfo.IsView,
			Owin_FormInfo.IsDynamic,
			Owin_FormInfo.IsSuperAdmin,
			Owin_FormInfo.IsVisibleInMenu,
			Owin_FormInfo.TransID,
			Owin_FormInfo.CreatedByUserName,
			Owin_FormInfo.CreatedDate,
			Owin_FormInfo.UpdatedByUserName,
			Owin_FormInfo.UpdatedDate,
			Owin_FormInfo.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='AppFormID ASC' THEN Owin_FormInfo.AppFormID END ASC,
						CASE WHEN @SortExpression ='AppFormID DESC' THEN Owin_FormInfo.AppFormID END DESC,
						CASE WHEN @SortExpression ='FormName ASC' THEN Owin_FormInfo.FormName END ASC,
						CASE WHEN @SortExpression ='FormName DESC' THEN Owin_FormInfo.FormName END DESC,
						CASE WHEN @SortExpression ='FormNameAr ASC' THEN Owin_FormInfo.FormNameAr END ASC,
						CASE WHEN @SortExpression ='FormNameAr DESC' THEN Owin_FormInfo.FormNameAr END DESC,
						CASE WHEN @SortExpression ='ParentID ASC' THEN Owin_FormInfo.ParentID END ASC,
						CASE WHEN @SortExpression ='ParentID DESC' THEN Owin_FormInfo.ParentID END DESC,
						CASE WHEN @SortExpression ='LevelID ASC' THEN Owin_FormInfo.LevelID END ASC,
						CASE WHEN @SortExpression ='LevelID DESC' THEN Owin_FormInfo.LevelID END DESC,
						CASE WHEN @SortExpression ='MenuLevel ASC' THEN Owin_FormInfo.MenuLevel END ASC,
						CASE WHEN @SortExpression ='MenuLevel DESC' THEN Owin_FormInfo.MenuLevel END DESC,
						CASE WHEN @SortExpression ='HasDirectChild ASC' THEN Owin_FormInfo.HasDirectChild END ASC,
						CASE WHEN @SortExpression ='HasDirectChild DESC' THEN Owin_FormInfo.HasDirectChild END DESC,
						CASE WHEN @SortExpression ='ClassIcon ASC' THEN Owin_FormInfo.ClassIcon END ASC,
						CASE WHEN @SortExpression ='ClassIcon DESC' THEN Owin_FormInfo.ClassIcon END DESC,
						CASE WHEN @SortExpression ='Sequence ASC' THEN Owin_FormInfo.Sequence END ASC,
						CASE WHEN @SortExpression ='Sequence DESC' THEN Owin_FormInfo.Sequence END DESC,
						CASE WHEN @SortExpression ='URL ASC' THEN Owin_FormInfo.URL END ASC,
						CASE WHEN @SortExpression ='URL DESC' THEN Owin_FormInfo.URL END DESC,
						CASE WHEN @SortExpression ='IsView ASC' THEN Owin_FormInfo.IsView END ASC,
						CASE WHEN @SortExpression ='IsView DESC' THEN Owin_FormInfo.IsView END DESC,
						CASE WHEN @SortExpression ='IsDynamic ASC' THEN Owin_FormInfo.IsDynamic END ASC,
						CASE WHEN @SortExpression ='IsDynamic DESC' THEN Owin_FormInfo.IsDynamic END DESC,
						CASE WHEN @SortExpression ='IsSuperAdmin ASC' THEN Owin_FormInfo.IsSuperAdmin END ASC,
						CASE WHEN @SortExpression ='IsSuperAdmin DESC' THEN Owin_FormInfo.IsSuperAdmin END DESC,
						CASE WHEN @SortExpression ='IsVisibleInMenu ASC' THEN Owin_FormInfo.IsVisibleInMenu END ASC,
						CASE WHEN @SortExpression ='IsVisibleInMenu DESC' THEN Owin_FormInfo.IsVisibleInMenu END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_FormInfo.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_FormInfo.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_FormInfo.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_FormInfo.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_FormInfo.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_FormInfo.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_FormInfo.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_FormInfo.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_FormInfo.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_FormInfo.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_FormInfo.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_FormInfo.IPAddress END DESC
				) as RowNumber
		FROM Owin_FormInfo 
		where
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 			Owin_FormInfo.AppFormID  like @CommonSerachParam
			 OR Owin_FormInfo.FormName  like @CommonSerachParam
			 OR Owin_FormInfo.FormNameAr  like @CommonSerachParam
			 OR Owin_FormInfo.ParentID  like @CommonSerachParam
			 OR Owin_FormInfo.LevelID  like @CommonSerachParam
			 OR Owin_FormInfo.MenuLevel  like @CommonSerachParam
			 OR Owin_FormInfo.HasDirectChild  like @CommonSerachParam
			
			 OR Owin_FormInfo.ClassIcon  like @CommonSerachParam
			 OR Owin_FormInfo.Sequence  like @CommonSerachParam
			 OR Owin_FormInfo.URL  like @CommonSerachParam
			 OR Owin_FormInfo.IsView  like @CommonSerachParam
			 OR Owin_FormInfo.IsDynamic  like @CommonSerachParam
			 OR Owin_FormInfo.IsSuperAdmin  like @CommonSerachParam
			 OR Owin_FormInfo.IsVisibleInMenu  like @CommonSerachParam
			
			
			
			
			
			
			
 THEN 1 ELSE 0 END = 1)			)
			SELECT * 
			FROM  tempPagedowin_forminfo
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
Create PROCEDURE owin_forminfo_GS
		@AppFormID bigint  = NULL,
		@FormName nvarchar (150) = NULL,
		@FormNameAr nvarchar (150) = NULL,
		@ParentID bigint  = NULL,
		@LevelID int  = NULL,
		@MenuLevel nvarchar (50) = NULL,
		@HasDirectChild bit  = NULL,
		@Icon image  = NULL,
		@ClassIcon nvarchar (50) = NULL,
		@Sequence int  = NULL,
		@URL nvarchar (200) = NULL,
		@IsView bit  = NULL,
		@IsDynamic bit  = NULL,
		@IsSuperAdmin bit  = NULL,
		@IsVisibleInMenu bit  = NULL,
		    
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
			Owin_FormInfo.AppFormID,
			Owin_FormInfo.FormName,
			Owin_FormInfo.FormNameAr,
			Owin_FormInfo.ParentID,
			Owin_FormInfo.LevelID,
			Owin_FormInfo.MenuLevel,
			Owin_FormInfo.HasDirectChild,
			Owin_FormInfo.Icon,
			Owin_FormInfo.ClassIcon,
			Owin_FormInfo.Sequence,
			Owin_FormInfo.URL,
			Owin_FormInfo.IsView,
			Owin_FormInfo.IsDynamic,
			Owin_FormInfo.IsSuperAdmin,
			Owin_FormInfo.IsVisibleInMenu,
			Owin_FormInfo.TransID,
			Owin_FormInfo.CreatedByUserName,
			Owin_FormInfo.CreatedDate,
			Owin_FormInfo.UpdatedByUserName,
			Owin_FormInfo.UpdatedDate,
			Owin_FormInfo.IPAddress,
			CONVERT(bigint, TS) as TS
		FROM Owin_FormInfo 
		where
			AppFormID = @AppFormID
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
Create PROCEDURE owin_lastworkingpage_GAPgListView 
		@LastPageID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@LastEntryDate datetime  = NULL,
				
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
					owin_lastworkingpage
				WHERE 
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 					Owin_LastWorkingPage.LastPageID  like @CommonSerachParam
					 OR Owin_LastWorkingPage.AppFormID  like @CommonSerachParam
					 OR Owin_LastWorkingPage.UserID  like @CommonSerachParam
					 OR Owin_LastWorkingPage.MasterUserID  like @CommonSerachParam
					 OR Owin_LastWorkingPage.LastEntryDate  like @CommonSerachParam
					
					
					
					
					
					
					
 THEN 1 ELSE 0 END = 1)			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_lastworkingpage AS
			(
				  SELECT 
			Owin_LastWorkingPage.LastPageID,
			Owin_LastWorkingPage.AppFormID,
			Owin_LastWorkingPage.UserID,
			Owin_LastWorkingPage.MasterUserID,
			Owin_LastWorkingPage.LastEntryDate,
			Owin_LastWorkingPage.TransID,
			Owin_LastWorkingPage.CreatedByUserName,
			Owin_LastWorkingPage.CreatedDate,
			Owin_LastWorkingPage.UpdatedByUserName,
			Owin_LastWorkingPage.UpdatedDate,
			Owin_LastWorkingPage.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='LastPageID ASC' THEN Owin_LastWorkingPage.LastPageID END ASC,
						CASE WHEN @SortExpression ='LastPageID DESC' THEN Owin_LastWorkingPage.LastPageID END DESC,
						CASE WHEN @SortExpression ='AppFormID ASC' THEN Owin_LastWorkingPage.AppFormID END ASC,
						CASE WHEN @SortExpression ='AppFormID DESC' THEN Owin_LastWorkingPage.AppFormID END DESC,
						CASE WHEN @SortExpression ='UserID ASC' THEN Owin_LastWorkingPage.UserID END ASC,
						CASE WHEN @SortExpression ='UserID DESC' THEN Owin_LastWorkingPage.UserID END DESC,
						CASE WHEN @SortExpression ='MasterUserID ASC' THEN Owin_LastWorkingPage.MasterUserID END ASC,
						CASE WHEN @SortExpression ='MasterUserID DESC' THEN Owin_LastWorkingPage.MasterUserID END DESC,
						CASE WHEN @SortExpression ='LastEntryDate ASC' THEN Owin_LastWorkingPage.LastEntryDate END ASC,
						CASE WHEN @SortExpression ='LastEntryDate DESC' THEN Owin_LastWorkingPage.LastEntryDate END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_LastWorkingPage.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_LastWorkingPage.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_LastWorkingPage.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_LastWorkingPage.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_LastWorkingPage.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_LastWorkingPage.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_LastWorkingPage.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_LastWorkingPage.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_LastWorkingPage.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_LastWorkingPage.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_LastWorkingPage.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_LastWorkingPage.IPAddress END DESC
				) as RowNumber
		FROM Owin_LastWorkingPage 
		where
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 			Owin_LastWorkingPage.LastPageID  like @CommonSerachParam
			 OR Owin_LastWorkingPage.AppFormID  like @CommonSerachParam
			 OR Owin_LastWorkingPage.UserID  like @CommonSerachParam
			 OR Owin_LastWorkingPage.MasterUserID  like @CommonSerachParam
			 OR Owin_LastWorkingPage.LastEntryDate  like @CommonSerachParam
			
			
			
			
			
			
			
 THEN 1 ELSE 0 END = 1)			)
			SELECT * 
			FROM  tempPagedowin_lastworkingpage
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
Create PROCEDURE owin_lastworkingpage_GS
		@LastPageID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@LastEntryDate datetime  = NULL,
		    
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
			Owin_LastWorkingPage.LastPageID,
			Owin_LastWorkingPage.AppFormID,
			Owin_LastWorkingPage.UserID,
			Owin_LastWorkingPage.MasterUserID,
			Owin_LastWorkingPage.LastEntryDate,
			Owin_LastWorkingPage.TransID,
			Owin_LastWorkingPage.CreatedByUserName,
			Owin_LastWorkingPage.CreatedDate,
			Owin_LastWorkingPage.UpdatedByUserName,
			Owin_LastWorkingPage.UpdatedDate,
			Owin_LastWorkingPage.IPAddress,
			CONVERT(bigint, TS) as TS
		FROM Owin_LastWorkingPage 
		where
			LastPageID = @LastPageID
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
Create PROCEDURE owin_role_GAPgListView 
		@RoleID bigint  = NULL,
		@RoleName nvarchar (250) = NULL,
		@Description nvarchar (500) = NULL,
				
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
					owin_role
				WHERE 
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 					Owin_Role.RoleID  like @CommonSerachParam
					 OR Owin_Role.RoleName  like @CommonSerachParam
					 OR Owin_Role.Description  like @CommonSerachParam
					
					
					
					
					
					
					
 THEN 1 ELSE 0 END = 1)			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_role AS
			(
				  SELECT 
			Owin_Role.RoleID,
			Owin_Role.RoleName,
			Owin_Role.Description,
			Owin_Role.TransID,
			Owin_Role.CreatedByUserName,
			Owin_Role.CreatedDate,
			Owin_Role.UpdatedByUserName,
			Owin_Role.UpdatedDate,
			Owin_Role.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='RoleID ASC' THEN Owin_Role.RoleID END ASC,
						CASE WHEN @SortExpression ='RoleID DESC' THEN Owin_Role.RoleID END DESC,
						CASE WHEN @SortExpression ='RoleName ASC' THEN Owin_Role.RoleName END ASC,
						CASE WHEN @SortExpression ='RoleName DESC' THEN Owin_Role.RoleName END DESC,
						CASE WHEN @SortExpression ='Description ASC' THEN Owin_Role.Description END ASC,
						CASE WHEN @SortExpression ='Description DESC' THEN Owin_Role.Description END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_Role.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_Role.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_Role.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_Role.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_Role.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_Role.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_Role.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_Role.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_Role.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_Role.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_Role.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_Role.IPAddress END DESC
				) as RowNumber
		FROM Owin_Role 
		where
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 			Owin_Role.RoleID  like @CommonSerachParam
			 OR Owin_Role.RoleName  like @CommonSerachParam
			 OR Owin_Role.Description  like @CommonSerachParam
			
			
			
			
			
			
			
 THEN 1 ELSE 0 END = 1)			)
			SELECT * 
			FROM  tempPagedowin_role
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
Create PROCEDURE owin_role_GS
		@RoleID bigint  = NULL,
		@RoleName nvarchar (250) = NULL,
		@Description nvarchar (500) = NULL,
		    
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
			Owin_Role.RoleID,
			Owin_Role.RoleName,
			Owin_Role.Description,
			Owin_Role.TransID,
			Owin_Role.CreatedByUserName,
			Owin_Role.CreatedDate,
			Owin_Role.UpdatedByUserName,
			Owin_Role.UpdatedDate,
			Owin_Role.IPAddress,
			CONVERT(bigint, TS) as TS
		FROM Owin_Role 
		where
			RoleID = @RoleID
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
Create PROCEDURE owin_rolepermission_GAPgListView 
		@RolePremissionID bigint  = NULL,
		@RoleID bigint  = NULL,
		@FormActionID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@Status bit  = NULL,
				
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
					owin_rolepermission
				WHERE 
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 					Owin_RolePermission.RolePremissionID  like @CommonSerachParam
					 OR Owin_RolePermission.RoleID  like @CommonSerachParam
					 OR Owin_RolePermission.FormActionID  like @CommonSerachParam
					 OR Owin_RolePermission.AppFormID  like @CommonSerachParam
					 OR Owin_RolePermission.Status  like @CommonSerachParam
					
					
					
					
					
					
					
 THEN 1 ELSE 0 END = 1)			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_rolepermission AS
			(
				  SELECT 
			Owin_RolePermission.RolePremissionID,
			Owin_RolePermission.RoleID,
			Owin_RolePermission.FormActionID,
			Owin_RolePermission.AppFormID,
			Owin_RolePermission.Status,
			Owin_RolePermission.TransID,
			Owin_RolePermission.CreatedByUserName,
			Owin_RolePermission.CreatedDate,
			Owin_RolePermission.UpdatedByUserName,
			Owin_RolePermission.UpdatedDate,
			Owin_RolePermission.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='RolePremissionID ASC' THEN Owin_RolePermission.RolePremissionID END ASC,
						CASE WHEN @SortExpression ='RolePremissionID DESC' THEN Owin_RolePermission.RolePremissionID END DESC,
						CASE WHEN @SortExpression ='RoleID ASC' THEN Owin_RolePermission.RoleID END ASC,
						CASE WHEN @SortExpression ='RoleID DESC' THEN Owin_RolePermission.RoleID END DESC,
						CASE WHEN @SortExpression ='FormActionID ASC' THEN Owin_RolePermission.FormActionID END ASC,
						CASE WHEN @SortExpression ='FormActionID DESC' THEN Owin_RolePermission.FormActionID END DESC,
						CASE WHEN @SortExpression ='AppFormID ASC' THEN Owin_RolePermission.AppFormID END ASC,
						CASE WHEN @SortExpression ='AppFormID DESC' THEN Owin_RolePermission.AppFormID END DESC,
						CASE WHEN @SortExpression ='Status ASC' THEN Owin_RolePermission.Status END ASC,
						CASE WHEN @SortExpression ='Status DESC' THEN Owin_RolePermission.Status END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_RolePermission.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_RolePermission.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_RolePermission.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_RolePermission.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_RolePermission.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_RolePermission.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_RolePermission.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_RolePermission.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_RolePermission.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_RolePermission.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_RolePermission.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_RolePermission.IPAddress END DESC
				) as RowNumber
		FROM Owin_RolePermission 
		where
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 			Owin_RolePermission.RolePremissionID  like @CommonSerachParam
			 OR Owin_RolePermission.RoleID  like @CommonSerachParam
			 OR Owin_RolePermission.FormActionID  like @CommonSerachParam
			 OR Owin_RolePermission.AppFormID  like @CommonSerachParam
			 OR Owin_RolePermission.Status  like @CommonSerachParam
			
			
			
			
			
			
			
 THEN 1 ELSE 0 END = 1)			)
			SELECT * 
			FROM  tempPagedowin_rolepermission
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
Create PROCEDURE owin_rolepermission_GS
		@RolePremissionID bigint  = NULL,
		@RoleID bigint  = NULL,
		@FormActionID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@Status bit  = NULL,
		    
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
			Owin_RolePermission.RolePremissionID,
			Owin_RolePermission.RoleID,
			Owin_RolePermission.FormActionID,
			Owin_RolePermission.AppFormID,
			Owin_RolePermission.Status,
			Owin_RolePermission.TransID,
			Owin_RolePermission.CreatedByUserName,
			Owin_RolePermission.CreatedDate,
			Owin_RolePermission.UpdatedByUserName,
			Owin_RolePermission.UpdatedDate,
			Owin_RolePermission.IPAddress,
			CONVERT(bigint, TS) as TS
		FROM Owin_RolePermission 
		where
			RolePremissionID = @RolePremissionID
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
Create PROCEDURE owin_user_GAPgListView 
		@ApplicationId uniqueidentifier  = NULL,
		@UserId uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@UserName nvarchar (256) = NULL,
		@EmailAddress nvarchar (150) = NULL,
		@LoweredUserName nvarchar (256) = NULL,
		@MobileNumber nvarchar (16) = NULL,
		@UserProfilePhoto nvarchar (250) = NULL,
		@IsAnonymous bit  = NULL,
		@IsChildEnable bit  = NULL,
		@MasPrivateKey nvarchar (1000) = NULL,
		@MasPublicKey nvarchar (1000) = NULL,
		@Password nvarchar (500) = NULL,
		@PasswordSalt nvarchar (500) = NULL,
		@PasswordKey nvarchar (500) = NULL,
		@PasswordVector nvarchar (500) = NULL,
		@MobilePIN nvarchar (16) = NULL,
		@PasswordQuestion nvarchar (256) = NULL,
		@PasswordAnswer nvarchar (128) = NULL,
		@Approved bit  = NULL,
		@Locked bit  = NULL,
		@LastLoginDate datetime  = NULL,
		@LastPassChangedDate datetime  = NULL,
		@LastLockoutDate datetime  = NULL,
		@FailedPasswordAttemptCount int  = NULL,
		@Comment nvarchar (550) = NULL,
		@LastActivityDate datetime  = NULL,
		@IsReviewed bit  = NULL,
		@ReviewedBy bigint  = NULL,
		@ReviewedByUserName nvarchar (150) = NULL,
		@ReviewedDate datetime  = NULL,
		@IsApproved bit  = NULL,
		@ApprovedBy bigint  = NULL,
		@ApprovedByUserName nvarchar (150) = NULL,
		@ApprovedDate datetime  = NULL,
		@IsEmailConfirmed bit  = NULL,
		@EmailConfirmationByUserDate datetime  = NULL,
		@TwoFactorEnable bit  = NULL,
		@IsMobileNumberConfirmed bit  = NULL,
		@MobileNumberConfirmedByUserDate datetime  = NULL,
		@SecurityStamp nvarchar (MAX) = NULL,
		@ConcurrencyStamp nvarchar (MAX) = NULL,
				
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
					owin_user
				WHERE 
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 					Owin_User.ApplicationId  like @CommonSerachParam
					 OR Owin_User.UserId  like @CommonSerachParam
					 OR Owin_User.MasterUserID  like @CommonSerachParam
					 OR Owin_User.UserName  like @CommonSerachParam
					 OR Owin_User.EmailAddress  like @CommonSerachParam
					 OR Owin_User.LoweredUserName  like @CommonSerachParam
					 OR Owin_User.MobileNumber  like @CommonSerachParam
					 OR Owin_User.UserProfilePhoto  like @CommonSerachParam
					 OR Owin_User.IsAnonymous  like @CommonSerachParam
					 OR Owin_User.IsChildEnable  like @CommonSerachParam
					 OR Owin_User.MasPrivateKey  like @CommonSerachParam
					 OR Owin_User.MasPublicKey  like @CommonSerachParam
					 OR Owin_User.Password  like @CommonSerachParam
					 OR Owin_User.PasswordSalt  like @CommonSerachParam
					 OR Owin_User.PasswordKey  like @CommonSerachParam
					 OR Owin_User.PasswordVector  like @CommonSerachParam
					 OR Owin_User.MobilePIN  like @CommonSerachParam
					 OR Owin_User.PasswordQuestion  like @CommonSerachParam
					 OR Owin_User.PasswordAnswer  like @CommonSerachParam
					 OR Owin_User.Approved  like @CommonSerachParam
					 OR Owin_User.Locked  like @CommonSerachParam
					 OR Owin_User.LastLoginDate  like @CommonSerachParam
					 OR Owin_User.LastPassChangedDate  like @CommonSerachParam
					 OR Owin_User.LastLockoutDate  like @CommonSerachParam
					 OR Owin_User.FailedPasswordAttemptCount  like @CommonSerachParam
					 OR Owin_User.Comment  like @CommonSerachParam
					 OR Owin_User.LastActivityDate  like @CommonSerachParam
					 OR Owin_User.IsReviewed  like @CommonSerachParam
					 OR Owin_User.ReviewedBy  like @CommonSerachParam
					 OR Owin_User.ReviewedByUserName  like @CommonSerachParam
					 OR Owin_User.ReviewedDate  like @CommonSerachParam
					 OR Owin_User.IsApproved  like @CommonSerachParam
					 OR Owin_User.ApprovedBy  like @CommonSerachParam
					 OR Owin_User.ApprovedByUserName  like @CommonSerachParam
					 OR Owin_User.ApprovedDate  like @CommonSerachParam
					 OR Owin_User.IsEmailConfirmed  like @CommonSerachParam
					 OR Owin_User.EmailConfirmationByUserDate  like @CommonSerachParam
					 OR Owin_User.TwoFactorEnable  like @CommonSerachParam
					 OR Owin_User.IsMobileNumberConfirmed  like @CommonSerachParam
					 OR Owin_User.MobileNumberConfirmedByUserDate  like @CommonSerachParam
					 OR Owin_User.SecurityStamp  like @CommonSerachParam
					 OR Owin_User.ConcurrencyStamp  like @CommonSerachParam
					
					
					
					
					
					
					
 THEN 1 ELSE 0 END = 1)			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_user AS
			(
				  SELECT 
			Owin_User.ApplicationId,
			Owin_User.UserId,
			Owin_User.MasterUserID,
			Owin_User.UserName,
			Owin_User.EmailAddress,
			Owin_User.LoweredUserName,
			Owin_User.MobileNumber,
			Owin_User.UserProfilePhoto,
			Owin_User.IsAnonymous,
			Owin_User.IsChildEnable,
			Owin_User.MasPrivateKey,
			Owin_User.MasPublicKey,
			Owin_User.Password,
			Owin_User.PasswordSalt,
			Owin_User.PasswordKey,
			Owin_User.PasswordVector,
			Owin_User.MobilePIN,
			Owin_User.PasswordQuestion,
			Owin_User.PasswordAnswer,
			Owin_User.Approved,
			Owin_User.Locked,
			Owin_User.LastLoginDate,
			Owin_User.LastPassChangedDate,
			Owin_User.LastLockoutDate,
			Owin_User.FailedPasswordAttemptCount,
			Owin_User.Comment,
			Owin_User.LastActivityDate,
			Owin_User.IsReviewed,
			Owin_User.ReviewedBy,
			Owin_User.ReviewedByUserName,
			Owin_User.ReviewedDate,
			Owin_User.IsApproved,
			Owin_User.ApprovedBy,
			Owin_User.ApprovedByUserName,
			Owin_User.ApprovedDate,
			Owin_User.IsEmailConfirmed,
			Owin_User.EmailConfirmationByUserDate,
			Owin_User.TwoFactorEnable,
			Owin_User.IsMobileNumberConfirmed,
			Owin_User.MobileNumberConfirmedByUserDate,
			Owin_User.SecurityStamp,
			Owin_User.ConcurrencyStamp,
			Owin_User.TransID,
			Owin_User.CreatedByUserName,
			Owin_User.CreatedDate,
			Owin_User.UpdatedByUserName,
			Owin_User.UpdatedDate,
			Owin_User.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='ApplicationId ASC' THEN Owin_User.ApplicationId END ASC,
						CASE WHEN @SortExpression ='ApplicationId DESC' THEN Owin_User.ApplicationId END DESC,
						CASE WHEN @SortExpression ='UserId ASC' THEN Owin_User.UserId END ASC,
						CASE WHEN @SortExpression ='UserId DESC' THEN Owin_User.UserId END DESC,
						CASE WHEN @SortExpression ='MasterUserID ASC' THEN Owin_User.MasterUserID END ASC,
						CASE WHEN @SortExpression ='MasterUserID DESC' THEN Owin_User.MasterUserID END DESC,
						CASE WHEN @SortExpression ='UserName ASC' THEN Owin_User.UserName END ASC,
						CASE WHEN @SortExpression ='UserName DESC' THEN Owin_User.UserName END DESC,
						CASE WHEN @SortExpression ='EmailAddress ASC' THEN Owin_User.EmailAddress END ASC,
						CASE WHEN @SortExpression ='EmailAddress DESC' THEN Owin_User.EmailAddress END DESC,
						CASE WHEN @SortExpression ='LoweredUserName ASC' THEN Owin_User.LoweredUserName END ASC,
						CASE WHEN @SortExpression ='LoweredUserName DESC' THEN Owin_User.LoweredUserName END DESC,
						CASE WHEN @SortExpression ='MobileNumber ASC' THEN Owin_User.MobileNumber END ASC,
						CASE WHEN @SortExpression ='MobileNumber DESC' THEN Owin_User.MobileNumber END DESC,
						CASE WHEN @SortExpression ='UserProfilePhoto ASC' THEN Owin_User.UserProfilePhoto END ASC,
						CASE WHEN @SortExpression ='UserProfilePhoto DESC' THEN Owin_User.UserProfilePhoto END DESC,
						CASE WHEN @SortExpression ='IsAnonymous ASC' THEN Owin_User.IsAnonymous END ASC,
						CASE WHEN @SortExpression ='IsAnonymous DESC' THEN Owin_User.IsAnonymous END DESC,
						CASE WHEN @SortExpression ='IsChildEnable ASC' THEN Owin_User.IsChildEnable END ASC,
						CASE WHEN @SortExpression ='IsChildEnable DESC' THEN Owin_User.IsChildEnable END DESC,
						CASE WHEN @SortExpression ='MasPrivateKey ASC' THEN Owin_User.MasPrivateKey END ASC,
						CASE WHEN @SortExpression ='MasPrivateKey DESC' THEN Owin_User.MasPrivateKey END DESC,
						CASE WHEN @SortExpression ='MasPublicKey ASC' THEN Owin_User.MasPublicKey END ASC,
						CASE WHEN @SortExpression ='MasPublicKey DESC' THEN Owin_User.MasPublicKey END DESC,
						CASE WHEN @SortExpression ='Password ASC' THEN Owin_User.Password END ASC,
						CASE WHEN @SortExpression ='Password DESC' THEN Owin_User.Password END DESC,
						CASE WHEN @SortExpression ='PasswordSalt ASC' THEN Owin_User.PasswordSalt END ASC,
						CASE WHEN @SortExpression ='PasswordSalt DESC' THEN Owin_User.PasswordSalt END DESC,
						CASE WHEN @SortExpression ='PasswordKey ASC' THEN Owin_User.PasswordKey END ASC,
						CASE WHEN @SortExpression ='PasswordKey DESC' THEN Owin_User.PasswordKey END DESC,
						CASE WHEN @SortExpression ='PasswordVector ASC' THEN Owin_User.PasswordVector END ASC,
						CASE WHEN @SortExpression ='PasswordVector DESC' THEN Owin_User.PasswordVector END DESC,
						CASE WHEN @SortExpression ='MobilePIN ASC' THEN Owin_User.MobilePIN END ASC,
						CASE WHEN @SortExpression ='MobilePIN DESC' THEN Owin_User.MobilePIN END DESC,
						CASE WHEN @SortExpression ='PasswordQuestion ASC' THEN Owin_User.PasswordQuestion END ASC,
						CASE WHEN @SortExpression ='PasswordQuestion DESC' THEN Owin_User.PasswordQuestion END DESC,
						CASE WHEN @SortExpression ='PasswordAnswer ASC' THEN Owin_User.PasswordAnswer END ASC,
						CASE WHEN @SortExpression ='PasswordAnswer DESC' THEN Owin_User.PasswordAnswer END DESC,
						CASE WHEN @SortExpression ='Approved ASC' THEN Owin_User.Approved END ASC,
						CASE WHEN @SortExpression ='Approved DESC' THEN Owin_User.Approved END DESC,
						CASE WHEN @SortExpression ='Locked ASC' THEN Owin_User.Locked END ASC,
						CASE WHEN @SortExpression ='Locked DESC' THEN Owin_User.Locked END DESC,
						CASE WHEN @SortExpression ='LastLoginDate ASC' THEN Owin_User.LastLoginDate END ASC,
						CASE WHEN @SortExpression ='LastLoginDate DESC' THEN Owin_User.LastLoginDate END DESC,
						CASE WHEN @SortExpression ='LastPassChangedDate ASC' THEN Owin_User.LastPassChangedDate END ASC,
						CASE WHEN @SortExpression ='LastPassChangedDate DESC' THEN Owin_User.LastPassChangedDate END DESC,
						CASE WHEN @SortExpression ='LastLockoutDate ASC' THEN Owin_User.LastLockoutDate END ASC,
						CASE WHEN @SortExpression ='LastLockoutDate DESC' THEN Owin_User.LastLockoutDate END DESC,
						CASE WHEN @SortExpression ='FailedPasswordAttemptCount ASC' THEN Owin_User.FailedPasswordAttemptCount END ASC,
						CASE WHEN @SortExpression ='FailedPasswordAttemptCount DESC' THEN Owin_User.FailedPasswordAttemptCount END DESC,
						CASE WHEN @SortExpression ='Comment ASC' THEN Owin_User.Comment END ASC,
						CASE WHEN @SortExpression ='Comment DESC' THEN Owin_User.Comment END DESC,
						CASE WHEN @SortExpression ='LastActivityDate ASC' THEN Owin_User.LastActivityDate END ASC,
						CASE WHEN @SortExpression ='LastActivityDate DESC' THEN Owin_User.LastActivityDate END DESC,
						CASE WHEN @SortExpression ='IsReviewed ASC' THEN Owin_User.IsReviewed END ASC,
						CASE WHEN @SortExpression ='IsReviewed DESC' THEN Owin_User.IsReviewed END DESC,
						CASE WHEN @SortExpression ='ReviewedBy ASC' THEN Owin_User.ReviewedBy END ASC,
						CASE WHEN @SortExpression ='ReviewedBy DESC' THEN Owin_User.ReviewedBy END DESC,
						CASE WHEN @SortExpression ='ReviewedByUserName ASC' THEN Owin_User.ReviewedByUserName END ASC,
						CASE WHEN @SortExpression ='ReviewedByUserName DESC' THEN Owin_User.ReviewedByUserName END DESC,
						CASE WHEN @SortExpression ='ReviewedDate ASC' THEN Owin_User.ReviewedDate END ASC,
						CASE WHEN @SortExpression ='ReviewedDate DESC' THEN Owin_User.ReviewedDate END DESC,
						CASE WHEN @SortExpression ='IsApproved ASC' THEN Owin_User.IsApproved END ASC,
						CASE WHEN @SortExpression ='IsApproved DESC' THEN Owin_User.IsApproved END DESC,
						CASE WHEN @SortExpression ='ApprovedBy ASC' THEN Owin_User.ApprovedBy END ASC,
						CASE WHEN @SortExpression ='ApprovedBy DESC' THEN Owin_User.ApprovedBy END DESC,
						CASE WHEN @SortExpression ='ApprovedByUserName ASC' THEN Owin_User.ApprovedByUserName END ASC,
						CASE WHEN @SortExpression ='ApprovedByUserName DESC' THEN Owin_User.ApprovedByUserName END DESC,
						CASE WHEN @SortExpression ='ApprovedDate ASC' THEN Owin_User.ApprovedDate END ASC,
						CASE WHEN @SortExpression ='ApprovedDate DESC' THEN Owin_User.ApprovedDate END DESC,
						CASE WHEN @SortExpression ='IsEmailConfirmed ASC' THEN Owin_User.IsEmailConfirmed END ASC,
						CASE WHEN @SortExpression ='IsEmailConfirmed DESC' THEN Owin_User.IsEmailConfirmed END DESC,
						CASE WHEN @SortExpression ='EmailConfirmationByUserDate ASC' THEN Owin_User.EmailConfirmationByUserDate END ASC,
						CASE WHEN @SortExpression ='EmailConfirmationByUserDate DESC' THEN Owin_User.EmailConfirmationByUserDate END DESC,
						CASE WHEN @SortExpression ='TwoFactorEnable ASC' THEN Owin_User.TwoFactorEnable END ASC,
						CASE WHEN @SortExpression ='TwoFactorEnable DESC' THEN Owin_User.TwoFactorEnable END DESC,
						CASE WHEN @SortExpression ='IsMobileNumberConfirmed ASC' THEN Owin_User.IsMobileNumberConfirmed END ASC,
						CASE WHEN @SortExpression ='IsMobileNumberConfirmed DESC' THEN Owin_User.IsMobileNumberConfirmed END DESC,
						CASE WHEN @SortExpression ='MobileNumberConfirmedByUserDate ASC' THEN Owin_User.MobileNumberConfirmedByUserDate END ASC,
						CASE WHEN @SortExpression ='MobileNumberConfirmedByUserDate DESC' THEN Owin_User.MobileNumberConfirmedByUserDate END DESC,
						CASE WHEN @SortExpression ='SecurityStamp ASC' THEN Owin_User.SecurityStamp END ASC,
						CASE WHEN @SortExpression ='SecurityStamp DESC' THEN Owin_User.SecurityStamp END DESC,
						CASE WHEN @SortExpression ='ConcurrencyStamp ASC' THEN Owin_User.ConcurrencyStamp END ASC,
						CASE WHEN @SortExpression ='ConcurrencyStamp DESC' THEN Owin_User.ConcurrencyStamp END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_User.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_User.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_User.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_User.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_User.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_User.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_User.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_User.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_User.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_User.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_User.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_User.IPAddress END DESC
				) as RowNumber
		FROM Owin_User 
		where
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 			Owin_User.ApplicationId  like @CommonSerachParam
			 OR Owin_User.UserId  like @CommonSerachParam
			 OR Owin_User.MasterUserID  like @CommonSerachParam
			 OR Owin_User.UserName  like @CommonSerachParam
			 OR Owin_User.EmailAddress  like @CommonSerachParam
			 OR Owin_User.LoweredUserName  like @CommonSerachParam
			 OR Owin_User.MobileNumber  like @CommonSerachParam
			 OR Owin_User.UserProfilePhoto  like @CommonSerachParam
			 OR Owin_User.IsAnonymous  like @CommonSerachParam
			 OR Owin_User.IsChildEnable  like @CommonSerachParam
			 OR Owin_User.MasPrivateKey  like @CommonSerachParam
			 OR Owin_User.MasPublicKey  like @CommonSerachParam
			 OR Owin_User.Password  like @CommonSerachParam
			 OR Owin_User.PasswordSalt  like @CommonSerachParam
			 OR Owin_User.PasswordKey  like @CommonSerachParam
			 OR Owin_User.PasswordVector  like @CommonSerachParam
			 OR Owin_User.MobilePIN  like @CommonSerachParam
			 OR Owin_User.PasswordQuestion  like @CommonSerachParam
			 OR Owin_User.PasswordAnswer  like @CommonSerachParam
			 OR Owin_User.Approved  like @CommonSerachParam
			 OR Owin_User.Locked  like @CommonSerachParam
			 OR Owin_User.LastLoginDate  like @CommonSerachParam
			 OR Owin_User.LastPassChangedDate  like @CommonSerachParam
			 OR Owin_User.LastLockoutDate  like @CommonSerachParam
			 OR Owin_User.FailedPasswordAttemptCount  like @CommonSerachParam
			 OR Owin_User.Comment  like @CommonSerachParam
			 OR Owin_User.LastActivityDate  like @CommonSerachParam
			 OR Owin_User.IsReviewed  like @CommonSerachParam
			 OR Owin_User.ReviewedBy  like @CommonSerachParam
			 OR Owin_User.ReviewedByUserName  like @CommonSerachParam
			 OR Owin_User.ReviewedDate  like @CommonSerachParam
			 OR Owin_User.IsApproved  like @CommonSerachParam
			 OR Owin_User.ApprovedBy  like @CommonSerachParam
			 OR Owin_User.ApprovedByUserName  like @CommonSerachParam
			 OR Owin_User.ApprovedDate  like @CommonSerachParam
			 OR Owin_User.IsEmailConfirmed  like @CommonSerachParam
			 OR Owin_User.EmailConfirmationByUserDate  like @CommonSerachParam
			 OR Owin_User.TwoFactorEnable  like @CommonSerachParam
			 OR Owin_User.IsMobileNumberConfirmed  like @CommonSerachParam
			 OR Owin_User.MobileNumberConfirmedByUserDate  like @CommonSerachParam
			 OR Owin_User.SecurityStamp  like @CommonSerachParam
			 OR Owin_User.ConcurrencyStamp  like @CommonSerachParam
			
			
			
			
			
			
			
 THEN 1 ELSE 0 END = 1)			)
			SELECT * 
			FROM  tempPagedowin_user
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
Create PROCEDURE owin_user_GS
		@ApplicationId uniqueidentifier  = NULL,
		@UserId uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@UserName nvarchar (256) = NULL,
		@EmailAddress nvarchar (150) = NULL,
		@LoweredUserName nvarchar (256) = NULL,
		@MobileNumber nvarchar (16) = NULL,
		@UserProfilePhoto nvarchar (250) = NULL,
		@IsAnonymous bit  = NULL,
		@IsChildEnable bit  = NULL,
		@MasPrivateKey nvarchar (1000) = NULL,
		@MasPublicKey nvarchar (1000) = NULL,
		@Password nvarchar (500) = NULL,
		@PasswordSalt nvarchar (500) = NULL,
		@PasswordKey nvarchar (500) = NULL,
		@PasswordVector nvarchar (500) = NULL,
		@MobilePIN nvarchar (16) = NULL,
		@PasswordQuestion nvarchar (256) = NULL,
		@PasswordAnswer nvarchar (128) = NULL,
		@Approved bit  = NULL,
		@Locked bit  = NULL,
		@LastLoginDate datetime  = NULL,
		@LastPassChangedDate datetime  = NULL,
		@LastLockoutDate datetime  = NULL,
		@FailedPasswordAttemptCount int  = NULL,
		@Comment nvarchar (550) = NULL,
		@LastActivityDate datetime  = NULL,
		@IsReviewed bit  = NULL,
		@ReviewedBy bigint  = NULL,
		@ReviewedByUserName nvarchar (150) = NULL,
		@ReviewedDate datetime  = NULL,
		@IsApproved bit  = NULL,
		@ApprovedBy bigint  = NULL,
		@ApprovedByUserName nvarchar (150) = NULL,
		@ApprovedDate datetime  = NULL,
		@IsEmailConfirmed bit  = NULL,
		@EmailConfirmationByUserDate datetime  = NULL,
		@TwoFactorEnable bit  = NULL,
		@IsMobileNumberConfirmed bit  = NULL,
		@MobileNumberConfirmedByUserDate datetime  = NULL,
		@SecurityStamp nvarchar (MAX) = NULL,
		@ConcurrencyStamp nvarchar (MAX) = NULL,
		    
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
			Owin_User.ApplicationId,
			Owin_User.UserId,
			Owin_User.MasterUserID,
			Owin_User.UserName,
			Owin_User.EmailAddress,
			Owin_User.LoweredUserName,
			Owin_User.MobileNumber,
			Owin_User.UserProfilePhoto,
			Owin_User.IsAnonymous,
			Owin_User.IsChildEnable,
			Owin_User.MasPrivateKey,
			Owin_User.MasPublicKey,
			Owin_User.Password,
			Owin_User.PasswordSalt,
			Owin_User.PasswordKey,
			Owin_User.PasswordVector,
			Owin_User.MobilePIN,
			Owin_User.PasswordQuestion,
			Owin_User.PasswordAnswer,
			Owin_User.Approved,
			Owin_User.Locked,
			Owin_User.LastLoginDate,
			Owin_User.LastPassChangedDate,
			Owin_User.LastLockoutDate,
			Owin_User.FailedPasswordAttemptCount,
			Owin_User.Comment,
			Owin_User.LastActivityDate,
			Owin_User.IsReviewed,
			Owin_User.ReviewedBy,
			Owin_User.ReviewedByUserName,
			Owin_User.ReviewedDate,
			Owin_User.IsApproved,
			Owin_User.ApprovedBy,
			Owin_User.ApprovedByUserName,
			Owin_User.ApprovedDate,
			Owin_User.IsEmailConfirmed,
			Owin_User.EmailConfirmationByUserDate,
			Owin_User.TwoFactorEnable,
			Owin_User.IsMobileNumberConfirmed,
			Owin_User.MobileNumberConfirmedByUserDate,
			Owin_User.SecurityStamp,
			Owin_User.ConcurrencyStamp,
			Owin_User.TransID,
			Owin_User.CreatedByUserName,
			Owin_User.CreatedDate,
			Owin_User.UpdatedByUserName,
			Owin_User.UpdatedDate,
			Owin_User.IPAddress,
			CONVERT(bigint, TS) as TS
		FROM Owin_User 
		where
			UserId = @UserId
	END  
GO	

            
            
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
/*
Creator : KAF
*/
                    



            
            
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO	
/*
Creator : KAF
*/
--GET ALL
Create PROCEDURE owin_userclaims_GAPgListView 
		@Id int  = NULL,
		@ClaimType nvarchar (MAX) = NULL,
		@ClaimValue nvarchar (MAX) = NULL,
		@UserId uniqueidentifier  = NULL,
				
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
					owin_userclaims
				WHERE 
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 					Owin_UserClaims.Id  like @CommonSerachParam
					 OR Owin_UserClaims.ClaimType  like @CommonSerachParam
					 OR Owin_UserClaims.ClaimValue  like @CommonSerachParam
					 OR Owin_UserClaims.UserId  like @CommonSerachParam
					
					
					
					
					
					
					
 THEN 1 ELSE 0 END = 1)			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_userclaims AS
			(
				  SELECT 
			Owin_UserClaims.Id,
			Owin_UserClaims.ClaimType,
			Owin_UserClaims.ClaimValue,
			Owin_UserClaims.UserId,
			Owin_UserClaims.TransID,
			Owin_UserClaims.CreatedByUserName,
			Owin_UserClaims.CreatedDate,
			Owin_UserClaims.UpdatedByUserName,
			Owin_UserClaims.UpdatedDate,
			Owin_UserClaims.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='Id ASC' THEN Owin_UserClaims.Id END ASC,
						CASE WHEN @SortExpression ='Id DESC' THEN Owin_UserClaims.Id END DESC,
						CASE WHEN @SortExpression ='ClaimType ASC' THEN Owin_UserClaims.ClaimType END ASC,
						CASE WHEN @SortExpression ='ClaimType DESC' THEN Owin_UserClaims.ClaimType END DESC,
						CASE WHEN @SortExpression ='ClaimValue ASC' THEN Owin_UserClaims.ClaimValue END ASC,
						CASE WHEN @SortExpression ='ClaimValue DESC' THEN Owin_UserClaims.ClaimValue END DESC,
						CASE WHEN @SortExpression ='UserId ASC' THEN Owin_UserClaims.UserId END ASC,
						CASE WHEN @SortExpression ='UserId DESC' THEN Owin_UserClaims.UserId END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_UserClaims.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_UserClaims.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_UserClaims.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_UserClaims.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_UserClaims.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_UserClaims.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_UserClaims.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_UserClaims.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_UserClaims.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_UserClaims.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_UserClaims.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_UserClaims.IPAddress END DESC
				) as RowNumber
		FROM Owin_UserClaims 
		where
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 			Owin_UserClaims.Id  like @CommonSerachParam
			 OR Owin_UserClaims.ClaimType  like @CommonSerachParam
			 OR Owin_UserClaims.ClaimValue  like @CommonSerachParam
			 OR Owin_UserClaims.UserId  like @CommonSerachParam
			
			
			
			
			
			
			
 THEN 1 ELSE 0 END = 1)			)
			SELECT * 
			FROM  tempPagedowin_userclaims
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
Create PROCEDURE owin_userclaims_GS
		@Id int  = NULL,
		@ClaimType nvarchar (MAX) = NULL,
		@ClaimValue nvarchar (MAX) = NULL,
		@UserId uniqueidentifier  = NULL,
		    
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
			Owin_UserClaims.Id,
			Owin_UserClaims.ClaimType,
			Owin_UserClaims.ClaimValue,
			Owin_UserClaims.UserId,
			Owin_UserClaims.TransID,
			Owin_UserClaims.CreatedByUserName,
			Owin_UserClaims.CreatedDate,
			Owin_UserClaims.UpdatedByUserName,
			Owin_UserClaims.UpdatedDate,
			Owin_UserClaims.IPAddress,
			CONVERT(bigint, TS) as TS
		FROM Owin_UserClaims 
		where
			Id = @Id
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
Create PROCEDURE owin_userlogintrail_GAPgListView 
		@SerialNo bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@LoginFrom varchar (150) = NULL,
		@LoginDate datetime  = NULL,
		@LogoutDate datetime  = NULL,
		@MachineIP varchar (150) = NULL,
		@LoginStatus varchar (150) = NULL,
		@LoginStatusBit bit  = NULL,
		@SessionID varchar (150) = NULL,
		@UserToken varchar (250) = NULL,
				
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
					owin_userlogintrail
				WHERE 
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 					Owin_UserLoginTrail.SerialNo  like @CommonSerachParam
					 OR Owin_UserLoginTrail.UserID  like @CommonSerachParam
					 OR Owin_UserLoginTrail.MasterUserID  like @CommonSerachParam
					 OR Owin_UserLoginTrail.LoginFrom  like @CommonSerachParam
					 OR Owin_UserLoginTrail.LoginDate  like @CommonSerachParam
					 OR Owin_UserLoginTrail.LogoutDate  like @CommonSerachParam
					 OR Owin_UserLoginTrail.MachineIP  like @CommonSerachParam
					 OR Owin_UserLoginTrail.LoginStatus  like @CommonSerachParam
					 OR Owin_UserLoginTrail.LoginStatusBit  like @CommonSerachParam
					 OR Owin_UserLoginTrail.SessionID  like @CommonSerachParam
					 OR Owin_UserLoginTrail.UserToken  like @CommonSerachParam
					
					
					
					
					
					
					
 THEN 1 ELSE 0 END = 1)			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_userlogintrail AS
			(
				  SELECT 
			Owin_UserLoginTrail.SerialNo,
			Owin_UserLoginTrail.UserID,
			Owin_UserLoginTrail.MasterUserID,
			Owin_UserLoginTrail.LoginFrom,
			Owin_UserLoginTrail.LoginDate,
			Owin_UserLoginTrail.LogoutDate,
			Owin_UserLoginTrail.MachineIP,
			Owin_UserLoginTrail.LoginStatus,
			Owin_UserLoginTrail.LoginStatusBit,
			Owin_UserLoginTrail.SessionID,
			Owin_UserLoginTrail.UserToken,
			Owin_UserLoginTrail.TransID,
			Owin_UserLoginTrail.CreatedByUserName,
			Owin_UserLoginTrail.CreatedDate,
			Owin_UserLoginTrail.UpdatedByUserName,
			Owin_UserLoginTrail.UpdatedDate,
			Owin_UserLoginTrail.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='SerialNo ASC' THEN Owin_UserLoginTrail.SerialNo END ASC,
						CASE WHEN @SortExpression ='SerialNo DESC' THEN Owin_UserLoginTrail.SerialNo END DESC,
						CASE WHEN @SortExpression ='UserID ASC' THEN Owin_UserLoginTrail.UserID END ASC,
						CASE WHEN @SortExpression ='UserID DESC' THEN Owin_UserLoginTrail.UserID END DESC,
						CASE WHEN @SortExpression ='MasterUserID ASC' THEN Owin_UserLoginTrail.MasterUserID END ASC,
						CASE WHEN @SortExpression ='MasterUserID DESC' THEN Owin_UserLoginTrail.MasterUserID END DESC,
						CASE WHEN @SortExpression ='LoginFrom ASC' THEN Owin_UserLoginTrail.LoginFrom END ASC,
						CASE WHEN @SortExpression ='LoginFrom DESC' THEN Owin_UserLoginTrail.LoginFrom END DESC,
						CASE WHEN @SortExpression ='LoginDate ASC' THEN Owin_UserLoginTrail.LoginDate END ASC,
						CASE WHEN @SortExpression ='LoginDate DESC' THEN Owin_UserLoginTrail.LoginDate END DESC,
						CASE WHEN @SortExpression ='LogoutDate ASC' THEN Owin_UserLoginTrail.LogoutDate END ASC,
						CASE WHEN @SortExpression ='LogoutDate DESC' THEN Owin_UserLoginTrail.LogoutDate END DESC,
						CASE WHEN @SortExpression ='MachineIP ASC' THEN Owin_UserLoginTrail.MachineIP END ASC,
						CASE WHEN @SortExpression ='MachineIP DESC' THEN Owin_UserLoginTrail.MachineIP END DESC,
						CASE WHEN @SortExpression ='LoginStatus ASC' THEN Owin_UserLoginTrail.LoginStatus END ASC,
						CASE WHEN @SortExpression ='LoginStatus DESC' THEN Owin_UserLoginTrail.LoginStatus END DESC,
						CASE WHEN @SortExpression ='LoginStatusBit ASC' THEN Owin_UserLoginTrail.LoginStatusBit END ASC,
						CASE WHEN @SortExpression ='LoginStatusBit DESC' THEN Owin_UserLoginTrail.LoginStatusBit END DESC,
						CASE WHEN @SortExpression ='SessionID ASC' THEN Owin_UserLoginTrail.SessionID END ASC,
						CASE WHEN @SortExpression ='SessionID DESC' THEN Owin_UserLoginTrail.SessionID END DESC,
						CASE WHEN @SortExpression ='UserToken ASC' THEN Owin_UserLoginTrail.UserToken END ASC,
						CASE WHEN @SortExpression ='UserToken DESC' THEN Owin_UserLoginTrail.UserToken END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_UserLoginTrail.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_UserLoginTrail.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_UserLoginTrail.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_UserLoginTrail.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_UserLoginTrail.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_UserLoginTrail.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_UserLoginTrail.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_UserLoginTrail.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_UserLoginTrail.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_UserLoginTrail.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_UserLoginTrail.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_UserLoginTrail.IPAddress END DESC
				) as RowNumber
		FROM Owin_UserLoginTrail 
		where
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 			Owin_UserLoginTrail.SerialNo  like @CommonSerachParam
			 OR Owin_UserLoginTrail.UserID  like @CommonSerachParam
			 OR Owin_UserLoginTrail.MasterUserID  like @CommonSerachParam
			 OR Owin_UserLoginTrail.LoginFrom  like @CommonSerachParam
			 OR Owin_UserLoginTrail.LoginDate  like @CommonSerachParam
			 OR Owin_UserLoginTrail.LogoutDate  like @CommonSerachParam
			 OR Owin_UserLoginTrail.MachineIP  like @CommonSerachParam
			 OR Owin_UserLoginTrail.LoginStatus  like @CommonSerachParam
			 OR Owin_UserLoginTrail.LoginStatusBit  like @CommonSerachParam
			 OR Owin_UserLoginTrail.SessionID  like @CommonSerachParam
			 OR Owin_UserLoginTrail.UserToken  like @CommonSerachParam
			
			
			
			
			
			
			
 THEN 1 ELSE 0 END = 1)			)
			SELECT * 
			FROM  tempPagedowin_userlogintrail
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
Create PROCEDURE owin_userlogintrail_GS
		@SerialNo bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@LoginFrom varchar (150) = NULL,
		@LoginDate datetime  = NULL,
		@LogoutDate datetime  = NULL,
		@MachineIP varchar (150) = NULL,
		@LoginStatus varchar (150) = NULL,
		@LoginStatusBit bit  = NULL,
		@SessionID varchar (150) = NULL,
		@UserToken varchar (250) = NULL,
		    
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
			Owin_UserLoginTrail.SerialNo,
			Owin_UserLoginTrail.UserID,
			Owin_UserLoginTrail.MasterUserID,
			Owin_UserLoginTrail.LoginFrom,
			Owin_UserLoginTrail.LoginDate,
			Owin_UserLoginTrail.LogoutDate,
			Owin_UserLoginTrail.MachineIP,
			Owin_UserLoginTrail.LoginStatus,
			Owin_UserLoginTrail.LoginStatusBit,
			Owin_UserLoginTrail.SessionID,
			Owin_UserLoginTrail.UserToken,
			Owin_UserLoginTrail.TransID,
			Owin_UserLoginTrail.CreatedByUserName,
			Owin_UserLoginTrail.CreatedDate,
			Owin_UserLoginTrail.UpdatedByUserName,
			Owin_UserLoginTrail.UpdatedDate,
			Owin_UserLoginTrail.IPAddress,
			CONVERT(bigint, TS) as TS
		FROM Owin_UserLoginTrail 
		where
			SerialNo = @SerialNo
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
Create PROCEDURE owin_userpasswordresetinfo_GAPgListView 
		@Serial bigint  = NULL,
		@SessionID varchar (250) = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@SessionToken nvarchar (550) = NULL,
		@UserName nvarchar (150) = NULL,
		@IsActive bit  = NULL,
				
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
					owin_userpasswordresetinfo
				WHERE 
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 					Owin_UserPasswordResetInfo.Serial  like @CommonSerachParam
					 OR Owin_UserPasswordResetInfo.SessionID  like @CommonSerachParam
					 OR Owin_UserPasswordResetInfo.UserID  like @CommonSerachParam
					 OR Owin_UserPasswordResetInfo.MasterUserID  like @CommonSerachParam
					 OR Owin_UserPasswordResetInfo.SessionToken  like @CommonSerachParam
					 OR Owin_UserPasswordResetInfo.UserName  like @CommonSerachParam
					 OR Owin_UserPasswordResetInfo.IsActive  like @CommonSerachParam
					
					
					
					
					
					
					
 THEN 1 ELSE 0 END = 1)			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_userpasswordresetinfo AS
			(
				  SELECT 
			Owin_UserPasswordResetInfo.Serial,
			Owin_UserPasswordResetInfo.SessionID,
			Owin_UserPasswordResetInfo.UserID,
			Owin_UserPasswordResetInfo.MasterUserID,
			Owin_UserPasswordResetInfo.SessionToken,
			Owin_UserPasswordResetInfo.UserName,
			Owin_UserPasswordResetInfo.IsActive,
			Owin_UserPasswordResetInfo.TransID,
			Owin_UserPasswordResetInfo.CreatedByUserName,
			Owin_UserPasswordResetInfo.CreatedDate,
			Owin_UserPasswordResetInfo.UpdatedByUserName,
			Owin_UserPasswordResetInfo.UpdatedDate,
			Owin_UserPasswordResetInfo.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='Serial ASC' THEN Owin_UserPasswordResetInfo.Serial END ASC,
						CASE WHEN @SortExpression ='Serial DESC' THEN Owin_UserPasswordResetInfo.Serial END DESC,
						CASE WHEN @SortExpression ='SessionID ASC' THEN Owin_UserPasswordResetInfo.SessionID END ASC,
						CASE WHEN @SortExpression ='SessionID DESC' THEN Owin_UserPasswordResetInfo.SessionID END DESC,
						CASE WHEN @SortExpression ='UserID ASC' THEN Owin_UserPasswordResetInfo.UserID END ASC,
						CASE WHEN @SortExpression ='UserID DESC' THEN Owin_UserPasswordResetInfo.UserID END DESC,
						CASE WHEN @SortExpression ='MasterUserID ASC' THEN Owin_UserPasswordResetInfo.MasterUserID END ASC,
						CASE WHEN @SortExpression ='MasterUserID DESC' THEN Owin_UserPasswordResetInfo.MasterUserID END DESC,
						CASE WHEN @SortExpression ='SessionToken ASC' THEN Owin_UserPasswordResetInfo.SessionToken END ASC,
						CASE WHEN @SortExpression ='SessionToken DESC' THEN Owin_UserPasswordResetInfo.SessionToken END DESC,
						CASE WHEN @SortExpression ='UserName ASC' THEN Owin_UserPasswordResetInfo.UserName END ASC,
						CASE WHEN @SortExpression ='UserName DESC' THEN Owin_UserPasswordResetInfo.UserName END DESC,
						CASE WHEN @SortExpression ='IsActive ASC' THEN Owin_UserPasswordResetInfo.IsActive END ASC,
						CASE WHEN @SortExpression ='IsActive DESC' THEN Owin_UserPasswordResetInfo.IsActive END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_UserPasswordResetInfo.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_UserPasswordResetInfo.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_UserPasswordResetInfo.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_UserPasswordResetInfo.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_UserPasswordResetInfo.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_UserPasswordResetInfo.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_UserPasswordResetInfo.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_UserPasswordResetInfo.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_UserPasswordResetInfo.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_UserPasswordResetInfo.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_UserPasswordResetInfo.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_UserPasswordResetInfo.IPAddress END DESC
				) as RowNumber
		FROM Owin_UserPasswordResetInfo 
		where
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 			Owin_UserPasswordResetInfo.Serial  like @CommonSerachParam
			 OR Owin_UserPasswordResetInfo.SessionID  like @CommonSerachParam
			 OR Owin_UserPasswordResetInfo.UserID  like @CommonSerachParam
			 OR Owin_UserPasswordResetInfo.MasterUserID  like @CommonSerachParam
			 OR Owin_UserPasswordResetInfo.SessionToken  like @CommonSerachParam
			 OR Owin_UserPasswordResetInfo.UserName  like @CommonSerachParam
			 OR Owin_UserPasswordResetInfo.IsActive  like @CommonSerachParam
			
			
			
			
			
			
			
 THEN 1 ELSE 0 END = 1)			)
			SELECT * 
			FROM  tempPagedowin_userpasswordresetinfo
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
Create PROCEDURE owin_userpasswordresetinfo_GS
		@Serial bigint  = NULL,
		@SessionID varchar (250) = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@SessionToken nvarchar (550) = NULL,
		@UserName nvarchar (150) = NULL,
		@IsActive bit  = NULL,
		    
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
			Owin_UserPasswordResetInfo.Serial,
			Owin_UserPasswordResetInfo.SessionID,
			Owin_UserPasswordResetInfo.UserID,
			Owin_UserPasswordResetInfo.MasterUserID,
			Owin_UserPasswordResetInfo.SessionToken,
			Owin_UserPasswordResetInfo.UserName,
			Owin_UserPasswordResetInfo.IsActive,
			Owin_UserPasswordResetInfo.TransID,
			Owin_UserPasswordResetInfo.CreatedByUserName,
			Owin_UserPasswordResetInfo.CreatedDate,
			Owin_UserPasswordResetInfo.UpdatedByUserName,
			Owin_UserPasswordResetInfo.UpdatedDate,
			Owin_UserPasswordResetInfo.IPAddress,
			CONVERT(bigint, TS) as TS
		FROM Owin_UserPasswordResetInfo 
		where
			Serial = @Serial
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
Create PROCEDURE owin_userprefferencessettings_GAPgListView 
		@SerialNo bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@PrePageSize int  = NULL,
				
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
					owin_userprefferencessettings
				WHERE 
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 					Owin_UserPrefferencesSettings.SerialNo  like @CommonSerachParam
					 OR Owin_UserPrefferencesSettings.UserID  like @CommonSerachParam
					 OR Owin_UserPrefferencesSettings.MasterUserID  like @CommonSerachParam
					 OR Owin_UserPrefferencesSettings.AppFormID  like @CommonSerachParam
					 OR Owin_UserPrefferencesSettings.PrePageSize  like @CommonSerachParam
					
					
					
					
					
					
					
 THEN 1 ELSE 0 END = 1)			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_userprefferencessettings AS
			(
				  SELECT 
			Owin_UserPrefferencesSettings.SerialNo,
			Owin_UserPrefferencesSettings.UserID,
			Owin_UserPrefferencesSettings.MasterUserID,
			Owin_UserPrefferencesSettings.AppFormID,
			Owin_UserPrefferencesSettings.PrePageSize,
			Owin_UserPrefferencesSettings.TransID,
			Owin_UserPrefferencesSettings.CreatedByUserName,
			Owin_UserPrefferencesSettings.CreatedDate,
			Owin_UserPrefferencesSettings.UpdatedByUserName,
			Owin_UserPrefferencesSettings.UpdatedDate,
			Owin_UserPrefferencesSettings.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='SerialNo ASC' THEN Owin_UserPrefferencesSettings.SerialNo END ASC,
						CASE WHEN @SortExpression ='SerialNo DESC' THEN Owin_UserPrefferencesSettings.SerialNo END DESC,
						CASE WHEN @SortExpression ='UserID ASC' THEN Owin_UserPrefferencesSettings.UserID END ASC,
						CASE WHEN @SortExpression ='UserID DESC' THEN Owin_UserPrefferencesSettings.UserID END DESC,
						CASE WHEN @SortExpression ='MasterUserID ASC' THEN Owin_UserPrefferencesSettings.MasterUserID END ASC,
						CASE WHEN @SortExpression ='MasterUserID DESC' THEN Owin_UserPrefferencesSettings.MasterUserID END DESC,
						CASE WHEN @SortExpression ='AppFormID ASC' THEN Owin_UserPrefferencesSettings.AppFormID END ASC,
						CASE WHEN @SortExpression ='AppFormID DESC' THEN Owin_UserPrefferencesSettings.AppFormID END DESC,
						CASE WHEN @SortExpression ='PrePageSize ASC' THEN Owin_UserPrefferencesSettings.PrePageSize END ASC,
						CASE WHEN @SortExpression ='PrePageSize DESC' THEN Owin_UserPrefferencesSettings.PrePageSize END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_UserPrefferencesSettings.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_UserPrefferencesSettings.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_UserPrefferencesSettings.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_UserPrefferencesSettings.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_UserPrefferencesSettings.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_UserPrefferencesSettings.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_UserPrefferencesSettings.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_UserPrefferencesSettings.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_UserPrefferencesSettings.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_UserPrefferencesSettings.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_UserPrefferencesSettings.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_UserPrefferencesSettings.IPAddress END DESC
				) as RowNumber
		FROM Owin_UserPrefferencesSettings 
		where
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 			Owin_UserPrefferencesSettings.SerialNo  like @CommonSerachParam
			 OR Owin_UserPrefferencesSettings.UserID  like @CommonSerachParam
			 OR Owin_UserPrefferencesSettings.MasterUserID  like @CommonSerachParam
			 OR Owin_UserPrefferencesSettings.AppFormID  like @CommonSerachParam
			 OR Owin_UserPrefferencesSettings.PrePageSize  like @CommonSerachParam
			
			
			
			
			
			
			
 THEN 1 ELSE 0 END = 1)			)
			SELECT * 
			FROM  tempPagedowin_userprefferencessettings
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
Create PROCEDURE owin_userprefferencessettings_GS
		@SerialNo bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@AppFormID bigint  = NULL,
		@PrePageSize int  = NULL,
		    
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
			Owin_UserPrefferencesSettings.SerialNo,
			Owin_UserPrefferencesSettings.UserID,
			Owin_UserPrefferencesSettings.MasterUserID,
			Owin_UserPrefferencesSettings.AppFormID,
			Owin_UserPrefferencesSettings.PrePageSize,
			Owin_UserPrefferencesSettings.TransID,
			Owin_UserPrefferencesSettings.CreatedByUserName,
			Owin_UserPrefferencesSettings.CreatedDate,
			Owin_UserPrefferencesSettings.UpdatedByUserName,
			Owin_UserPrefferencesSettings.UpdatedDate,
			Owin_UserPrefferencesSettings.IPAddress,
			CONVERT(bigint, TS) as TS
		FROM Owin_UserPrefferencesSettings 
		where
			SerialNo = @SerialNo
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
Create PROCEDURE owin_userrole_GAPgListView 
		@UserRoleID bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@RoleID bigint  = NULL,
		@IsEnable bit  = NULL,
				
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
					owin_userrole
				WHERE 
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 					Owin_UserRole.UserRoleID  like @CommonSerachParam
					 OR Owin_UserRole.UserID  like @CommonSerachParam
					 OR Owin_UserRole.MasterUserID  like @CommonSerachParam
					 OR Owin_UserRole.RoleID  like @CommonSerachParam
					 OR Owin_UserRole.IsEnable  like @CommonSerachParam
					
					
					
					
					
					
					
 THEN 1 ELSE 0 END = 1)			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_userrole AS
			(
				  SELECT 
			Owin_UserRole.UserRoleID,
			Owin_UserRole.UserID,
			Owin_UserRole.MasterUserID,
			Owin_UserRole.RoleID,
			Owin_UserRole.IsEnable,
			Owin_UserRole.TransID,
			Owin_UserRole.CreatedByUserName,
			Owin_UserRole.CreatedDate,
			Owin_UserRole.UpdatedByUserName,
			Owin_UserRole.UpdatedDate,
			Owin_UserRole.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='UserRoleID ASC' THEN Owin_UserRole.UserRoleID END ASC,
						CASE WHEN @SortExpression ='UserRoleID DESC' THEN Owin_UserRole.UserRoleID END DESC,
						CASE WHEN @SortExpression ='UserID ASC' THEN Owin_UserRole.UserID END ASC,
						CASE WHEN @SortExpression ='UserID DESC' THEN Owin_UserRole.UserID END DESC,
						CASE WHEN @SortExpression ='MasterUserID ASC' THEN Owin_UserRole.MasterUserID END ASC,
						CASE WHEN @SortExpression ='MasterUserID DESC' THEN Owin_UserRole.MasterUserID END DESC,
						CASE WHEN @SortExpression ='RoleID ASC' THEN Owin_UserRole.RoleID END ASC,
						CASE WHEN @SortExpression ='RoleID DESC' THEN Owin_UserRole.RoleID END DESC,
						CASE WHEN @SortExpression ='IsEnable ASC' THEN Owin_UserRole.IsEnable END ASC,
						CASE WHEN @SortExpression ='IsEnable DESC' THEN Owin_UserRole.IsEnable END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_UserRole.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_UserRole.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_UserRole.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_UserRole.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_UserRole.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_UserRole.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_UserRole.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_UserRole.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_UserRole.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_UserRole.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_UserRole.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_UserRole.IPAddress END DESC
				) as RowNumber
		FROM Owin_UserRole 
		where
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 			Owin_UserRole.UserRoleID  like @CommonSerachParam
			 OR Owin_UserRole.UserID  like @CommonSerachParam
			 OR Owin_UserRole.MasterUserID  like @CommonSerachParam
			 OR Owin_UserRole.RoleID  like @CommonSerachParam
			 OR Owin_UserRole.IsEnable  like @CommonSerachParam
			
			
			
			
			
			
			
 THEN 1 ELSE 0 END = 1)			)
			SELECT * 
			FROM  tempPagedowin_userrole
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
Create PROCEDURE owin_userrole_GS
		@UserRoleID bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@RoleID bigint  = NULL,
		@IsEnable bit  = NULL,
		    
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
			Owin_UserRole.UserRoleID,
			Owin_UserRole.UserID,
			Owin_UserRole.MasterUserID,
			Owin_UserRole.RoleID,
			Owin_UserRole.IsEnable,
			Owin_UserRole.TransID,
			Owin_UserRole.CreatedByUserName,
			Owin_UserRole.CreatedDate,
			Owin_UserRole.UpdatedByUserName,
			Owin_UserRole.UpdatedDate,
			Owin_UserRole.IPAddress,
			CONVERT(bigint, TS) as TS
		FROM Owin_UserRole 
		where
			UserRoleID = @UserRoleID
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
Create PROCEDURE owin_userstatuschangehistory_GAPgListView 
		@Serial bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@StatusChanged bit  = NULL,
		@StatusRemark nvarchar (250) = NULL,
		@Comment nvarchar (450) = NULL,
		@ExtraFLD nvarchar (500) = NULL,
				
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
					owin_userstatuschangehistory
				WHERE 
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 					Owin_UserStatusChangeHistory.Serial  like @CommonSerachParam
					 OR Owin_UserStatusChangeHistory.UserID  like @CommonSerachParam
					 OR Owin_UserStatusChangeHistory.MasterUserID  like @CommonSerachParam
					 OR Owin_UserStatusChangeHistory.StatusChanged  like @CommonSerachParam
					 OR Owin_UserStatusChangeHistory.StatusRemark  like @CommonSerachParam
					 OR Owin_UserStatusChangeHistory.Comment  like @CommonSerachParam
					 OR Owin_UserStatusChangeHistory.ExtraFLD  like @CommonSerachParam
					
					
					
					
					
					
					
 THEN 1 ELSE 0 END = 1)			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedowin_userstatuschangehistory AS
			(
				  SELECT 
			Owin_UserStatusChangeHistory.Serial,
			Owin_UserStatusChangeHistory.UserID,
			Owin_UserStatusChangeHistory.MasterUserID,
			Owin_UserStatusChangeHistory.StatusChanged,
			Owin_UserStatusChangeHistory.StatusRemark,
			Owin_UserStatusChangeHistory.Comment,
			Owin_UserStatusChangeHistory.ExtraFLD,
			Owin_UserStatusChangeHistory.TransID,
			Owin_UserStatusChangeHistory.CreatedByUserName,
			Owin_UserStatusChangeHistory.CreatedDate,
			Owin_UserStatusChangeHistory.UpdatedByUserName,
			Owin_UserStatusChangeHistory.UpdatedDate,
			Owin_UserStatusChangeHistory.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='Serial ASC' THEN Owin_UserStatusChangeHistory.Serial END ASC,
						CASE WHEN @SortExpression ='Serial DESC' THEN Owin_UserStatusChangeHistory.Serial END DESC,
						CASE WHEN @SortExpression ='UserID ASC' THEN Owin_UserStatusChangeHistory.UserID END ASC,
						CASE WHEN @SortExpression ='UserID DESC' THEN Owin_UserStatusChangeHistory.UserID END DESC,
						CASE WHEN @SortExpression ='MasterUserID ASC' THEN Owin_UserStatusChangeHistory.MasterUserID END ASC,
						CASE WHEN @SortExpression ='MasterUserID DESC' THEN Owin_UserStatusChangeHistory.MasterUserID END DESC,
						CASE WHEN @SortExpression ='StatusChanged ASC' THEN Owin_UserStatusChangeHistory.StatusChanged END ASC,
						CASE WHEN @SortExpression ='StatusChanged DESC' THEN Owin_UserStatusChangeHistory.StatusChanged END DESC,
						CASE WHEN @SortExpression ='StatusRemark ASC' THEN Owin_UserStatusChangeHistory.StatusRemark END ASC,
						CASE WHEN @SortExpression ='StatusRemark DESC' THEN Owin_UserStatusChangeHistory.StatusRemark END DESC,
						CASE WHEN @SortExpression ='Comment ASC' THEN Owin_UserStatusChangeHistory.Comment END ASC,
						CASE WHEN @SortExpression ='Comment DESC' THEN Owin_UserStatusChangeHistory.Comment END DESC,
						CASE WHEN @SortExpression ='ExtraFLD ASC' THEN Owin_UserStatusChangeHistory.ExtraFLD END ASC,
						CASE WHEN @SortExpression ='ExtraFLD DESC' THEN Owin_UserStatusChangeHistory.ExtraFLD END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Owin_UserStatusChangeHistory.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Owin_UserStatusChangeHistory.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Owin_UserStatusChangeHistory.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Owin_UserStatusChangeHistory.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Owin_UserStatusChangeHistory.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Owin_UserStatusChangeHistory.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Owin_UserStatusChangeHistory.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Owin_UserStatusChangeHistory.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Owin_UserStatusChangeHistory.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Owin_UserStatusChangeHistory.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Owin_UserStatusChangeHistory.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Owin_UserStatusChangeHistory.IPAddress END DESC
				) as RowNumber
		FROM Owin_UserStatusChangeHistory 
		where
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 			Owin_UserStatusChangeHistory.Serial  like @CommonSerachParam
			 OR Owin_UserStatusChangeHistory.UserID  like @CommonSerachParam
			 OR Owin_UserStatusChangeHistory.MasterUserID  like @CommonSerachParam
			 OR Owin_UserStatusChangeHistory.StatusChanged  like @CommonSerachParam
			 OR Owin_UserStatusChangeHistory.StatusRemark  like @CommonSerachParam
			 OR Owin_UserStatusChangeHistory.Comment  like @CommonSerachParam
			 OR Owin_UserStatusChangeHistory.ExtraFLD  like @CommonSerachParam
			
			
			
			
			
			
			
 THEN 1 ELSE 0 END = 1)			)
			SELECT * 
			FROM  tempPagedowin_userstatuschangehistory
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
Create PROCEDURE owin_userstatuschangehistory_GS
		@Serial bigint  = NULL,
		@UserID uniqueidentifier  = NULL,
		@MasterUserID bigint  = NULL,
		@StatusChanged bit  = NULL,
		@StatusRemark nvarchar (250) = NULL,
		@Comment nvarchar (450) = NULL,
		@ExtraFLD nvarchar (500) = NULL,
		    
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
			Owin_UserStatusChangeHistory.Serial,
			Owin_UserStatusChangeHistory.UserID,
			Owin_UserStatusChangeHistory.MasterUserID,
			Owin_UserStatusChangeHistory.StatusChanged,
			Owin_UserStatusChangeHistory.StatusRemark,
			Owin_UserStatusChangeHistory.Comment,
			Owin_UserStatusChangeHistory.ExtraFLD,
			Owin_UserStatusChangeHistory.TransID,
			Owin_UserStatusChangeHistory.CreatedByUserName,
			Owin_UserStatusChangeHistory.CreatedDate,
			Owin_UserStatusChangeHistory.UpdatedByUserName,
			Owin_UserStatusChangeHistory.UpdatedDate,
			Owin_UserStatusChangeHistory.IPAddress,
			CONVERT(bigint, TS) as TS
		FROM Owin_UserStatusChangeHistory 
		where
			Serial = @Serial
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
Create PROCEDURE tran_login_GAPgListView 
		@SerialLoginID bigint  = NULL,
		@ParentSerialLoginID bigint  = NULL,
		@SAMAccount nvarchar (MAX) = NULL,
		@SAMEmail nvarchar (MAX) = NULL,
		@UserID uniqueidentifier  = NULL,
		@LoginDate datetime  = NULL,
		@LoginToken nvarchar (MAX) = NULL,
		@RefreshToken nvarchar (MAX) = NULL,
		@TokenIssueDate datetime  = NULL,
		@Expires datetime  = NULL,
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
					tran_login
				WHERE 
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 					Tran_Login.SerialLoginID  like @CommonSerachParam
					 OR Tran_Login.ParentSerialLoginID  like @CommonSerachParam
					 OR Tran_Login.SAMAccount  like @CommonSerachParam
					 OR Tran_Login.SAMEmail  like @CommonSerachParam
					 OR Tran_Login.UserID  like @CommonSerachParam
					 OR Tran_Login.LoginDate  like @CommonSerachParam
					 OR Tran_Login.LoginToken  like @CommonSerachParam
					 OR Tran_Login.RefreshToken  like @CommonSerachParam
					 OR Tran_Login.TokenIssueDate  like @CommonSerachParam
					 OR Tran_Login.Expires  like @CommonSerachParam
					 OR Tran_Login.Remarks  like @CommonSerachParam
					
					
					
					
					
					
					
 THEN 1 ELSE 0 END = 1)			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedtran_login AS
			(
				  SELECT 
			Tran_Login.SerialLoginID,
			Tran_Login.ParentSerialLoginID,
			Tran_Login.SAMAccount,
			Tran_Login.SAMEmail,
			Tran_Login.UserID,
			Tran_Login.LoginDate,
			Tran_Login.LoginToken,
			Tran_Login.RefreshToken,
			Tran_Login.TokenIssueDate,
			Tran_Login.Expires,
			Tran_Login.Remarks,
			Tran_Login.TransID,
			Tran_Login.CreatedByUserName,
			Tran_Login.CreatedDate,
			Tran_Login.UpdatedByUserName,
			Tran_Login.UpdatedDate,
			Tran_Login.IPAddress,
			CONVERT(bigint, TS) as TS
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='SerialLoginID ASC' THEN Tran_Login.SerialLoginID END ASC,
						CASE WHEN @SortExpression ='SerialLoginID DESC' THEN Tran_Login.SerialLoginID END DESC,
						CASE WHEN @SortExpression ='ParentSerialLoginID ASC' THEN Tran_Login.ParentSerialLoginID END ASC,
						CASE WHEN @SortExpression ='ParentSerialLoginID DESC' THEN Tran_Login.ParentSerialLoginID END DESC,
						CASE WHEN @SortExpression ='SAMAccount ASC' THEN Tran_Login.SAMAccount END ASC,
						CASE WHEN @SortExpression ='SAMAccount DESC' THEN Tran_Login.SAMAccount END DESC,
						CASE WHEN @SortExpression ='SAMEmail ASC' THEN Tran_Login.SAMEmail END ASC,
						CASE WHEN @SortExpression ='SAMEmail DESC' THEN Tran_Login.SAMEmail END DESC,
						CASE WHEN @SortExpression ='UserID ASC' THEN Tran_Login.UserID END ASC,
						CASE WHEN @SortExpression ='UserID DESC' THEN Tran_Login.UserID END DESC,
						CASE WHEN @SortExpression ='LoginDate ASC' THEN Tran_Login.LoginDate END ASC,
						CASE WHEN @SortExpression ='LoginDate DESC' THEN Tran_Login.LoginDate END DESC,
						CASE WHEN @SortExpression ='LoginToken ASC' THEN Tran_Login.LoginToken END ASC,
						CASE WHEN @SortExpression ='LoginToken DESC' THEN Tran_Login.LoginToken END DESC,
						CASE WHEN @SortExpression ='RefreshToken ASC' THEN Tran_Login.RefreshToken END ASC,
						CASE WHEN @SortExpression ='RefreshToken DESC' THEN Tran_Login.RefreshToken END DESC,
						CASE WHEN @SortExpression ='TokenIssueDate ASC' THEN Tran_Login.TokenIssueDate END ASC,
						CASE WHEN @SortExpression ='TokenIssueDate DESC' THEN Tran_Login.TokenIssueDate END DESC,
						CASE WHEN @SortExpression ='Expires ASC' THEN Tran_Login.Expires END ASC,
						CASE WHEN @SortExpression ='Expires DESC' THEN Tran_Login.Expires END DESC,
						CASE WHEN @SortExpression ='Remarks ASC' THEN Tran_Login.Remarks END ASC,
						CASE WHEN @SortExpression ='Remarks DESC' THEN Tran_Login.Remarks END DESC,
						CASE WHEN @SortExpression ='TransID ASC' THEN Tran_Login.TransID END ASC,
						CASE WHEN @SortExpression ='TransID DESC' THEN Tran_Login.TransID END DESC,
						CASE WHEN @SortExpression ='CreatedByUserName ASC' THEN Tran_Login.CreatedByUserName END ASC,
						CASE WHEN @SortExpression ='CreatedByUserName DESC' THEN Tran_Login.CreatedByUserName END DESC,
						CASE WHEN @SortExpression ='CreatedDate ASC' THEN Tran_Login.CreatedDate END ASC,
						CASE WHEN @SortExpression ='CreatedDate DESC' THEN Tran_Login.CreatedDate END DESC,
						CASE WHEN @SortExpression ='UpdatedByUserName ASC' THEN Tran_Login.UpdatedByUserName END ASC,
						CASE WHEN @SortExpression ='UpdatedByUserName DESC' THEN Tran_Login.UpdatedByUserName END DESC,
						CASE WHEN @SortExpression ='UpdatedDate ASC' THEN Tran_Login.UpdatedDate END ASC,
						CASE WHEN @SortExpression ='UpdatedDate DESC' THEN Tran_Login.UpdatedDate END DESC,
						CASE WHEN @SortExpression ='IPAddress ASC' THEN Tran_Login.IPAddress END ASC,
						CASE WHEN @SortExpression ='IPAddress DESC' THEN Tran_Login.IPAddress END DESC
				) as RowNumber
		FROM Tran_Login 
		where
(CASE WHEN @CommonSerachParam is NULL THEN 1 WHEN 			Tran_Login.SerialLoginID  like @CommonSerachParam
			 OR Tran_Login.ParentSerialLoginID  like @CommonSerachParam
			 OR Tran_Login.SAMAccount  like @CommonSerachParam
			 OR Tran_Login.SAMEmail  like @CommonSerachParam
			 OR Tran_Login.UserID  like @CommonSerachParam
			 OR Tran_Login.LoginDate  like @CommonSerachParam
			 OR Tran_Login.LoginToken  like @CommonSerachParam
			 OR Tran_Login.RefreshToken  like @CommonSerachParam
			 OR Tran_Login.TokenIssueDate  like @CommonSerachParam
			 OR Tran_Login.Expires  like @CommonSerachParam
			 OR Tran_Login.Remarks  like @CommonSerachParam
			
			
			
			
			
			
			
 THEN 1 ELSE 0 END = 1)			)
			SELECT * 
			FROM  tempPagedtran_login
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
Create PROCEDURE tran_login_GS
		@SerialLoginID bigint  = NULL,
		@ParentSerialLoginID bigint  = NULL,
		@SAMAccount nvarchar (MAX) = NULL,
		@SAMEmail nvarchar (MAX) = NULL,
		@UserID uniqueidentifier  = NULL,
		@LoginDate datetime  = NULL,
		@LoginToken nvarchar (MAX) = NULL,
		@RefreshToken nvarchar (MAX) = NULL,
		@TokenIssueDate datetime  = NULL,
		@Expires datetime  = NULL,
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
			Tran_Login.SerialLoginID,
			Tran_Login.ParentSerialLoginID,
			Tran_Login.SAMAccount,
			Tran_Login.SAMEmail,
			Tran_Login.UserID,
			Tran_Login.LoginDate,
			Tran_Login.LoginToken,
			Tran_Login.RefreshToken,
			Tran_Login.TokenIssueDate,
			Tran_Login.Expires,
			Tran_Login.Remarks,
			Tran_Login.TransID,
			Tran_Login.CreatedByUserName,
			Tran_Login.CreatedDate,
			Tran_Login.UpdatedByUserName,
			Tran_Login.UpdatedDate,
			Tran_Login.IPAddress,
			CONVERT(bigint, TS) as TS
		FROM Tran_Login 
		where
			SerialLoginID = @SerialLoginID
	END  
GO	

            
            



version: '3.4'

services:
  webappfront:
    environment:
      - ASPNETCORE_ENVIRONMENT=Development
      - ASPNETCORE_URLS=https://+:443;http://+:80
    ports:
      - "192.168.8.109:44380:80"
      - "192.168.8.109:44324:443"
    volumes:
      - ${APPDATA}/ASP.NET/Https:/root/.aspnet/https:ro

  webapi:
    environment:
      - ASPNETCORE_ENVIRONMENT=Development
      - ASPNETCORE_URLS=https://+:443;http://+:80
    ports:
      - "192.168.8.109:44381:80"
      - "192.168.8.109:44325:443"
    volumes:
      - ${APPDATA}/ASP.NET/Https:/root/.aspnet/https:ro

  webadmin:
    environment:
      - ASPNETCORE_ENVIRONMENT=Development
      - ASPNETCORE_URLS=https://+:443;http://+:80
    ports:
      - "192.168.8.109:44382:80"
      - "192.168.8.109:44326:443"
    volumes:
      - ${APPDATA}/ASP.NET/Https:/root/.aspnet/https:ro

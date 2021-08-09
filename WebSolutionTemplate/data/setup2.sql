GO
USE KAFBlackPortal
GO

  
/*  
Creator : KAF  
*/  
ALTER PROCEDURE owin_userpasswordresetinfo_Ins   
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

	UPDATE Owin_UserPasswordResetInfo SET	
	Owin_UserPasswordResetInfo.IsActive	 = 0
	WHERE Owin_UserPasswordResetInfo.UserID = @UserID
	AND Owin_UserPasswordResetInfo.UpdatedByUserName IS NULL

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

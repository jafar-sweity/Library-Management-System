SELECT [L].[BookID] ,
	  [BOO].[Title] ,
	  [B].[BorrowerID],
	  [B].[First_Name],
	  [B].[Last_Name],
	  [L].[Date_Borrowed],
	  [L].[Due_Date],
	  [L].[Date_Returned]
FROM 
	[dbo].[Loans] AS L
JOIN
	[dbo].[Borrowers] B ON L.[BorrowerID]=B.[BorrowerID]
JOIN 
	[dbo].[Books] BOO ON L.BookID = BOO.BookID
 WHERE  
	( 
	L.Date_Returned IS NOT NULL AND DATEDIFF (DAY , Date_Returned,L.Due_Date) >30
	)
 OR
	( 
	L.Date_Returned IS  NULL AND DATEDIFF (DAY , GETDATE(),L.Due_Date) >30
	)
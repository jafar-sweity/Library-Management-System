SELECT [B].[Author] , 
	   COUNT (*) AS BorrowingFrequency,
	   RANK () OVER ( order By COUNT (*)  DESC)AS AuthorRank
FROM 
[dbo].[Loans] L
JOIN 
[dbo].[Books] B ON L.BookID = B.BookID
GROUP  BY 
	[B].[Author]


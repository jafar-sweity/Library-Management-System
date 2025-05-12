CREATE FUNCTION fn_BookBorrowingFrequency (@BookID INT)
returns INT
AS 
BEGIN 
declare @BorrowingCount INT ;

SELECT @BorrowingCount = COUNT (*)
FROM [dbo].[Loans]
WHERE [BookID]=@BookID 

RETURN @BorrowingCount 

END

GO

select * from Loans 

SELECT dbo.fn_BookBorrowingFrequency(580) AS BorrowingCount 
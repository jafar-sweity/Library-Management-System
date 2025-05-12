CREATE TABLE AuditLog (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    BookID INT,
    StatusChange VARCHAR(100),
    ChangeDate DATETIME DEFAULT GETDATE()
);
GO 

CREATE TRIGGER trg_BookStatusChange 
ON Books 
AFTER UPDATE 
AS 
BEGIN 
   DECLARE @BookID INT, @StatusChange VARCHAR(100);
   
    SELECT @BookID = INSERTED.BookID,
		   @StatusChange = 'Status changed from ' + CAST(DELETED.Current_Status AS VARCHAR(10)) + ' to ' + CAST(INSERTED.Current_Status AS VARCHAR(10))
    FROM
		DELETED 
    JOIN 
		INSERTED ON DELETED.BookID = INSERTED.BookID;
    
    INSERT INTO AuditLog (BookID, StatusChange)
    VALUES (@BookID, @StatusChange);

END

select * from books where BookID = 10;


UPDATE Books
SET Current_Status = 'Borrowed'
WHERE BookID = 10;
UPDATE Books
SET Current_Status = 'Available'
WHERE BookID = 10;

SELECT * FROM AuditLog;


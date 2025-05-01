CREATE FUNCTION fn_CalculateOverdueFees (@LoanID INT)
returns DECIMAL(10, 2) 
AS 
BEGIN 
declare @OverDays INT ;
declare @DateReturned DATE;
declare @DueDate DATE;
declare @FEE DECIMAL(10, 2)  ; 

SELECT @DueDate=Due_Date , @DateReturned=Date_Returned
FROM Loans 
WHERE LoanID = @LoanID

IF @DateReturned IS NULL 
BEGIN 
	SET @DateReturned =GETDATE();
END 

SET @OverDays =DATEDIFF (DAY , @DateReturned,@DueDate);

IF @OverDays >0
BEGIN 
	IF @OverDays <=30
	BEGIN
		SET @FEE = @OverDays * 1.0
	END
	ELSE 
	BEGIN 
		SET @FEE = (30 * 1.0) +((@OverDays-30) * 2.0)
	END
END
ELSE 
BEGIN
	SET @FEE = 0.0
END

RETURN @FEE

END

GO

select * from Loans where LoanID = 1005

SELECT dbo.fn_CalculateOverdueFees(1005) AS OverDayFee
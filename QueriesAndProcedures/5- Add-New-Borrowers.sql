CREATE PROCEDURE sp_AddNewBorrower (@first_name VARCHAR(20), @last_name VARCHAR(20),
	@email VARCHAR(50), @date_of_birth DATE, @membership_date DATE) 
AS BEGIN
IF EXISTS (Select 1 from Borrowers WHERE Email = @email )
	BEGIN
		SELECT 'Error: A borrower with this email address already exists' AS Message;
	END 
	ELSE 
		BEGIN 
			INSERT INTO Borrowers  (First_Name, Last_Name, Email, Date_of_Birth, Membership_Date) VALUES (@first_name,@last_name,@email,@date_of_birth,@membership_date)
			SELECT BorrowerID from  Borrowers WHERE Email = @email
		END 
	END;
 GO

EXEC sp_AddNewBorrower   @first_name = 'jafar',
						 @last_name = 'sweity',
						 @Email = 'jafar@Foothill.com',
						 @date_of_birth = '2003-08-26',
						 @membership_date = '2025-05-1';
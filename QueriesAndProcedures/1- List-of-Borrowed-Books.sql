declare @BorrowerID int =150 // you can change this value to test with different BorrowerIDs

select Boo.Title ,Boo.Author ,LO.Date_Borrowed , Bor.First_Name AS [Borrower first name], Bor.Last_Name  AS [Borrower Last name] ,LO.BorrowerID
from Books as Boo
inner join Loans LO on Boo.BookID=LO.BookID 
inner join Borrowers Bor on LO.BorrowerID=Bor.BorrowerID
where Boo.Current_Status ='Borrowed' and Bor.BorrowerID=@BorrowerID
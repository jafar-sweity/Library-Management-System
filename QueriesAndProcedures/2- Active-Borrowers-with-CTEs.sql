WITH ActiveBorrowers AS  (

SELECT B.First_Name ,B.Last_Name, B.BorrowerID , COUNT (B.BorrowerID) AS [Toatl Books Borrowed] 
FROM [dbo].[Borrowers] B
INNER JOIN [dbo].[Loans] L ON L.BorrowerID=B.BorrowerID
WHERE L.Date_Returned is null 
GROUP BY B.First_Name ,B.Last_Name, B.BorrowerID
)
SELECT *
FROM ActiveBorrowers
WHERE [Toatl Books Borrowed] >=2
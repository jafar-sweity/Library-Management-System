SELECT B.First_Name
	  ,B.Last_Name,
	  COUNT(L.BorrowerID) AS BorrowingFrequency,
DENSE_RANK() OVER (ORDER BY COUNT(L.LoanID) DESC) AS BorrowingRank
FROM Loans L
INNER JOIN Borrowers B ON B.BorrowerID=L.BorrowerID
GROUP BY L.BorrowerID,B.First_Name ,B.Last_Name
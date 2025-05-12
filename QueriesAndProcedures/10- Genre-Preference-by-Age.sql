ً
WITH BorrowerAgeGroups AS (
	SELECT  
        BOR.BorrowerID,
        L.BookID,
        CASE 
            WHEN DATEDIFF(YEAR, BOR.Date_of_Birth, GETDATE()) BETWEEN 0 AND 10 THEN '0-10'
            WHEN DATEDIFF(YEAR, BOR.Date_of_Birth, GETDATE()) BETWEEN 11 AND 20 THEN '11-20'
            WHEN DATEDIFF(YEAR, BOR.Date_of_Birth, GETDATE()) BETWEEN 21 AND 30 THEN '21-30'
            WHEN DATEDIFF(YEAR, BOR.Date_of_Birth, GETDATE()) BETWEEN 31 AND 40 THEN '31-40'
            WHEN DATEDIFF(YEAR, BOR.Date_of_Birth, GETDATE()) BETWEEN 41 AND 50 THEN '41-50'
            ELSE '51+'
        END AS AgeGroup
    FROM Borrowers AS BOR
    JOIN Loans AS L ON BOR.BorrowerID = L.BorrowerID 
	),
	GenreCounts AS (
	SELECT BAG.AgeGroup , COUNT (*) AS BorrowCount ,BO.Genre
	FROM BorrowerAgeGroups AS BAG 
	JOIN Books AS BO ON BO.BookID = BAG.BookID
	GROUP BY BAG.AgeGroup , Genre
	),
	RankedGenres AS (

	SELECT RANK() OVER (PARTITION BY AgeGroup ORDER BY BorrowCount DESC) AS RNAKED , AgeGroup ,Genre ,BorrowCount
	FROM GenreCounts
	)
	SELECT AgeGroup , Genre ,BorrowCount
	FROM
		RankedGenres
	WHERE 
		RNAKED =1
	ORDER BY 
		AgeGroup 




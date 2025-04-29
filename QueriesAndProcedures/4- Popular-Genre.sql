WITH GenreRanks AS (
    SELECT 
        B.Genre,
        COUNT(*) AS Total_For_Each,
        RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk
    FROM 
        [dbo].[Books] B
    INNER JOIN 
        [dbo].[Loans] L ON L.BookID = B.BookID
    WHERE 
        MONTH(L.Date_Borrowed) = 9
    GROUP BY 
        B.Genre
)
SELECT *
FROM GenreRanks
WHERE rnk = 1 ;
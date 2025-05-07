--(Groups are (0,10), (11,20), (21,30)…)
SELECT
    CASE 
        WHEN Age BETWEEN 0 AND 10 THEN '0-10'
        WHEN Age BETWEEN 11 AND 20 THEN '11-20'
        WHEN Age BETWEEN 21 AND 30 THEN '21-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE '51+' 
    END AS AgeGroup,
    b.Genre,
    COUNT(*) AS BorrowCount
FROM (
    SELECT l.*, DATEDIFF(YEAR, br.DateOfBirth, GETDATE()) AS Age
    FROM Loans l
    JOIN Borrowers br ON l.BorrowerID = br.BorrowerID
) AS Sub
JOIN Books b ON Sub.BookID = b.BookID
GROUP BY
    CASE 
        WHEN Age BETWEEN 0 AND 10 THEN '0-10'
        WHEN Age BETWEEN 11 AND 20 THEN '11-20'
        WHEN Age BETWEEN 21 AND 30 THEN '21-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE '51+' 
    END,
    b.Genre
HAVING COUNT(*) >= 1;

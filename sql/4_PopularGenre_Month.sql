DECLARE @TargetMonth INT = 4, @TargetYear INT = 2025;
WITH MonthlyLoans AS (
    SELECT b.Genre, COUNT(*) AS BorrowCount
    FROM Loans l
    JOIN Books b ON l.BookID = b.BookID
    WHERE MONTH(l.DateBorrowed) = @TargetMonth AND YEAR(l.DateBorrowed) = @TargetYear
    GROUP BY b.Genre
)
SELECT Genre
FROM MonthlyLoans
WHERE BorrowCount = (
    SELECT MAX(BorrowCount) FROM MonthlyLoans
);
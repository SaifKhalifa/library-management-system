WITH BorrowCounts AS (
    SELECT BorrowerID, COUNT(*) AS TotalLoans
    FROM Loans
    WHERE DateReturned IS NULL
    GROUP BY BorrowerID
)
SELECT bc.BorrowerID, br.FirstName, br.LastName
FROM BorrowCounts bc
JOIN Borrowers br ON bc.BorrowerID = br.BorrowerID
WHERE bc.TotalLoans >= 2;
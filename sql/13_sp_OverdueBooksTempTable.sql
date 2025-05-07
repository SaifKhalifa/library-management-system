CREATE PROCEDURE sp_OverdueBooksWithBorrowers
AS
BEGIN
    CREATE TABLE #OverdueBorrowers (BorrowerID INT);
    INSERT INTO #OverdueBorrowers (BorrowerID)
    SELECT DISTINCT BorrowerID
    FROM Loans
    WHERE DateReturned IS NULL AND DATEDIFF(DAY, DueDate, GETDATE()) > 0;

    SELECT ob.BorrowerID, br.FirstName, br.LastName, b.Title, l.DueDate
    FROM #OverdueBorrowers ob
    JOIN Borrowers br ON ob.BorrowerID = br.BorrowerID
    JOIN Loans l ON l.BorrowerID = br.BorrowerID
    JOIN Books b ON l.BookID = b.BookID
    WHERE l.DateReturned IS NULL AND DATEDIFF(DAY, l.DueDate, GETDATE()) > 0;

    DROP TABLE #OverdueBorrowers;
END;
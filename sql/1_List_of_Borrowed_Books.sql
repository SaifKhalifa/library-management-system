DECLARE @BorrowerID INT = 7;

SELECT b.BookID, b.Title, l.DateBorrowed, l.DueDate, l.DateReturned
FROM Loans l
JOIN Books b ON l.BookID = b.BookID
WHERE l.BorrowerID = @BorrowerID;

--SELECT * FROM Loans ORDER BY BorrowerID;
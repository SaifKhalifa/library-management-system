SELECT b.BookID, b.Title, br.BorrowerID, br.FirstName, br.LastName, l.DueDate
FROM Loans l
JOIN Books b ON l.BookID = b.BookID
JOIN Borrowers br ON l.BorrowerID = br.BorrowerID
WHERE l.DateReturned IS NULL AND DATEDIFF(DAY, l.DueDate, GETDATE()) > 30;
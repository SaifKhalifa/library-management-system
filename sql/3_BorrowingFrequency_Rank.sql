SELECT BorrowerID, COUNT(*) AS BorrowCount,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS BorrowRank
FROM Loans
GROUP BY BorrowerID;
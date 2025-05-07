SELECT b.Author, COUNT(*) AS TimesBorrowed,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS PopularityRank
FROM Loans l
JOIN Books b ON l.BookID = b.BookID
GROUP BY b.Author;
-- ============================
-- Indexing Script for Library Management System
-- ============================

-- Table: Books
CREATE NONCLUSTERED INDEX IX_Books_CurrentStatus
ON Books(CurrentStatus);

CREATE NONCLUSTERED INDEX IX_Books_AvailableOnly
ON Books(BookID)
WHERE CurrentStatus = 'Available';

-- Table: Borrowers
CREATE NONCLUSTERED INDEX IX_Borrowers_Name
ON Borrowers(LastName, FirstName);

-- Table: Loans
CREATE NONCLUSTERED INDEX IX_Loans_BookID
ON Loans(BookID);

CREATE NONCLUSTERED INDEX IX_Loans_BorrowerID
ON Loans(BorrowerID);

CREATE NONCLUSTERED INDEX IX_Loans_BorrowerID_DueDate
ON Loans(BorrowerID, DueDate)
INCLUDE (DateReturned);

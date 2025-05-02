-- ===========================
-- Insert 1000 Dummy Books
-- ===========================
DECLARE @j INT = 1;
WHILE @j <= 1000
BEGIN
    INSERT INTO Books (
        BookID, Title, Author, ISBN, PublishedDate, Genre, ShelfLocation, CurrentStatus
    )
    VALUES (
        @j,
        CONCAT('Book Title ', @j),
        CONCAT('Author ', @j),
        CONCAT('ISBN', FORMAT(@j, '0000000000')),
        DATEADD(YEAR, -(@j % 20), GETDATE()),
        CASE WHEN @j % 3 = 0 THEN 'Fiction'
             WHEN @j % 3 = 1 THEN 'History'
             ELSE 'Science' END,
        CONCAT('Shelf ', @j % 50),
        'Available'
    );
    SET @j = @j + 1;
END;

-- ===============================
-- Insert 1000 Dummy Borrowers
-- ===============================

DECLARE @i INT = 1;
WHILE @i <= 1000
BEGIN
    INSERT INTO Borrowers (
        BorrowerID, FirstName, LastName, Email, DateOfBirth, MembershipDate
    )
    VALUES (
        @i,
        CONCAT('First', @i),
        CONCAT('Last', @i),
        CONCAT('user', @i, '@mail.com'),
        DATEADD(DAY, -@i % 365, '2000-01-01'),
        DATEADD(DAY, -@i, GETDATE())
    );
    SET @i = @i + 1;
END;

-- ===========================
-- Insert 1000 Dummy Loans
-- ===========================
DECLARE @k INT = 1;
WHILE @k <= 1000
BEGIN
    INSERT INTO Loans (
        LoanID, BookID, BorrowerID, DateBorrowed, DueDate, DateReturned
    )
    VALUES (
        @k,
        ABS(CHECKSUM(NEWID()) % 1000) + 1,
        ABS(CHECKSUM(NEWID()) % 1000) + 1,
        DATEADD(DAY, -(@k % 60), GETDATE()),
        DATEADD(DAY, 14, DATEADD(DAY, -(@k % 60), GETDATE())),
        NULL
    );
    SET @k = @k + 1;
END;

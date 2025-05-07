CREATE TABLE AuditLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    BookID INT,
    StatusChange VARCHAR(50),
    ChangeDate DATETIME DEFAULT GETDATE()
);
GO
CREATE TRIGGER trg_BookStatusChange
ON Books
AFTER UPDATE
AS
BEGIN
    INSERT INTO AuditLog (BookID, StatusChange)
    SELECT i.BookID, CONCAT(d.CurrentStatus, ' -> ', i.CurrentStatus)
    FROM inserted i
    JOIN deleted d ON i.BookID = d.BookID
    WHERE i.CurrentStatus <> d.CurrentStatus;
END;
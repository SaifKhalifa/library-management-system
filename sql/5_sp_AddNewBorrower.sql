CREATE PROCEDURE sp_AddNewBorrower
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @Email NVARCHAR(255),
    @DateOfBirth DATE,
    @MembershipDate DATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Borrowers WHERE Email = @Email)
    BEGIN
        RAISERROR('Email already exists.', 16, 1); -- severity = 16, means "User error that can be corrected by the user.".
        RETURN;
    END
    INSERT INTO Borrowers (FirstName, LastName, Email, DateOfBirth, MembershipDate)
    VALUES (@FirstName, @LastName, @Email, @DateOfBirth, @MembershipDate);
    SELECT SCOPE_IDENTITY() AS NewBorrowerID;
END;
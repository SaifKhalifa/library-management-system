CREATE FUNCTION fn_CalculateOverdueFees (@LoanID INT)
RETURNS MONEY
AS
BEGIN
    DECLARE @Fee MONEY = 0;
    DECLARE @DueDate DATE, @DateReturned DATE, @DaysOverdue INT;
    SELECT @DueDate = DueDate, @DateReturned = ISNULL(DateReturned, GETDATE())
    FROM Loans
    WHERE LoanID = @LoanID;
    SET @DaysOverdue = DATEDIFF(DAY, @DueDate, @DateReturned);
    IF @DaysOverdue > 0
        SET @Fee = CASE 
            WHEN @DaysOverdue <= 30 THEN @DaysOverdue * 1
            ELSE (30 * 1) + ((@DaysOverdue - 30) * 2)
        END;
    RETURN @Fee;
END;
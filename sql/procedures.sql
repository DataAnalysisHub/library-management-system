USE LibraryDB;

-- Create a procedure to calculate fine
DELIMITER //
CREATE PROCEDURE CalculateFine()
BEGIN
    DECLARE overdueDays INT;
    DECLARE finePerDay DECIMAL(10, 2);
    SET finePerDay = 1.00; -- fine amount per day

    UPDATE Loans
    SET FineAmount = CASE
        WHEN ReturnDate IS NULL AND CURDATE() > DueDate THEN DATEDIFF(CURDATE(), Due_Date) * finePerDay
        ELSE 0
    END
    WHERE ReturnDate IS NULL;
END //
DELIMITER ;

-- Create a procedure to extend the loan period
DELIMITER //
CREATE PROCEDURE ExtendLoan(IN loanID INT, IN extensionDays INT)
BEGIN
    DECLARE currentDueDate DATE;

    SELECT Due_Date INTO currentDueDate
    FROM Loans
    WHERE LoanID = loanID;

    UPDATE Loans
    SET Due_Date = DATE_ADD(currentDueDate, INTERVAL extensionDays DAY)
    WHERE LoanID = loanID;
END //
DELIMITER ;

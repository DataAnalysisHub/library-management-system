USE LibraryDB;

-- Create a function to add a reservation
DELIMITER //
CREATE PROCEDURE AddReservation(IN bookID INT, IN memberID INT)
BEGIN
    INSERT INTO Reservations (BookID, MemberID, ReservationDate, Status)
    VALUES (bookID, memberID, CURDATE(), 'Active');
END //
DELIMITER ;

-- Create a function to update reservation status to 'Expired'
DELIMITER //
CREATE PROCEDURE ExpireReservation(IN reservationID INT)
BEGIN
    UPDATE Reservations
    SET Status = 'Expired'
    WHERE ReservationID = reservationID;
END //
DELIMITER ;

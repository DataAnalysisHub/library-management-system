USE LibraryDB;

-- Create a trigger to automatically expire reservations after a certain date
DELIMITER //
CREATE TRIGGER ExpireReservationsTrigger
AFTER UPDATE ON Reservations
FOR EACH ROW
BEGIN
    IF NEW.ReservationDate < CURDATE() AND NEW.Status = 'Active' THEN
        UPDATE Reservations SET Status = 'Expired' WHERE ReservationID = NEW.ReservationID;
    END IF;
END //
DELIMITER ;

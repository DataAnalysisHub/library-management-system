USE LibraryDB;

-- Schedule the procedure to run daily
CREATE EVENT DailyFineCalculation
ON SCHEDULE EVERY 1 DAY
DO CALL CalculateFine();

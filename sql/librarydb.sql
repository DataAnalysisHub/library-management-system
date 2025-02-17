CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Create Authors table with extended fields
CREATE TABLE Authors (
    AuthorID 	INT 			AUTO_INCREMENT 	PRIMARY KEY,
    Name 		VARCHAR(255) 	NOT NULL,
    Birth_Date 	DATE,
    Country 	VARCHAR(100),
    Website 	VARCHAR(255),
    Bio 		TEXT
);

-- Create Books table with additional fields
CREATE TABLE Books (
    BookID 			INT 			AUTO_INCREMENT 	PRIMARY KEY,
    Title 			VARCHAR(255) 	NOT NULL,
    AuthorID 		INT,
    Genre 			VARCHAR(100),
    Published_Year 	INT,
    ISBN 			VARCHAR(13) 	UNIQUE,
    Language 		VARCHAR(50),
    Edition 		VARCHAR(50),
    Description 	TEXT,
    Quantity 		INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Create Members table with extended fields
CREATE TABLE Members (
    MemberID 			INT 			AUTO_INCREMENT 	PRIMARY KEY,
    First_Name 			VARCHAR(100),
    Last_Name 			VARCHAR(100),
    DoB			 		DATE,
    Address				VARCHAR(255),
    Phone_Number 		VARCHAR(20),
    Email 				VARCHAR(100),
    Membership_Type 		VARCHAR(50),
    Registration_Date 	DATE,
    Status 				VARCHAR(50)
);

-- Create Loans table with fine amount and status
CREATE TABLE Loans (
    LoanID 			INT 	AUTO_INCREMENT 	PRIMARY KEY,
    BookID 			INT,
    MemberID 		INT,
    LoanDate 		DATE,
    Due_Date 		DATE,
    Return_Date 		DATE,
    Fine_Amount 		DECIMAL(10, 2),
    Status 			VARCHAR(50),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Create Reservations table
CREATE TABLE Reservations (
    ReservationID 	INT 	AUTO_INCREMENT 	PRIMARY KEY,
    BookID 			INT,
    MemberID 		INT,
    Reservation_Date DATE,
    Status VARCHAR(50),
    Pickup_Date DATE,
    Return_Date DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Insert sample authors with extended data
INSERT INTO Authors (Name, Birth_Date, Country, Website, Bio) VALUES
('J.K. Rowling', '1965-07-31', 'UK', 'http://www.jkrowling.com', 'British author, best known for the Harry Potter series.'),
('George Orwell', '1903-06-25', 'UK', NULL, 'English novelist, essayist, and critic.'),
('J.R.R. Tolkien', '1892-01-03', 'UK', 'https://www.tolkien.co.uk', 'English writer, poet, and professor, best known for The Lord of the Rings.');

-- Insert sample books with extended data
INSERT INTO Books (Title, AuthorID, Genre, Published_Year, ISBN, Language, Edition, Description, Quantity) VALUES
('Harry Potter and the Philosopher\'s Stone', 1, 'Fantasy', 1997, '9780747532699', 'English', 'First Edition', 'The first book in the Harry Potter series.', 5),
('1984', 2, 'Dystopian', 1949, '9780451524935', 'English', 'Original Edition', 'A dystopian novel by George Orwell.', 3),
('The Hobbit', 3, 'Fantasy', 1937, '9780345339683', 'English', '75th Anniversary Edition', 'A fantasy novel by J.R.R. Tolkien.', 2);

-- Insert sample members with extended data
INSERT INTO Members (First_Name, Last_Name, DoB, Address, Phone_Number, Email, Membership_Type, Registration_Date, Status) VALUES
('John', 'Doe', '1985-05-15', '123 Main St', '123-456-7890', 'john.doe@example.com', 'Regular', '2020-01-15', 'Active'),
('Jane', 'Smith', '1990-07-22', '456 Elm St', '987-654-3210', 'jane.smith@example.com', 'Premium', '2018-03-10', 'Active');

-- Insert sample loans with extended data
INSERT INTO Loans (BookID, MemberID, Loan_Date, Due_Date, Return_Date, Fine_Amount, Status) VALUES
(1, 1, '2024-06-15', '2024-07-15', NULL, NULL, 'Active'),
(2, 2, '2024-06-20', '2024-07-20', NULL, NULL, 'Active');

-- Insert sample reservations
INSERT INTO Reservations (BookID, MemberID, ReservationDate, Status) VALUES
(3, 1, '2024-06-25', 'Active');

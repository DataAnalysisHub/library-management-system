# **LibraryDB: A Comprehensive Library Management System**

Welcome to **LibraryDB**, a robust and scalable library management system built using SQL. This project is designed to manage books, authors, members, loans, and reservations efficiently. It includes advanced features like stored procedures, triggers, events, and functions to automate and streamline library operations.

---

## **Table of Contents**  
1. [Overview](#overview)  
2. [Database Schema](#database-schema)  
3. [Features](#features)  
4. [Installation and Setup](#installation-and-setup)  
5. [Usage](#usage)  
   - [Stored Procedures](#stored-procedures)  
   - [Triggers](#triggers)  
   - [Events](#events)  
   - [Functions](#functions)  
6. [Sample Data](#sample-data)  
7. [Contributing](#contributing)  
8. [License](#license)  

---

## **Overview**  
LibraryDB is a relational database system designed to manage the operations of a library. It includes tables for **Authors**, **Books**, **Members**, **Loans**, and **Reservations**, along with advanced SQL features like **stored procedures**, **triggers**, **events**, and **functions** to automate tasks such as fine calculation, loan extensions, and reservation management.


## Project Structure

The project is organized as follows:

```
library-database/
├── sql/
│   ├── librarydb.sql
│   ├── functions.sql
│   ├── events.sql
│   ├── procedures.sql
│   ├── triggers.sql
├── images/
│   ├── ERD.png
├── README.md
```

### File Descriptions

- **librarydb.sql**: Contains SQL commands to create the database and tables, and to insert sample data.
- **functions.sql**: Contains SQL commands to create stored functions for the database.
- **events.sql**: Contains SQL commands to create events for automated tasks within the database.
- **procedures.sql**: Contains SQL commands to create stored procedures for complex operations in the database.
- **triggers.sql**: Contains SQL commands to create triggers that automatically perform actions in response to database changes.
- **images/ERD.png**: Contains the image for the ERD
- **README.md**: Provides an overview of the project, setup instructions, and usage information.

---

## **Database Schema**  
The database consists of the following tables:  

### **ER Diagram**
<img src="https://github.com/mrowurakwarteng/library-management-system/blob/main/images/ERD.png">
*Visual representation of the database structure and relationships.* nb

### **Authors**  
- `AuthorID`: Unique identifier for each author.  
- `Name`: Author's full name.  
- `Birth_Date`: Author's date of birth.  
- `Country`: Author's country of origin.  
- `Website`: Author's official website.  
- `Bio`: A brief biography of the author.  

### **Books**  
- `BookID`: Unique identifier for each book.  
- `Title`: Title of the book.  
- `AuthorID`: Foreign key referencing the `Authors` table.  
- `Genre`: Genre of the book.  
- `Published_Year`: Year the book was published.  
- `ISBN`: Unique ISBN number of the book.  
- `Language`: Language of the book.  
- `Edition`: Edition of the book.  
- `Description`: A brief description of the book.  
- `Quantity`: Number of copies available.  

### **Members**  
- `MemberID`: Unique identifier for each member.  
- `First_Name`: Member's first name.  
- `Last_Name`: Member's last name.  
- `DoB`: Member's date of birth.  
- `Address`: Member's address.  
- `Phone_Number`: Member's phone number.  
- `Email`: Member's email address.  
- `Membership_Type`: Type of membership (e.g., Regular, Premium).  
- `Registration_Date`: Date the member registered.  
- `Status`: Membership status (e.g., Active, Inactive).  

### **Loans**  
- `LoanID`: Unique identifier for each loan.  
- `BookID`: Foreign key referencing the `Books` table.  
- `MemberID`: Foreign key referencing the `Members` table.  
- `LoanDate`: Date the book was loaned.  
- `Due_Date`: Date the book is due for return.  
- `Return_Date`: Date the book was returned.  
- `Fine_Amount`: Fine amount for overdue books.  
- `Status`: Loan status (e.g., Active, Returned).  

### **Reservations**  
- `ReservationID`: Unique identifier for each reservation.  
- `BookID`: Foreign key referencing the `Books` table.  
- `MemberID`: Foreign key referencing the `Members` table.  
- `Reservation_Date`: Date the reservation was made.  
- `Status`: Reservation status (e.g., Active, Expired).  
- `Pickup_Date`: Date the book was picked up.  
- `Return_Date`: Date the book was returned.  

---

## **Features**  
- **Stored Procedures**: Automate tasks like calculating fines and extending loan periods.  
- **Triggers**: Automatically expire reservations after a certain date.  
- **Events**: Schedule daily tasks like fine calculation.  
- **Functions**: Simplify operations like adding reservations.  

---

## **Installation and Setup**  
1. Clone the repository:  
   ```bash
   git clone https://github.com/your-username/LibraryDB.git
   cd LibraryDB
   ```

2. Import the SQL files into your MySQL server:  
   ```bash
   mysql -u your_username -p < librarydb.sql
   mysql -u your_username -p < functions.sql
   mysql -u your_username -p < procedures.sql
   mysql -u your_username -p < events.sql
   mysql -u your_username -p < triggers.sql
   ```

3. Verify the database and tables:  
   ```sql
   USE LibraryDB;
   SHOW TABLES;
   ```

---

## **Usage**  

### **Stored Procedures**  
- **Calculate Fine**:  
  ```sql
  CALL CalculateFine();
  ```
  This procedure calculates fines for overdue books.  

- **Extend Loan**:  
  ```sql
  CALL ExtendLoan(loanID, extensionDays);
  ```
  Extends the due date of a loan by a specified number of days.  

### **Triggers**  
- **Expire Reservations**:  
  Automatically updates the status of reservations to "Expired" if the reservation date has passed.  

### **Events**  
- **Daily Fine Calculation**:  
  Scheduled to run daily to calculate fines for overdue books.  

### **Functions**  
- **Add Reservation**:  
  ```sql
  CALL AddReservation(bookID, memberID);
  ```
  Adds a new reservation for a book.  

- **Expire Reservation**:  
  ```sql
  CALL ExpireReservation(reservationID);
  ```
  Manually expires a reservation.  

---

### Sample Data    
The database is pre-populated with sample data for testing:  
- **Authors**: J.K. Rowling, George Orwell, J.R.R. Tolkien.  
- **Books**: Harry Potter and the Philosopher's Stone, 1984, The Hobbit.  
- **Members**: John Doe, Jane Smith.  
- **Loans**: Sample loans with due dates and fine calculations.  
- **Reservations**: Active and expired reservations.  

##
  
To view sample data, run the following queries:  
```sql
-- View all authors  
SELECT * FROM Authors;  

-- View all books  
SELECT * FROM Books;  

-- View all members  
SELECT * FROM Members;  

---

## **Contributing**  
We welcome contributions! To contribute:  
1. Fork the repository.  
2. Create a new branch:  
   ```bash
   git checkout -b feature/your-feature-name
   ```  
3. Commit your changes:  
   ```bash
   git commit -m "Add your commit message here"
   ```  
4. Push to the branch:  
   ```bash
   git push origin feature/your-feature-name
   ```  
5. Submit a pull request.  

---

## Future Enhancements  
- **User Interface**: Develop a front-end interface for easier interaction with the database.  
- **Advanced Analytics**: Add features like book popularity analysis or member engagement metrics.  
- **Cloud Integration**: Migrate the database to a cloud platform for scalability.  

---

## **License**  
This project is licensed under the **MIT License**. See [LICENSE](LICENSE.md) for details.  

---

## **Acknowledgments**  
- Inspired by real-world library management systems.  
- Built with MySQL and SQL best practices.  

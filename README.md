# 📚 Library Management System (SQL Project)
A relational database project for managing books, borrowers, and loans using MS SQL.

---

## 🎯 Project Objectives
- Design a relational schema for managing books, borrowers, and loans.
- Implement key operations using stored procedures and functions.
- Apply advanced SQL concepts such as CTEs, window functions, triggers, and temp tables.
- Practice clean database design with dummy data.

---

## 🗃️ Database Schema Overview

### 1. **Books**
Tracks library books and their status.

| Column         | Type         | Notes                            |
|----------------|--------------|----------------------------------|
| BookID         | INT (PK)     | Unique Book ID, Auto-incremented |
| Title          | NVARCHAR(50) | Book title                       |
| Author         | NVARCHAR(20) | Author name                      |
| ISBN           | VARCHAR(50)  | International identifier         |
| PublishedDate  | DATE         | Year of publication              |
| Genre          | NVARCHAR(20) | Fiction, History, Science, etc.  |
| ShelfLocation  | VARCHAR(50)  | Where it's located in the library|
| CurrentStatus  | VARCHAR(20)  | 'Available' or 'Borrowed'        |

---

### 2. **Borrowers**
Stores user information.

| Column         | Type           | Notes                                      |
|----------------|----------------|--------------------------------------------|
| BorrowerID     | INT (PK)       | Unique borrower ID, Auto-incremented       |
| FirstName      | NVARCHAR(20)   | Borrower's first name                      |
| LastName       | NVARCHAR(20)   | Borrower's last name                       |
| Email          | VARCHAR(255)   | Must be unique                             |
| DateOfBirth    | DATE           | For age analytics                          |
| MembershipDate | DATE           | When they joined                           |

---

### 3. **Loans**
Tracks which books were borrowed and their return status.

| Column         | Type     | Notes                                      |
|----------------|----------|--------------------------------------------|
| LoanID         | INT (PK) | Unique loan ID, Auto-incremented           |
| BookID         | INT (FK) | Linked to Books                            |
| BorrowerID     | INT (FK) | Linked to Borrowers                        |
| DateBorrowed   | DATE     | When the book was borrowed                 |
| DueDate        | DATE     | 14 days after borrowing                    |
| DateReturned   | DATE     | NULL if not returned                       |

---

### 🔹 Stored Procedures & Functions

- `sp_AddNewBorrower`  
  Adds a new borrower if their email is unique. Uses `SCOPE_IDENTITY()` to return the new ID.

- `sp_BorrowedBooksReport`  
  Lists books borrowed in a given date range.

- `sp_OverdueBooksWithBorrowers`  
  Uses a temp table to show borrowers and their overdue books.

- `fn_CalculateOverdueFees`  
  Returns the late fee for a given LoanID. $1/day for first 30 days, $2/day after.

- `fn_BookBorrowingFrequency`  
  Returns how many times a book has been borrowed.

---
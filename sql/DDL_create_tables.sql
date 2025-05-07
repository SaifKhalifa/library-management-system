-- ===========================
-- Library Management System
-- Database Schema Definition
-- ===========================

-- Database Creation
CREATE DATABASE LibraryManagmentSystem;

-- Table: Books
CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(50) NOT NULL,
    Author NVARCHAR(20),
    ISBN VARCHAR(50),
    PublishedDate DATE,
    Genre NVARCHAR(20),
    ShelfLocation VARCHAR(50),
    CurrentStatus VARCHAR(20) CHECK (CurrentStatus IN ('Available', 'Borrowed')) -- restricts the values to be only two options.
);

-- Table: Borrowers
CREATE TABLE Borrowers (
    BorrowerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    DateOfBirth DATE,
    MembershipDate DATE
);


-- Table: Loans
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY IDENTITY(1,1),
    BookID INT,
    BorrowerID INT,
    DateBorrowed DATETIME NOT NULL,
    DueDate DATETIME NOT NULL,
    DateReturned DATETIME,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)
);

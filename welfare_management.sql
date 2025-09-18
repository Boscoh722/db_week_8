-- Create the database
CREATE DATABASE WelfareManagementSystem;
USE WelfareManagementSystem;

-- Create the Members table
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15),
    JoinDate DATE NOT NULL DEFAULT (CURDATE())
);

-- Create the Contributions table
CREATE TABLE Contributions (
    ContributionID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    ContributionDate DATE NOT NULL DEFAULT (CURDATE()),
    Description VARCHAR(255),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID) ON DELETE RESTRICT
);

-- Create the Loans table
CREATE TABLE Loans (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT NOT NULL,
    PrincipalAmount DECIMAL(10, 2) NOT NULL,
    InterestRate DECIMAL(5, 2) NOT NULL,
    LoanDate DATE NOT NULL DEFAULT (CURDATE()),
    DueDate DATE NOT NULL,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID) ON DELETE RESTRICT
);

-- Create the Loan_Repayments table
CREATE TABLE Loan_Repayments (
    RepaymentID INT AUTO_INCREMENT PRIMARY KEY,
    LoanID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    RepaymentDate DATE NOT NULL DEFAULT (CURDATE()),
    FOREIGN KEY (LoanID) REFERENCES Loans(LoanID) ON DELETE RESTRICT
);

-- Create the Dividends table
CREATE TABLE Dividends (
    DividendID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    DividendYear YEAR NOT NULL,
    PaymentDate DATE NOT NULL DEFAULT (CURDATE()),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID) ON DELETE RESTRICT
);


Welfare Management System Database

Overview

This repository contains the SQL schema for a Welfare Management System designed to manage members, their contributions, loans, loan repayments, and annual dividend distributions. The database is implemented in MySQL and includes well-structured tables with appropriate constraints to ensure data integrity.

Database Schema

The database (WelfareManagementSystem) consists of five tables with the following relationships and constraints:

Tables





Members:





Stores member information.



Columns: MemberID (PK, auto-increment), FirstName, LastName, Email (UNIQUE), Phone, JoinDate.



Constraints: NOT NULL on FirstName, LastName, Email, JoinDate; UNIQUE on Email.



Contributions:





Tracks member contributions (e.g., monthly savings).



Columns: ContributionID (PK, auto-increment), MemberID (FK), Amount, ContributionDate, Description.



Constraints: NOT NULL on MemberID, Amount, ContributionDate; FOREIGN KEY to Members(MemberID) with ON DELETE RESTRICT.



Loans:





Records loans issued to members.



Columns: LoanID (PK, auto-increment), MemberID (FK), PrincipalAmount, InterestRate, LoanDate, DueDate.



Constraints: NOT NULL on MemberID, PrincipalAmount, InterestRate, LoanDate, DueDate; FOREIGN KEY to Members(MemberID) with ON DELETE RESTRICT.



Loan_Repayments:





Tracks repayments made on loans.



Columns: RepaymentID (PK, auto-increment), LoanID (FK), Amount, RepaymentDate.



Constraints: NOT NULL on LoanID, Amount, RepaymentDate; FOREIGN KEY to Loans(LoanID) with ON DELETE RESTRICT.



Dividends:





Records annual profit shares distributed to members.



Columns: DividendID (PK, auto-increment), MemberID (FK), Amount, DividendYear, PaymentDate.



Constraints: NOT NULL on MemberID, Amount, DividendYear, PaymentDate; FOREIGN KEY to Members(MemberID) with ON DELETE RESTRICT.

Relationships





One-to-Many:





Members to Contributions: One member can have many contributions.



Members to Loans: One member can have many loans.



Loans to Loan_Repayments: One loan can have many repayments.



Members to Dividends: One member can receive many dividend payments.

Constraints





Primary Keys: Ensure unique identification of records.



Foreign Keys: Enforce referential integrity with ON DELETE RESTRICT to prevent deletion of records with dependencies.



NOT NULL: Ensures critical fields are always provided.



UNIQUE: Prevents duplicate emails in Members.

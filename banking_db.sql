create database BankingDB;
use BankingDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AccountCreationDate DATE
);



-- --------------------------------------
-- lab 2

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);
 
 -- add dateofbirth column to customer tables.
 alter table customers add column dateofbirth date;
 
ALTER TABLE Customers MODIFY Phone VARCHAR(20);
 
 ALTER TABLE Accounts ADD CONSTRAINT chk_MinBalance CHECK (Balance >= 1000);
 
 show create table accounts;
 
 drop table accountbranches;

 -- add customer id column in acc table
 alter table accounts
 add customerid int;
 
 -- connect customer and acc table using fk 
 alter table accounts 
 add constraint fk_account_customers
 foreign key (customerid)
 references customers(customerid);


 alter table customers modify firstname varchar(50) not null;
 
 alter table customers add constraint uq_email unique (email);
 
 
 --  activity  

-- Accounts → Connect with Branches
-- Add a foreign key on BranchID that references Branches(BranchID).
alter table Branches add primary key(BranchID);
alter table Accounts add BranchID int;
ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Branches
FOREIGN KEY (BranchID)
REFERENCES Branches(BranchID);

-- Transactions → Connect with Accounts
-- Add a foreign key on AccountID that references Accounts(AccountID).
alter table Accounts add primary key(AccountID);
alter table Transactions add AccountID int;
ALTER TABLE Transactions
ADD CONSTRAINT FK_Transactions_Accounts
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

-- Loans → Connect with Customers
--  a foreign key on CustomerID that references Customers(CustomerID).
-- Add a foreign key on AccountID that references Accounts(AccountID).
alter table Loans add CustomerID int;
ALTER TABLE Loans
ADD CONSTRAINT FK_Loans_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

  -- lab 3

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9876543210','1998-04-15');

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Savings',25000);


-- Insert 4 Records into Customers Table
INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(102, 'Priya', 'Patil', 'priya@gmail.com', '9988776655', '2000-09-20'),
(103, 'Amit', 'Patel', 'amit.patel@gmail.com', '9876500001', '1995-06-18'),
(104, 'Sneha', 'Joshi', 'sneha.joshi@gmail.com', '9876500002', '1997-09-12'),
(105, 'Rohan', 'Kulkarni', 'rohan.k@gmail.com', '9876500003', '1993-11-25');

-- Insert 4 Records into Accounts Table
INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(202, 102, 'Current', 40000),
(203, 103, 'Savings', 35000),
(204, 104, 'Current', 60000),
(205, 105, 'Savings', 45000);

-- Insert 5 Records into Transactions Table
INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
(301, 201, '2025-05-10', 5000, 'Deposit'),
(302, 202, '2025-05-11', 2500, 'Withdraw'),
(303, 203, '2025-05-12', 10000, 'Deposit'),
(304, 204, '2025-05-13', 3000, 'Withdraw'),
(305, 205, '2025-05-14', 7000, 'Deposit');

-- Insert 5 Records into Branches Table
INSERT INTO Branches
(BranchID, BranchName, BranchAddress, BranchPhone)
VALUES
(1, 'Mumbai Branch', 'Andheri, Mumbai', '0221111111'),
(2, 'Pune Branch', 'Shivaji Nagar, Pune', '0202222222'),
(3, 'Nashik Branch', 'College Road, Nashik', '0253222222'),
(4, 'Nagpur Branch', 'Sitabuldi, Nagpur', '0712333333'),
(5, 'Navi Mumbai Branch', 'Vashi, Navi Mumbai', '0224444444');

-- Insert 5 Records into Loans Table
INSERT INTO Loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID)
VALUES
(301, 500000, 8.50, '2025-01-15', '2030-01-15', 101),
(302, 300000, 9.25, '2025-02-10', '2028-02-10', 102),
(303, 750000, 8.75, '2025-03-20', '2032-03-20', 103),
(304, 250000, 10.00, '2025-04-05', '2029-04-05', 104),
(305, 1000000, 7.95, '2025-05-12', '2035-05-12', 105);



SET SQL_SAFE_UPDATES=0

UPDATE Customers
SET Phone='9999999999'
WHERE CustomerID=101;
 
SELECT * FROM Customers
WHERE CustomerID = 101;

UPDATE Customers
SET Email='rahul.sharma@gmail.com'
WHERE CustomerID=101;

-- activity-- 

-- TASK 3

DELETE FROM Transactions
WHERE TransactionID = 302;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Transactions
WHERE TransactionID = 302;

SET SQL_SAFE_UPDATES = 1;

select * FROM transactions;


 --  ----------------- lab 4 ----------------
 
--  task 1--

 select * from customers;
 
 -- view only req customer details
 
 SELECT FirstName, LastName, Email, Phone
FROM Customers;

select AccountID, AccountType,Balance from accounts;

-- Task 2: Investigate Specific Customer Transactions

SELECT *
FROM Accounts
WHERE AccountType = 'Savings';

  select * 
  from accounts
  where balance > 25000;
  
  select *
  from transactions
  where amount between 5000 and 20000;
  
  select *
  from customers
  where customerid in (101,102,103);
  
  select * from customers
where firstname like "R%";

-- activity -- 

-- Retrieve all current account records
-- Find accounts with balance less than 15000
-- Display transactions between 1000 and 10000
-- Retrieve customer records for CustomerID 104 and 105
-- Display customers whose last name starts with S  
  
 
 -- Retrieve all current account records
 
 select * from accounts;
 
-- Find accounts with balance less than 15000

select * from accounts 
where balance > 15000;

-- Display transactions between 1000 and 10000

select *
  from transactions
  where amount between 1000 and 10000;
  

-- Retrieve customer records for CustomerID 104 and 105
-- Display customers whose last name starts with S
 
-- task 3 : Generate Banking Reports for Management
 
 SELECT *
FROM Customers
ORDER BY FirstName ASC;

select * 
from accounts 
order by balance DESC;

SELECT DISTINCT AccountType
FROM Accounts;

select *
from accounts
order by balance DESC
LIMIT 3;

 select *
 from transactions
 limit 5 offset 2;
 
 
 -- activity-- 
 -- Display customers sorted by LastName
 
 select * 
 from customers
 order by lastname asc;
 
-- Retrieve top 5 transactions with highest amount
select * 
from transactions
order by amount DESC limit 5;

-- Display unique transaction types
SELECT DISTINCT AccountType
FROM Accounts;

-- Skip the first 3 transaction records and display the next 4 records

select *
 from transactions
 limit 4 offset 3;
 
 -- task 4  Identify Missing Banking Information-- 
 
SELECT *
FROM Customers
WHERE Phone IS NULL;

select * 
from customers
where email is not null;

-- activity-- 

-- Find customers without email addresses
select * from customers
where email is not null;

-- Display all accounts where balance information is available
select * from customers
where email is not null;

-- Task 5: Categorize Customer Accounts Based on Balance --

 SELECT AccountID,
       Balance,
       CASE
           WHEN Balance >= 50000 THEN 'Premium Account'
           WHEN Balance >= 25000 THEN 'Standard Account'
           ELSE 'Basic Account'
       END AS AccountCategory
FROM Accounts;

-- activity-- 
-- create a report that categorizes transactions as:

-- High Transaction
-- Medium Transaction
-- Low Transaction
-- based on transaction amount.

select transactionid, amount,
case
when amount >=8000 then "high trans"
when amount >=5000 then "medium trans"
else "low amount"
end as "amount category" 
from transactions;

-- Task 6: Analyze Customer Transactions Using Window Functions

select accountid,
balance,
rank() over (order by balance DESC) As balancerank
from accounts;

 SELECT TransactionID,
       Amount,
       SUM(Amount) OVER (ORDER BY TransactionDate) AS RunningTotal
FROM Transactions;

  SELECT TransactionID,
       Amount,
       AVG(Amount) OVER () AS AverageTransaction
FROM Transactions;

-- --------------------------------------------------
--  lab 5 Build Customer Search System with Filtering & Sorting

-- Task 1: Search Customers Based on Name

select * from customers where firstname like "a%";

select * from customers where email like "%gmail%";

select * from customers where lastname like "%kar";

-- Activity

-- Display customers whose first name starts with R
select * from customers where firstname like "r%";

-- Find customers whose email contains yahoo
select * from customers where email like "%yahoo%";

-- Display customers whose last name starts with P
select * from customers where lastname like " %p";

-- Search customers whose phone number ends with 99

select * from  customers where phone like "%99";

-- Task 2: Filter Records for Selected Banking Categories

 SELECT *
FROM Accounts
WHERE AccountType IN ('Savings', 'Current');

 select * from transactions where transactiontype in ("deposit","withdrawal");
 
 select * from customers where customerid in (101,102,103);
 

 -- activity
 
 -- Display accounts belonging to Salary and Savings account types
 select * from accounts where accounttype  in ("savings","salary");
 
 -- Retrieve transactions for Payment and Deposit categories
 select * from transactions where transactions in ("Payment", "categories");
-- Display customer records for CustomerID 103 and 104
select * from customers where customerid in (103,104);
-- Retrieve selected account records using AccountID values
select * from  account 

-- Task 3: Generate Sorted Banking Reports
 
SELECT *
FROM Customers
ORDER BY LastName ASC;

SELECT *
FROM Accounts
ORDER BY Balance DESC;
 
 SELECT *
FROM Transactions
ORDER BY TransactionDate DESC;

-- Display customers sorted by FirstName
-- Display accounts sorted by AccountType
-- Display transactions sorted by Amount in descending order
-- Display customers sorted by DateOfBirth

-- task 4 Control Result Size for Faster Review

 SELECT *
FROM Accounts
ORDER BY Balance DESC
LIMIT 5;

SELECT *
FROM Customers
LIMIT 3;

SELECT *
FROM Transactions
LIMIT 5 OFFSET 3;

-- activity 

-- Display top 3 transactions with highest amount

select * from transactions order by account desc limit 3;
-- Retrieve only 4 customer records
select * from customers limit 4;
-- Skip first 2 account records and display next 3 records
select * from accounts limit 5 offset 2;
-- Display top 5 latest transactions
select * from transactions order by transactiondate desc limit 5;


-- task 5 

-- Display Savings Account Customers Sorted by Balance
 SELECT *
FROM Accounts
WHERE AccountType = 'Savings'
ORDER BY Balance DESC;

-- search Customers Using Partial Name and Limit Results
select * from customers where firstname like "s%" limit 5;

-- Display Selected Transactions in Sorted Order
SELECT *
FROM Transactions
WHERE TransactionType IN ('Deposit','Withdrawal')
ORDER BY TransactionDate DESC;

-- -----------------------------------
-- lab 6 Generate Banking Summary Reports Using Aggregations

-- Task 1: Apply string, math, and date functions

-- String Functions

-- Display customer Table

select * from customers;


SELECT
FirstName,
UPPER(FirstName) AS UpperCaseName
FROM customers;

select firstname, lower(firstname) as lowercasename from customers;

 SELECT
FirstName,
LENGTH(FirstName) AS NameLength
FROM customers;

select firstname, left(firstname,3) as intials from customers;

SELECT
CONCAT(FirstName,' - ',LastName) AS FullName
FROM customers;

-- Math Functions
-- round()

SELECT ROUND(1256.75) AS Rounded_Value;

-- ceil

SELECT CEIL(1256.25) AS Ceiling_Value;
 
 -- floor
 SELECT FLOOR(1256.75) AS Floor_Value
  
 -- mod
SELECT MOD(25,4) AS Remainder;

-- Date Functions

select * from customers;
SELECT NOW();
SELECT
CustomerID,
YEAR(DateOfBirth) AS BirthYear
FROM customers;
SELECT
CustomerID,
MONTH(DateOfBirth) AS BirthMonth
FROM customers;
SELECT
CustomerID,
DATEDIFF(CURDATE(),DateOfBirth) AS Days
FROM customers;
SELECT
CustomerID,
DATEDIFF(CURDATE(),DateOfBirth) AS Days
FROM customers;

-- Comparison Function

-- Categorize customers as Adult or Young based on their birth year
 select firstname,dateofbirth, if(year(dateofbirth) >= 1995, "adult","young") from customers;
 
 -- Display 'Not Available' if a phone number is NULL
 SELECT
    FirstName,
    IFNULL(Phone, 'Not Available') AS PhoneNumber
FROM Customers;
-- Find the latest birth date.
SELECT GREATEST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS LatestBirthDate;
-- -------------------------------------------------------
-- lAB 7

-- Task 1: Understanding OVER()


-- Task 2: Rank Customer Loans Using RANK()

select * from loans;

Select LoanID, CustomerID, LoanAmount, 
RANK() OVER( ORDER BY LoanAmount DESC) AS "Loan_Rank"
FROM Loans;


-- Task 3: Rank Customer Loans Using DENSE_RANK()

select loanid,customerid,loanamount,
dense_rank() over(order by loanamount desc) as "Loan_denserank"
from Loans;

-- Task 4: Assign Row Numbers Using ROW_NUMBER()

SELECT LoanID,CustomerID,LoanAmount,
    ROW_NUMBER() OVER(
        ORDER BY LoanAmount DESC) AS RowNumber
FROM Loan;

-- Task 5: Understanding PARTITION BY

SELECT LoanID,CustomerID,LoanAmount,
ROW_NUMBER() OVER(PARTITION BY CustomerID ORDER BY LoanAmount DESC) AS RowNum
FROM Loans;

-- Task 6: Calculate Running Total Using SUM() OVER()

SELECT
    LoanID, CustomerID,LoanAmount,
    SUM(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS RunningTotal
FROM Loans;


-- Task 7: Compare Previous Loan Records Using LAG()
SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    LAG(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS PreviousLoanAmount
FROM Loans;

-- Task 8: Compare Next Loan Records Using LEAD()

SELECT
    LoanID, CustomerID, LoanAmount,
    LEAD(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS NextLoanAmount
FROM Loans;

-- ------------lab 8 ---------------------------------------
-- Task 1: Generate Accounts Transaction Reports

SELECT
    a.AccountID, a.AccountType, a.Balance,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a 
INNER JOIN Transactions t
ON a.AccountID = t.AccountID;

-- Task 2: Display All Accounts Including Those Without Transactions
select 
a.aacountid,a.accounttype,a.balance,
t.transactionid,
t.transactiondate,
t.transactiontype,
t.amount
from accounts a
left join transactions t
on a.accountid = t.accountid;

-- Task 3: Generate Deposit Transaction Reports

SELECT
    a.AccountID, a.AccountType, a.Balance,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID
WHERE t.TransactionType = 'Deposit';

-- Task 4: Generate High Balance Account Transaction Reports

select 
a.accountid,a.accounttype,a.balance ,
t.transactionid,
t.transactiondate,
t.transactiontype,
t.amount
from accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID
WHERE a.Balance > 30000
ORDER BY a.Balance DESC;
 
-- lab 9----------------------

-- Task 1: Identify Transactions Above the Average Transaction Amount

select * from transactions;

select * from transactions
where amount>
(select avg (amount)
from transactions
);

-- Task 2: Identify Accounts with Above-Average Balance

 SELECT
    AccountID,
    AccountType,
    Balance,
    CustomerID
FROM Accounts
WHERE Balance >
(
    SELECT AVG(Balance)
    FROM Accounts
)
ORDER BY Balance DESC;

-- Task 3: Identify Deposit Accounts Using a Multi-Row Subquery

SELECT
    AccountID,
    AccountType,
    Balance,
    CustomerID
FROM Accounts
WHERE AccountID IN
(
    SELECT AccountID
    FROM Transactions
    WHERE TransactionType = 'Deposit'
);

-- Task 4: Identify the Account with the Highest Balance

SELECT
    AccountID,
    AccountType,
    Balance,
    CustomerID
FROM Accounts
WHERE Balance =
(
    SELECT MAX(Balance)
    FROM Accounts
);

-- ---- lab 10-----------------------

-- task 1 Create a View for High-Balance Accounts

create view high_balance_accounts as
select
accountid,
accounttype,
balance,
customerid
from accounts
where balance > 30000;

-- Task 2: Retrieve Data Using the View

SELECT *
FROM High_Balance_Accounts;

-- task 3 CREATE OR REPLACE VIEW High_Balance_Accounts AS
 CREATE OR REPLACE VIEW High_Balance_Accounts AS
SELECT
    a.AccountID, a.AccountType, a.Balance, a.CustomerID,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID
WHERE a.Balance > 30000;

-- Task 4: Generate Banking Reports Using the View

SELECT
    AccountID,
    AccountType,
    Balance,
    CustomerID,
    TransactionID,
    TransactionDate,
    TransactionType,
    Amount
FROM High_Balance_Accounts
ORDER BY Balance DESC;












-- 
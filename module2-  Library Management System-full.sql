-- Create the database
CREATE DATABASE library;
USE library;

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);
-- Insert data into Branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, '123 Elm St, Springfield', '555-1234'),
(2, 102, '456 Oak St, Shelbyville', '555-5678'),
(3, 103, '789 Pine St, Capital City', '555-8765'),
(4, 104, '321 Maple St, Springfield', '555-4321'),
(5, 105, '654 Cedar St, Shelbyville', '555-6789'),
(6, 106, '987 Birch St, Capital City', '555-3456'),
(7, 107, '135 Willow St, Springfield', '555-2345'),
(8, 108, '246 Elm St, Shelbyville', '555-7890'),
(9, 109, '357 Oak St, Capital City', '555-9876'),
(10, 110, '468 Pine St, Springfield', '555-6543');
desc table branch;
select * from branch;
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
-- Insert data into Employee table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(1, 'Alice Johnson', 'Manager', 60000.00, 1),
(2, 'Bob Smith', 'Assistant', 45000.00, 1),
(3, 'Charlie Brown', 'Manager', 65000.00, 2),
(4, 'Daisy Wilson', 'Assistant', 42000.00, 2),
(5, 'Eva Adams', 'Manager', 70000.00, 3),
(6, 'Frank Moore', 'Assistant', 46000.00, 3),
(7, 'Grace Lee', 'Manager', 62000.00, 4),
(8, 'Henry Clark', 'Assistant', 43000.00, 4),
(9, 'Ivy Davis', 'Manager', 68000.00, 5),
(10, 'Jack Walker', 'Assistant', 44000.00, 5);
select * from employee;
CREATE TABLE Books (
    ISBN VARCHAR(13) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);
-- Insert data into Books table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('9781234567890', 'The Great Gatsby', 'Fiction', 25.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('9782345678901', '1984', 'Dystopian', 20.00, 'no', 'George Orwell', 'Secker & Warburg'),
('9783456789012', 'To Kill a Mockingbird', 'Classic', 22.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('9784567890123', 'The Catcher in the Rye', 'Fiction', 18.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('9785678901234', 'Moby Dick', 'Classic', 24.00, 'no', 'Herman Melville', 'Harper & Brothers'),
('9786789012345', 'Pride and Prejudice', 'Romance', 21.00, 'yes', 'Jane Austen', 'T. Egerton'),
('9787890123456', 'War and Peace', 'Historical', 30.00, 'yes', 'Leo Tolstoy', 'The Russian Messenger'),
('9788901234567', 'The Hobbit', 'Fantasy', 26.00, 'yes', 'J.R.R. Tolkien', 'George Allen & Unwin'),
('9789012345678', 'Brave New World', 'Dystopian', 23.00, 'no', 'Aldous Huxley', 'Chatto & Windus'),
('9780123456789', 'Catch-22', 'Satire', 27.00, 'yes', 'Joseph Heller', 'Simon & Schuster');
select * from books;
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);
-- Insert data into Customer table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'John Doe', '123 Maple St, Springfield', '2021-06-15'),
(2, 'Jane Smith', '456 Oak St, Shelbyville', '2020-12-01'),
(3, 'Alice Brown', '789 Pine St, Capital City', '2019-03-22'),
(4, 'Bob Johnson', '321 Elm St, Springfield', '2022-01-10'),
(5, 'Carol White', '654 Cedar St, Shelbyville', '2021-09-15'),
(6, 'David Green', '987 Birch St, Capital City', '2022-07-01'),
(7, 'Eva Black', '135 Willow St, Springfield', '2020-10-23'),
(8, 'Frank Blue', '246 Elm St, Shelbyville', '2021-11-30'),
(9, 'Grace Red', '357 Oak St, Capital City', '2021-05-05'),
(10, 'Hank Purple', '468 Pine St, Springfield', '2022-04-18');
select * from customer;
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issue_date DATE,
    Isbn_book VARCHAR(13),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);
-- Insert data into IssueStatus table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issue_date, Isbn_book) VALUES
(1, 1, '2023-06-15', '9781234567890'),
(2, 2, '2023-07-01', '9782345678901'),
(3, 3, '2023-05-20', '9783456789012'),
(4, 4, '2023-08-10', '9784567890123'),
(5, 5, '2023-06-25', '9785678901234'),
(6, 6, '2023-07-30', '9786789012345'),
(7, 7, '2023-06-10', '9787890123456'),
(8, 8, '2023-05-15', '9788901234567'),
(9, 9, '2023-07-22', '9789012345678'),
(10, 10, '2023-06-05', '9780123456789');
select * from IssueStatus;

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(13),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
-- Insert data into ReturnStatus table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(1, 1, 'The Great Gatsby', '2023-07-01', '9781234567890'),
(2, 2, '1984', '2023-07-20', '9782345678901'),
(3, 3, 'To Kill a Mockingbird', '2023-06-30', '9783456789012'),
(4, 4, 'The Catcher in the Rye', '2023-08-15', '9784567890123'),
(5, 5, 'Moby Dick', '2023-07-10', '9785678901234'),
(6, 6, 'Pride and Prejudice', '2023-08-01', '9786789012345'),
(7, 7, 'War and Peace', '2023-06-25', '9787890123456'),
(8, 8, 'The Hobbit', '2023-06-15', '9788901234567'),
(9, 9, 'Brave New World', '2023-07-10', '9789012345678'),
(10, 10, 'Catch-22', '2023-06-12', '9780123456789');
select * from ReturnStatus;
-- 1.Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';
-- 2.List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;
-- 3.Retrieve the book titles and the corresponding customers who have issued those books.
SELECT b.Book_title, c.Customer_name FROM IssueStatus i
JOIN Books b ON i.Isbn_book = b.ISBN
JOIN Customer c ON i.Issued_cust = c.Customer_Id;
-- 4.Display the total count of books in each category.
SELECT Category, COUNT(*) AS Total_Count FROM Books GROUP BY Category;
-- 5.Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;
-- 6.List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT c.Customer_name FROM Customer c LEFT JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE c.Reg_date < '2022-01-01' AND i.Issued_cust IS NULL;
-- 7.Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no;
-- 8.Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT c.Customer_name FROM IssueStatus i JOIN Customer c ON i.Issued_cust = c.Customer_Id
WHERE i.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';
-- 9.Retrieve book_title from the book table containing history.
SELECT DISTINCT b.Book_title FROM Books b JOIN IssueStatus i ON b.ISBN = i.Isbn_book
UNION
SELECT DISTINCT b.Book_title
FROM Books b
JOIN ReturnStatus r ON b.ISBN = r.Isbn_book2;
-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no
HAVING COUNT(*) > 5;
-- 11.Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT e.Emp_name, b.Branch_address FROM Employee e JOIN Branch b ON e.Branch_no = b.Branch_no
WHERE e.Position = 'Manager';
-- 12 Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT DISTINCT c.Customer_name FROM IssueStatus i JOIN Books b ON i.Isbn_book = b.ISBN
JOIN Customer c ON i.Issued_cust = c.Customer_Id
WHERE b.Rental_Price > 25;





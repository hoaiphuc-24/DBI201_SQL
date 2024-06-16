CREATE DATABASE Slot11
USE Slot11
CREATE TABLE Customers(
CustomerID int PRIMARY KEY,
CustomerName varchar(255),
ContactName varchar(255),
Address varchar(255),
City varchar(255),
PostalCode varchar(10),
Country varchar(50)
)

CREATE TABLE Employees(
EmployeeID int PRIMARY KEY,
LastName nvarchar(20),
FirstName nvarchar(10),
BirthDate datetime,
SupervisorID int
)
CREATE TABLE Orders(
OrderID int PRIMARY KEY,
CustomerID int
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
EmployeeID int
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
OrderDate datetime
)

select * from Employees
INSERT INTO Employees VALUES(1, 'Davolio', 'Nancy', '1968-12-08', NULL)
INSERT INTO Employees VALUES(2, 'Fuller', 'Andrew', '1952-02-19', 1)
INSERT INTO Employees VALUES(3, 'Leverling', 'Janet', '1963-8-30', 1)

select * from Customers
INSERT INTO Customers VALUES(1, 'Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', 4006, 'Norway')
INSERT INTO Customers VALUES(2, 'Greasy Burger', 'Per Olsen', 'Gateveien 15', 'Sandnes', 4306, 'Norway')
INSERT INTO Customers VALUES(3, 'Tasty Tee', 'Finn Egan', 'Streetroad 19B', 'Liverpool', 'L1 0AA', 'UK')

SELECT * FROM Orders
INSERT INTO Orders VALUES(1,1,1,'1996-07-04')
INSERT INTO Orders VALUES(2,1,1,'1996-07-05')
INSERT INTO Orders VALUES(3,1,1,'1996-07-08')
INSERT INTO Orders VALUES(4,2,1,'1996-07-08')
INSERT INTO Orders VALUES(5,2,2,'1996-07-09')

SELECT a.EmployeeID, a.FirstName, b.EmployeeID AS 'Supervisor ID', b.FirstName AS 'Supervisor Name'
FROM Employees a INNER JOIN Employees b ON a.SupervisorID = b.EmployeeID


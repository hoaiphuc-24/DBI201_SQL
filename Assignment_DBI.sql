CREATE DATABASE Marker
use Marker

CREATE TABLE Customer(
	CusID int PRIMARY KEY,
	Fullname NVARCHAR(100) NOT NULL,
	Address VARCHAR(100),
	Phone int,
)

CREATE TABLE Orders(
    OrderID int PRIMARY KEY,
    Cus_ID int,
    Date DATE,
    TotalAmount int,
)

CREATE TABLE Payment (
    PayID int PRIMARY KEY,
    Paymentmethod NVARCHAR(50)
)

CREATE TABLE Product (
    ProductID int PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Price int,
    Quantity int
)

CREATE TABLE Supplier (
    ID int PRIMARY KEY,
    Phone VARCHAR(20) NOT NULL,
    Address NVARCHAR(100)
)

CREATE TABLE Has (
    OrderID int,
    PayID int,
    Sale_price int,
    Quantity int,
    PRIMARY KEY(OrderID, PayID)
)
CREATE TABLE Invoice(
    OrderID int,
    ProductID int,
    Sale_price int,
    Quantity int,
    PRIMARY KEY(OrderID, ProductID)
)



CREATE TABLE Provide(
    ID int,
    ProductID int,
    Factory_gate_price int,
    Quantity int,
    PRIMARY KEY(ID, ProductID)
)

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Cus_ID FOREIGN KEY (Cus_ID) REFERENCES Customer(CusID)

ALTER TABLE Has ADD CONSTRAINT FK_Has_OrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
ALTER TABLE Has ADD CONSTRAINT FK_Has_Pay_ID FOREIGN KEY (PayID) REFERENCES Payment(PayID)

ALTER TABLE Invoice ADD CONSTRAINT FK_Invoice_OrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
ALTER TABLE Invoice ADD CONSTRAINT FK_Invoice_ProductID FOREIGN KEY (ProductID) REFERENCES Product(ProductID)

ALTER TABLE Provide ADD CONSTRAINT FK_Provide_ID FOREIGN KEY (ID) REFERENCES Supplier(ID)
ALTER TABLE Provide ADD CONSTRAINT FK_Provide_ProductID FOREIGN KEY (ProductID) REFERENCES Product(ProductID)

INSERT INTO Customer (CusID, Fullname, Address, Phone)
VALUES 
(1, 'John Doe', '122 Elm Street', 0764567890),
(2, 'Jane Smith', '486 Maple Avenue', 2345678901),
(3, 'Alice Johnson', '689 Oak Boulevard', 3456789012),
(4, 'john', '134 Oak', 8963728461)

INSERT INTO Orders (OrderID, Cus_ID, Date, TotalAmount)
VALUES 
(1, 1, '2024-06-01', 150),
(2, 2, '2024-06-02', 200),
(3, 3, '2024-06-03', 250),
(4, 4, '2024-06-04', 300)

INSERT INTO Payment (PayID, Paymentmethod)
VALUES 
(1, 'Credit Card'),
(2, 'PayPal'),
(3, 'Bank Transfer'),
(4, 'Cash')

INSERT INTO Product (ProductID, Name, Price, Quantity)
VALUES 
(1, 'Laptop', 1000, 10),
(2, 'Smartphone', 500, 20),
(3, 'Tablet', 300, 30),
(4, 'TV', 550, 15)

INSERT INTO Supplier (ID, Phone, Address)
VALUES 
(1, '555-1234', '321 Pine Street'),
(2, '555-5678', '654 Cedar Road'),
(3, '555-9012', '987 Birch Lane')

INSERT INTO Has (OrderID, PayID, Sale_price, Quantity)
VALUES 
(1, 1, 150, 1),
(2, 2, 200, 1),
(3, 3, 250, 1)

INSERT INTO Invoice (OrderID, ProductID, Sale_price, Quantity)
VALUES 
(1, 1, 150, 1),
(2, 2, 200, 1),
(3, 3, 250, 1)

INSERT INTO Provide (ID, ProductID, Factory_gate_price, Quantity)
VALUES 
(1, 1, 800, 5),
(2, 2, 400, 10),
(3, 3, 250, 15)
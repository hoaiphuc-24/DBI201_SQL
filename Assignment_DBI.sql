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


CREATE DATABASE Managment
use Managment

CREATE TABLE Location(
	locNum int PRIMARY KEY,
	locName NVARCHAR(50)
)

CREATE TABLE Department(
	depNum int PRIMARY KEY,
	depName NVARCHAR(50),
	mgrAssDate datetime
)
ALTER TABLE Department
ADD mgrSSN decimal

CREATE TABLE Employee(
	empSSN decimal PRIMARY KEY,
	empName NVARCHAR(50),
	empAddress NVARCHAR(50),
	empSalary decimal,
	empSex CHAR(1),
	empBirthdate datetime,
	depNum int FOREIGN KEY REFERENCES Department(depNum),
	supervisorSSN decimal FOREIGN KEY REFERENCES Employee(empSSN),
	empStardate datetime
)

ALTER TABLE Department
ADD CONSTRAINT FK_Department_empSSN FOREIGN KEY (mgrSSN)
REFERENCES Employee(empSSN)


CREATE TABLE Project(
	proNum int PRIMARY KEY,
	proName NVARCHAR(50),
	locNum int FOREIGN KEY REFERENCES Location(locNum),
	depNum int FOREIGN KEY REFERENCES Department(depNum)
)

CREATE TABLE WorksOn(
	empSSN decimal,
	proNum int NOT NULL FOREIGN KEY REFERENCES Project(proNum),
	workHous int,
	PRIMARY KEY(empSSN, proNum)
)

CREATE TABLE Dependent(
	depName	NVARCHAR(50),
	empSSN decimal FOREIGN KEY REFERENCES Employee(empSSN),
	depSex char(1),
	depBirthdate datetime,
	depRelationship NVARCHAR(50),
	PRIMARY KEY(depName, empSSN)
)

CREATE TABLE DepLocation(
	depNum int FOREIGN KEY REFERENCES Department(depNum),
	locNum int FOREIGN KEY REFERENCES Location(locNum)
	PRIMARY KEY( depNum, locNum)
)

	
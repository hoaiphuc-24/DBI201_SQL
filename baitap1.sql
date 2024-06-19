CREATE DATABASE art_gallery
use art_gallery

CREATE TABLE paintings(
	id int PRIMARY KEY,
	name VArCHAR(55),
	artist_id int FOREIGN KEY REFERENCES artists(id),
	listed_price float,
)
CREATE TABLE artists(
	id int PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
)

CREATE TABLE collectors(
	id int PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
)

CREATE TABLE sales(
	id int PRIMARY KEY,
	date datetime,
	painting_id int FOREIGN KEY REFERENCES	paintings(id),
	artist_id int FOREIGN KEY REFERENCES artists(id),
	collector_id int FOREIGN KEY REFERENCES collectors(id),
	sales_price int
)

INSERT INTO paintings
VALUES
	(11 ,'Miracle', 1, 300.00),
	(12	,'Sunshine',1, 700.00),
	(13	,'Pretty woman',2, 2800.00),
	(14 ,'Handsome man',2,2300.00),
	(15 ,'Barbie', 3, 250.00),
	(15	,'Barbie', 3, 250.00),
	(17	,'Black square #1000',3, 50.00),
	(18	,'Mountains',4, 1300.00)

INSERT INTO artists
VALUES 
	(1,'Thomas', 'Black'),
	(2,	'Kate',	'Smith'),
	(3,	'Natali','Wein'),
	(4,	'Francesco','Benelli')

INSERT INTO collectors
VALUE 
	(101, 'Brandon', 'Cooper'),
	(102, 'Laura', 'Fisher'),
	(103, 'Christina', 'Buffet'),
	(104, 'Steve', 'Stevenson')

INSERT INTO sales
VALUES
	(1001,	2021-11-01	,13, 2, 104, 2500.00),
	(1002,	2021-11-10	,14, 2,	102, 2300.00),
	(1003,	2021-11-10	,11, 1, 102, 300.00),
	(1004,	2021-11-15	,16, 3, 103, 4000.00),
	(1005,	2021-11-22	,15, 3,	103, 200.00),
	(1006,	2021-11-22	,17, 3, 103, 50.00)
	


	
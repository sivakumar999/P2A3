Drop database ExerciseDb
create database ExerciseDb
on primary
(name = ExerciseDb_data,
filename = 'M:\Simplilearn\mphasis\Phase-2\day-3\Assign3\ExerciseDb_data.mdf')

use ExerciseDb
---------------------------------------------------
CREATE TABLE Companyinfo (
    CId INT PRIMARY KEY,
    CName NVARCHAR(100)
);
INSERT INTO Companyinfo (CId, CName) VALUES 
(1, 'SamSung'), (2, 'HP '), (3, 'Apple '),(4,'Dell'), (5, 'Toshiba '), (6, 'Redmi')


CREATE TABLE Productinfo (
    PId INT PRIMARY KEY,
    PName NVARCHAR(100),
    PPrice DECIMAL(10, 2),
    PMDate DATE,
    CId INT,
    FOREIGN KEY (CId) REFERENCES Companyinfo(CId)
)
INSERT INTO Productinfo (PId, PName, PPrice, PMDate, CId)
VALUES
    (101, ' Laptop', 55000.90, '12/12/2023', 1),
    (102, 'Laptop', 35000.90, '12/12/2012', 2),
    (103, 'Mobile', 15000.90, '12/12/2012', 2),
	(104, 'Laptop', 135000.90, '12/12/2012', 3),
    (105, 'Mobile', 65000.90, '12/12/2012', 3),
    (106, 'Laptop', 35000.90, '12/12/2012', 5),
	(107, 'Mobile', 35000.90, '12/12/2012', 5),
    (108, 'Earpod', 1000.90, '12/01/2022', 3),
    (109, 'Laptop', 85000.90, '12/12/2021', 6),
	(110, 'Mobile', 55000.70, '12/12/2020', 1)
    
--Show All  Companies Name and their products detail
SELECT c.CName, p.PId, p.PName, p.PPrice, p.PMDate
FROM Companyinfo c
JOIN Productinfo p ON c.CId = p.CId;

--Show All products names and their respective company
SELECT p.PName, c.CName
FROM Productinfo p
JOIN Companyinfo c ON p.CId = c.CId;

--show all posible combinations of company and products
SELECT c.CName, p.PName
FROM Companyinfo c
CROSS JOIN Productinfo p;


-----Assign Part2-------
-- Creating the Products table
drop table Products
CREATE TABLE Products (
    PId INT PRIMARY KEY,
    PQ INT,
    PPrice float,
    Discount float
)

-- Inserting sample data into Products table
INSERT INTO Products (PId, PQ, PPrice, Discount)
VALUES
    (1, 3, 15000.00, 0.30),
    (2, 5, 5000.00, 0.15),
    (3, 7, 27000.00, 0.95)

-- Creating a function to calculate discounted value
CREATE FUNCTION CalculateDiscountedValue (@price DECIMAL(10, 2), @discount DECIMAL(5, 2))
RETURNS DECIMAL(10, 2)
AS
BEGIN
DECLARE @discountedValue DECIMAL(10, 2);
SET @discountedValue = @price - (@price * @discount);
RETURN @discountedValue
END


SELECT PId,PPrice AS Price,Discount, dbo.CalculateDiscountedValue(PPrice, Discount) AS DiscountedPrice
FROM Products;




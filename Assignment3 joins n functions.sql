Drop database ExerciseDb
create database ExerciseDb
on primary
(name = ExerciseDb_data,
filename = 'M:\Simplilearn\mphasis\Phase-2\day-3\Assign3\ExerciseDb_data.mdf')

use ExerciseDb
---------------------------------------------------
create table Companyinfo (
    CId int primary key,
    CName nvarchar(100)
)
insert into Companyinfo (CId, CName) values
(1, 'SamSung'), (2, 'HP '), (3, 'Apple '),(4,'Dell'), (5, 'Toshiba '), (6, 'Redmi')


create table Productinfo (
    PId int primary key,
    PName nvarchar(100),
    PPrice decimal(10, 2),
    PMDate date,
    CId int,
    foreign key (CId) references Companyinfo(CId)
)
insert into Productinfo (PId, PName, PPrice, PMDate, CId)
values
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
select c.CName, p.PId, p.PName, p.PPrice, p.PMDate
from Companyinfo c
join Productinfo p on c.CId = p.CId;

--Show All products names and their respective company
select p.PName, c.CName
from Productinfo p
join Companyinfo c on p.CId = c.CId;

--show all posible combinations of company and products
select c.CName, p.PName
from Companyinfo c
cross join Productinfo p;


-----Assign Part2-------
-- Creating the Products table

create table Products (
    PId int primary key,
    PQ int,
    PPrice float,
    Discount float
)

-- Inserting sample data into Products table
insert into Products (PId, PQ, PPrice, Discount)
values
    (1, 3, 15000.00, 0.20),
    (2, 5, 5000.00, 0.15),
    (3, 7, 27000.00, 0.35)

-- Creating a function to calculate discounted value
create function CalculateDiscountedValue (@price float, @discount float)
returns float
as
begin
declare @discountedValue float;
set @discountedValue = @price - (@price * @discount);
return @discountedValue;
end;


select PId,PPrice as Price,Discount, dbo.CalculateDiscountedValue(PPrice, Discount) as DiscountedPrice
from Products;




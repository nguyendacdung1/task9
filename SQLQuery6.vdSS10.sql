use AdventureWorks2019
go 
--1
create view vw_productInfo AS
select ProductID, ProductBumber, Name, SafetyStocLevel
from Production.Product;
go
--2
Select*from vw_productInfo
go
--3
create view vw_personDetails AS
select p.Title,
       p.[FirstName],
	   p.[MiddleName],
	   p.[LastName],
	   e.[JobTitle]
from [HumanResources].[Employee] e
     inner join [Person].[Person] p
	 on p.[BusinessEntityID]=e.[BusinessEntityID]
go
--4
select*from vw_personDetails
--5
create view vw_PersonDetailsNew
as
select 
  coalesce(p.Title,'') as MiddleName,
  p.[FirstName],
  coalesce(p.MiddleName,'') as MiddleName,
  p.[LastName],
  e.[JobTitle]
from [HumanResources].[Employee] e
inner join [Person].[Person] p
on p.[BusinessEntityID]=e.[BusinessEntityID]
go

--6
create view vw_sortedpersondetails AS
select top 10 coalesce(p.Title,'') As Title,
p.[FirstName],
coalesce(p.MiddleName, '') as MiddleName,
p.[LastName],
e.[JobTitle]
from [HumanResources].[Employee] e inner join [Person].[Person] p
on p.[BusinessEntityID]=e.[BusinessEntityID] order by p.FirstName
go
--Retrieve records from the view
select*from vw_sortedpersondetails

--7
Create table employee_personal_details(
empID int not null,
FirstName varchar(30) not null,
LastName varchar(30) not null,
address varchar(30)
)
--8
create table employee_salary_details(
empID int not null,
designation varchar(30),
salary int not null
)
--9
create view vw_employeepersonnaldetails as
select e1.empID,FirstName,LastName,disignation,salary
from employee_personal_details
join employee_salary_details e2
on e1.empID=e2.empID
--10
insert into vw_employeepersonnaldetails values(2,'jack','wilson','software developer',16000)
--11
create view vwEmpdetails as
select FirstName,address
from employee_personal_details
--12
insert into vwEmpdetails values('jack','NYC')
--13
create table product_details(
productID int,
productName varchar(30),
rate money
)
--14
create view vwProduct_details
as
select productName,rate 
from product_details
--15
update vwProduct_details
set rate=3000
where productName='DVDWrite'
--16
create view vwproduct_details as
select
productName,description,rate
from product_details
--17
update vwProduct_details
set Description.write(N'Ex',0,2)
where productName='Portable Hard Drive'
--18
delete from vwCustDetails
where CustID='c0004'
--19
alter view vwProductInfo as
select productID,productNumber,Name,SafetyStockLevel,ReOrderPoint
from Production.Product;
go
--20
drop view vw_productInfo
--21
exec sp_helptext vw_Employeepersonaldetails
--22
create view vw_productdetails As
select
productName,
AVG(rate)as averageRate from product_details 
group by productName
--23
create view vw_productinfo as
select productID,productNumber,Name,SafetyStockLevel,
reOrderPoint
from Production,product
where safetyStockLevel<=1000
with check option;
go
--24
update vw_productinfo set SafetyStockLevel=2500
where ProductID=321
--25
create view vw_NewProductInfo with schemabinding as
select productID, productBumber,Name,safetyStockLevel
from Production.Product
go
--26
create table Customers
(
CustID int,
CustName varchar(50),
Address varchar(60)
)
--27
create view vwCustomers
as
select*from Customers
--28
select*from vwCustomers
--29
alter table Customers add age int
--30
select*from vwCustomers
--31
exec sp_refreshview 'vwCustomers'
--32
alter table Production.Product alter column ProductID varchar(7)

       

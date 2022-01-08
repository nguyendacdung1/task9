--33
execute xp_fileexitst 'c:\MyTest.txt'
--34
create procedure uspGetCustTerritory
as
select top 10 CustomerID, Customer.TerritoryID, Sales.SalesTerritory.Name
from Sales.Customer JOIN Sales.Sales Territori ON Sales.Customer.TerritoryID=Sales.SalesTerritoryID
--35
exec uspGetCustTerritory
--36
create procedure uspGetSales @territory varchar(40) as
select BuisinessEntityID, B.SalesYTD, B.SalesLastYear From
Sales.SalesPerson A
join Sales.SalesTerritory B
on A.territoryID=B.TerritoryID where
B.name=@territory;
--Execute the stored procedure EXEC
uspGetSales 'Northwest'
--37
create procedure uspGetTotalSales @territory
varchar(40),@sum int OUTPUT as
select @sum=sum(B.SalesYTD) from
Sales.salesPerson A JOIN
Sales.SalesTerritoryB
on A.TerritoryID=B.TerritoryID
where B.Name=@territory
--38
Declare @sumsalesmoney
exec uspGetCustTerritory 'Northwest',@sumsales OUTPUT
PRINT 'The year-to-date sales figure for this territory is' +convert (varchar(100),@sumsales);
--39
alter procedure[dbo].[uspGetTotals]
      @territory varchar=40
as
   select BusinessEntityID,B.SalesYTD,B.CostYTD,B.salesLastYear from
   sales.salesPerson A join sales.salesTerritoryB
   on A.TerritoryID=B.TerritoryID
   where B.name=@territory;
   go
   --40
   drop procedure uspGetTotals
   --41
   Create procedure nestedProcedure as
   begin 
   exec uspGetCustTerritory
   exec CuspGetSales'France'
   end
   --42
   select name,object_id,type,type_desc
   from sý.tables;
   --43
   select table_catalog,table_schema,Table_name,table_type
   frpm information_schema.tables;
   --44
   select serverproperty('EDITION') AS EditionName;
   --45
   select session_id,login_time,program_name from sys.dm_exec_sessions
   where login_name='sa' andis_user_process=1;

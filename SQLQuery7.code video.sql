use AdventureWorks2019
go
--tạo 1 thủ tục lưu trữ lấy ra toàn bộ nhân viên vào làm theo năm có tham số đầu vào là một năm 
create procedure sp_DisplayEmployeeHireYear
@HireYear int
as
select*from HumanResources.Employee
where DATEPART(YY,HireDate)=@HireYear
go
--để chạy thử tục này cần truyền tham số vào là năm nhân viên vào làm 
execute sp_DisplayEmployeeHireYear 2009
go

--Tạo thủ tục lưu trữ đếm số người vào làm trong một năm xác định có tham số đầu vào là một năm,tham số đầu ra là số người vào làm trong năm
create procedure sp_EmployeesHireYearCount
   @HireYear int,
   @Count int output
as
select @Count=count(*) from HumanResources.Employee
where datepart(YY,HireDate)=@HireYear
go
--chạy thử tục lưu trữ cần truyền vào 1 tham số đầu vào và một tham số đầu ra.
declare @number int
execute sp_EmployeesHireYearCount 2009, @Number output
print @Number
go

--taoh thủ tục lưu trữ đếm số người vào làm trong 1 năm xác định có tham gia số đầu bào là một năm, hàm trả về số người làm năm đó 
create procedure so_EmployeeHireYearCount2
  @HireYear int
as
declare @Count int
select @Count=count(*) from HumanResources.Employee
where DATEPART(YY,HireDate)=@HireYear
return @Count
go
--chạy thử tục 
declare @Number int
exec @Number = sp_EmployeesHireYearCount2 2009
print @Number
go

--tạo bảng tạm #Students
create table #Students
(
  rollno varchar(6) constraint pk_Students primary key,
  fullname nvarchar(100),
  birthday datetime constraint df_studentsbirthday default dateadd(yy, -18,getdate())
)
go
--tạo thủ tục lưu trữ tạm để chèn dữ liệu 
create procedure #spInsertStudents
    @rollno varchar(6),
	@fullname nvarchar(100),
	@birthday datetime 
as begin 
     if(@birthday is null)
	   set @birthday=DATEADD(YY,-18,getdate())
     insert into #Students(rollno,fullname,birthday)
	    values(@rollno,@fullname,@birthday)
end
go
--sử dụng thử tục lưu trữ để chèn dữ liệu
exec #spStudents 'A12345', 'abc',null
exec #spStudents 'A54321','abc','12/24/2011'
select*from #Students

create procedure sp_DisplayEmployees as
select*from HumanResources.Employee
go
--thay đổi thử tục
alter procedure sp_DisplayEmployees as
select*from HumanResources.Employee
where Gender='F'
go
--chạy thử 
exec sp_DisplayEmployees
go

--xóa thử tục
drop procedure sp_DisplayEmployees
go



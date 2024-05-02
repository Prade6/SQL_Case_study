create database Digital_Asset_Management_App 

--Creating employees table
create table employees(
employee_id int identity(1,1) not null primary key,
[name] varchar(20) not null,
department varchar(20) not null,
email varchar(20) not null,
[password] varchar(15) not null)

--Creating assets table
create table assets(
asset_id int identity(101,1) not null primary key,
[name] varchar(20) not null,
[type] varchar(20) not null,
[serial_number] int not null,
purchase_date datetime not null,
[location] varchar(20) not null,
[status] varchar(20) not null,
owner_id int,
foreign key(owner_id) references employees(employee_id))

--Creating maintenance_records table
create table maintenance_records(
maintenance_id int identity(1,1) primary key,
asset_id int,
maintenance_date date not null,
[description] varchar(100) not null,
cost decimal(10,2) not null,
foreign key(asset_id) references assets(asset_id))

--Creating asset_allocations table
create table asset_allocations(
allocation_id int identity(1,1) primary key,
asset_id int,
employee_id int,
allocation_date date not null,
return_date date not null,
foreign key(asset_id) references assets(asset_id),
foreign key(employee_id) references employees(employee_id))

--Creating reservations table
create table reservations(
reservation_id int identity(1,1) primary key,
asset_id int,
employee_id int,
reservation_date date not null,
[start_date] date not null,
end_date date not null,
[status] varchar(10) not null,
foreign key(asset_id) references assets(asset_id),
foreign key(employee_id) references employees(employee_id))

insert into employees values('Pradeepa','Manufacturing','prade@gmail.com','123@pass'),
							('Saranya','Production','saran12@gmail.com','2324@Sara')
insert into employees values('Sheela','Testing','sheela@gmail.com','345@ert')

insert into assets values('ASUS Vivbook','laptop',1,'2023-05-24 12:00:00','Chennai','under maintenance',1),
						 ('Shift','Vehicle',2,getdate(),'Mumbai','In use',2)
insert into assets values('Dell','System',3,getdate(),'Banglore','under maintenance',3)

insert into maintenance_records values(101,'2023-12-12','System maintenance',6000)
insert into maintenance_records values(103,getdate(),'System maintenance',10000)

insert into asset_allocations values(102,2,getdate(),'2024-05-21')

insert into reservations values(102,2,'2024-04-30',getdate(),'2024-05-21','approved')

select* from employees
select* from assets
select* from maintenance_records
select* from asset_allocations
select* from reservations




create database Assignment
go

use Assignment
go

-- CREATE TABLES
create table customers
(
	[customers_id] int identity unique,
	primary key ([customers_id]),
	[full_name] nvarchar(50) not null,
	[email] nvarchar(50)not null,
	[phone_number] int not null,
	[address] nvarchar(500) not null,
	[nationality] nvarchar(50) not null
)

create table rooms 
(
	[rooms_id] nvarchar(50) primary key,
	[type] nvarchar(50) not null,
	[price] int not null check (price>0),
	[description] nvarchar(500) not null
)

create table items
(
	[items_id] nvarchar(50) primary key,
	[name] nvarchar(50) not null,
	[description] nvarchar(500) not null,
	[price] int not null check (price>0)
)

create table booking
(
	[booking_id] nvarchar(50) primary key,
	[customers_id] int not null foreign key references customers(customers_id) 
	on delete cascade
	on update cascade,
	[total_price] int not null check (total_price>0)
)

create table bills
(
	[bills_id] nvarchar(50) primary key,
	[booking_id] nvarchar(50) not null foreign key references booking(booking_id) 
	on delete cascade
	on update cascade,
	[rooms_id] nvarchar(50) not null foreign key references rooms(rooms_id)
	on delete cascade
	on update cascade,
	[check_in_time] datetime not null,
	[check_out_time] datetime not null,
	[rent] time not null
)

create table orders
(
	[orders_id] int identity unique,
	primary key ([orders_id]),
	[bills_id] nvarchar(50) not null foreign key references bills(bills_id) 	
	on delete cascade
	on update cascade,
	[items_id] nvarchar(50) not null foreign key references items(items_id) 	
	on delete cascade
	on update cascade,
	[quantity] int not null check (quantity>0)
)

-- INSERT DATA
insert into customers 
values 
('Tan Khoa Huynh', 'khoatanhuynh@dihotel.com', '0913457821', '192 Nguyen Luong Bang st, Lien Chieu district, Da Nang', 'Vietnam'),
('Tri Minh Dang Van', 'triminhgcd210001@greenwich.com', '0948257822', '91 Dong Da st, Hai Chau district, Da Nang', 'Vietnam'),
('Cong Chien Huynh', 'congchiengcd210002@greenwich.com', '0948243823', ' 221 Nguyen Thi Minh Khai st, Hai Chau district, Da Nang', 'Vietnam'),
('Cong Hieu Nguyen', 'conghieu210003@greenwich.com', '0936497824', '132 Dien Bien Phu st, Thanh Khe district, Da Nang', 'Vietnam'),
('Dieu Thao Tran', 'dieuthaogcd210004@greenwich.com', '0913457825', '45 Nguyen Luong Bang st, Lien Chieu district, Da Nang', 'Vietnam'),
('Huu Thang Le', 'huuthanggcd210006@greenwich.com', '0935457826', ' 658 Ngo Quyen st, Son Tra district, Da Nang', 'Vietnam'),
('Phuc Khang Truong Van', 'phuckhanggcd210007@greenwich.com', '0942457827', '112 Tran Quang Khai st, Son Tra district, Da Nang', 'Vietnam'),
('Vu Le', 'vugcd210008@greenwich.com', '0913457828', '18 Le Duan st, Hai Chau district, Da Nang', 'Vietnam'),
('Mai Hoa Nguyen Thi', 'maihoagcd210009@greenwich.com', '0923127829', '57 Le Loi st, Hai Chau district, Da Nang', 'Vietnam'),
('The Son Do', 'thesongcd210010@greenwich.com', '0987643224', '162 Ngo Quyen st, Son Tra district, Da Nang', 'Vietnam'),
('Phuoc Linh Mai Tran', 'phuoclinhgcd210011@greenwich.com', '0914522738', ' 16 Ly Thai To st,  Hai Chau district, Da Nang', 'Vietnam')

insert into rooms
values
('SGL-001', 'Single room', '500000', '01 person, 01 twin bed.'),
('SGL-002', 'Single room', '500000', '01 person, 01 twin bed.'),
('SGL-003', 'Single room', '500000', '01 person, 01 twin bed.'),
('DBL-001', 'Double room', '600000', '02 person, 01 double bed/02 twin beds.'),
('DBL-002', 'Double room', '600000', '02 person, 01 double bed/02 twin beds.'),
('DBL-003', 'Double room', '600000', '02 person, 01 double bed/02 twin beds.'),
('TPL-001', 'Triple room', '700000', '03 person, 03 twin beds/01 twin bed and 01 double bed.'),
('TPL-002', 'Triple room', '700000', '03 person, 03 twin beds/01 twin bed and 01 double bed.'),
('TPL-003', 'Triple room', '700000', '03 person, 03 twin beds/01 twin bed and 01 double bed.'),
('PREMIUM', 'Premium room', '1000000', '03 person, 01 twin bed and 01 double bed.')


insert into items
values
('MC-001', 'Instant Noodle', 'Main course', '20000'),
('MC-002', 'Spaghetti', 'Main course', '25000'),
('MC-003', 'Beef Noodle Soup', 'Main course', '30000'),
('MC-004', 'My Quang', 'Main course', '30000'),
('MC-005', 'Banh My', 'Main course', '25000'),
('FF-001', 'Coke', 'Fast food', '10000'),
('FF-002', 'Donut', 'Fast food', '5000'),
('FF-003', 'Pizza', 'Fast food', '25000'),
('FF-004', 'Fried Chicken', 'Fast food', '25000'),
('FF-005', 'Burger', 'Fast food', '30000')

insert into booking
values
('DBDD0101', 1, '540000'),
('DBDD0102', 2, '535000'),
('DBDD0103', 3, '750000'),
('DBDD0104', 4, '540000'),
('DBDD0105', 5, '565000'),
('DBDD0106', 6, '1010000'),
('DBDD0107', 7, '630000'),
('DBDD0108', 8, '760000'),
('DBDD0109', 9, '540000'),
('DBDD0110', 10, '1090000')

insert into bills
values
('TKH0010101', 'DBDD0101', 'SGL-001', '2022-06-25 14:00:00', '2022-06-26 12:00:00', '22:00:00'),
('TMD0010102', 'DBDD0102', 'SGL-002', '2022-06-26 14:00:00', '2022-06-27 12:00:00', '22:00:00'),
('CCH0010103', 'DBDD0103', 'TPL-001', '2022-06-26 14:00:00', '2022-06-27 12:00:00', '22:00:00'),
('CHN0010104', 'DBDD0104', 'SGL-003', '2022-06-27 14:00:00', '2022-06-28 12:00:00', '22:00:00'),
('DTT0010105', 'DBDD0105', 'SGL-002', '2022-06-28 14:00:00', '2022-06-29 12:00:00', '22:00:00'),
('HTL0010106', 'DBDD0106', 'PREMIUM', '2022-06-29 14:00:00', '2022-06-30 12:00:00', '22:00:00'),
('PKT0010107', 'DBDD0107', 'DBL-001', '2022-06-30 14:00:00', '2022-07-01 12:00:00', '22:00:00'),
('VL0010108', 'DBDD0108', 'TPL-003', '2022-07-01 14:00:00', '2022-07-02 12:00:00', '22:00:00'),
('MHN0010109', 'DBDD0109', 'SGL-002', '2022-07-01 14:00:00', '2022-07-02 12:00:00', '22:00:00'),
('TSD0010110', 'DBDD0110', 'PREMIUM', '2022-07-07 14:00:00', '2022-07-08 12:00:00', '22:00:00')

  
insert into orders
values
('TKH0010101', 'MC-001', '01'),
('TKH0010101', 'FF-001', '02'),
('TMD0010102', 'MC-005', '01'),
('TMD0010102', 'FF-001', '01'),
('CCH0010103', 'MC-002', '01'),
('CCH0010103', 'FF-003', '01'),
('CHN0010104', 'MC-003', '01'),
('CHN0010104', 'FF-001', '01'),
('DTT0010105', 'MC-004', '01'),
('DTT0010105', 'FF-001', '01'),
('DTT0010105', 'FF-003', '01'),
('HTL0010106', 'FF-001', '01'),
('PKT0010107', 'FF-005', '01'),
('VL0010108', 'MC-005', '02'),
('VL0010108', 'FF-001', '01'),
('MHN0010109', 'MC-003', '01'),
('MHN0010109', 'FF-001', '01'),
('TSD0010110', 'MC-002', '01'),
('TSD0010110', 'MC-005', '01'),
('TSD0010110', 'FF-001', '01'),
('TSD0010110', 'FF-002', '01'),
('TSD0010110', 'FF-004', '01')

-- CREATE TRIGGER
create trigger tr_customers_WhitespaceBlocking on customers for insert, update
AS
	IF 
	(EXISTS 
		(
		SELECT * FROM inserted
		WHERE [full_name] IS NULL OR LEN ([full_name]) = 0
		)
	)
BEGIN
		RAISERROR ('The full name of the customer cannot be empty. Please re-enter.', 16, 1)
		ROLLBACK
		RETURN
END


create trigger tr_rooms_WhitespaceBlocking on rooms for insert, update
AS
	IF 
	(EXISTS 
		(
		SELECT * FROM inserted
		WHERE [type] IS NULL OR LEN ([type]) = 0
		)
	)
BEGIN
		RAISERROR ('The type of room cannot be empty. Please re-enter.', 16, 1)
		ROLLBACK
		RETURN
END

-- CREATE STORE PROCEDURE
CREATE PROCEDURE CustomerBill
as
select bills.bills_id as [Bill ID], 
customers.full_name as [Full name], 
bills.check_in_time as [Check-in], 
bills.check_out_time as [Check-out], 
bills.rent [Rental time],
booking.total_price [Subtotal price]
from bills
join booking on booking.booking_id = bills.booking_id
join customers on customers.customers_id = booking.customers_id
go

exec CustomerBill;

-- ADVANCED QUERY
Select * from bills
Select * from booking
Select * from customers
Select * from items
Select * from orders
Select * from rooms

--Statistics of room types are the most booked to date.
select 
count(rooms.[type]) as [Numbers of booking],
	  rooms.[type] as [Types of rooms] 
from bills
join rooms on rooms.rooms_id = bills.rooms_id
group by rooms.[type]
order by [Numbers of booking] desc

--Revenue statistics of the hotel by month up to date
select
month(bills.check_in_time) as [Month],
sum(booking.total_price) as [Total revenue]
from bills
join booking on booking.booking_id = bills.booking_id
group by month(bills.check_in_time)
order by [Total revenue] desc

--Statistics of the months with the lowest revenue to date.
select top(1)
month(bills.check_in_time) as [Month],
sum(booking.total_price) as [Total revenue]
from bills
join booking on booking.booking_id = bills.booking_id
group by month(bills.check_in_time)
order by [Total revenue] asc

--Statistics of the ordered items in a month to date.
select 
month(bills.check_in_time) as [Month], 
items.[name] as [Name of item], 
sum(orders.quantity) as [Numbers of order]
from orders
join items on items.items_id = orders.items_id
join bills on bills.bills_id = orders.bills_id
group by month(bills.check_in_time),  items.[name]
order by [Month] asc
use sales ;

desc sample_superstore;
### DIMCUSTOMERS TABLE
create table dimcustomers (
`Customer ID` varchar(255),
`Customer Name` varchar(255),
Segment varchar(255),
dimcustkey int primary key auto_increment
);
                                                  
select * from dimcustomers;
desc dimcustomers;
create or replace view customers AS 
(select distinct(`Customer ID`),`Customer Name`,Segment from sample_superstore);

insert into dimcustomers(`Customer ID`,`Customer Name`,Segment)
select * from customers;

### DIMREGION TABLE
create  table dimRegion (
city varchar(255),
country varchar(255),
State varchar(255),
`Postal Code` varchar(255),
dimregkey int primary key auto_increment
);
drop table dimregion;
select * from dimregion;


create view region_info as
select distinct City,country, State,`Postal Code` from sample_superstore;

select * from region_info;

insert into dimRegion(city,country,State,`Postal Code`)
select * from region_info;

select * from dimRegion;

### DIMPRIODUCTS TABLE

create table dimproducts(
`Product ID` varchar(255),
Category varchar(255),
`Sub-Category` varchar(255),
`Product Name` varchar(255),
dimprodkey int primary key auto_increment
);

select * from dimproducts;

create view products_info as
select distinct `Product ID`,Category,`Sub-Category`,`Product Name` from sample_superstore;
select count(*) from products_info;
insert into dimproducts(`Product ID`,Category,`Sub-Category`,`Product Name`)
select * from products_info ;

select * from dimproducts;

create table fact_sales (
`Row ID` varchar(255) primary key,
dimdate_key int,
dimcustkey int,
dimregkey int,
dimprodkey int,
foreign key (dimdate_key) references dimdate(dimdate_key),
foreign key(dimcustkey) references dimcustomers(dimcustkey),
foreign key(dimregkey) references dimregion(dimregkey),
foreign key(dimprodkey) references dimproducts(dimprodkey),
sales int,
quantity int,
discount decimal,
profit decimal
);




create view view_fact as
select
row_number() over() as row_id,
d.dimdate_key ,
c.dimcustkey ,
r.dimregkey,
p.dimprodkey,
s.sales,
s.quantity,
s.discount,
s.profit
from sample_superstore s
join dimdate d on s.`Order Date`= d.order_date
join dimcustomers c on s.`Customer ID`=c.`Customer ID`
join dimregion r on s.City= r.city
join dimproducts p on s.`Product ID`= p.`Product ID`;



insert into fact_sales 
select * from view_fact;

select * from fact_sales;
select * from sample_superstore;
call SalesGetInfo(2);
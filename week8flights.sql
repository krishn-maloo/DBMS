
create database flight;
use flight;
create table flights 
(flno int, 
ffrom varchar(20),
fto varchar(20), 
distance int, 
departs time, 
arrives time, 
price int, 
primary key (flno));
create table aircraft (aid int, 
aname varchar(10), 
cruisingrange int, 
primary key (aid));
create table certified (eid int,
 aid int, 
 foreign key (eid) references employees(eid), 
foreign key (aid) references aircraft(aid) );
create table employees (eid int,
 ename varchar(30), 
 salary int, 
 primary key (eid));

insert into employees values (101,'Avinash',50000);
insert into employees values (102,'Lokesh',60000);
insert into employees values (103,'Rakesh',70000);
insert into employees values (104,'Santhosh',82000);
insert into employees values (105,'Tilak',5000);

insert into aircraft values (1, 'Airbus',2000);
insert into aircraft values (2, 'Boeing',700);
insert into aircraft values (3, 'JetAirways',550);
insert into aircraft values (4, 'Indigo',5000);
insert into aircraft values (5, 'Boeing',4500);
insert into aircraft values (6, 'Airbus',2200);

insert into certified values (101,2);
insert into certified values (101,4);
insert into certified values (101,5);
insert into certified values (101,6);
insert into certified values (102,1);
insert into certified values (102,3);
insert into certified values (102,5);
insert into certified values (103,2);
insert into certified values (103,3);
insert into certified values (103,5);
insert into certified values (103,6);
insert into certified values (104,6);
insert into certified values (104,1);
insert into certified values (104,3);
insert into certified values (105,3);

insert into flights values (1,'Bengaluru','New Delhi',500,'6:00','9:00',5000);
insert into flights values (2,'Bengaluru','Chennai',300,'7:00','8:30',3000);
insert into flights values (3,'Trivandrum','New Delhi',800,'8:00','11:30',6000);
insert into flights values (4,'Bengaluru','Frankfurt',10000,'6:00','23:30',50000);
insert into flights values (5,'Kolkata','New Delhi',2400,'11:00','3:30',9000);
insert into flights values (6,'Bengaluru','Frankfurt',8000,'9:00','23:00',40000);
truncate table flights;
select * from flights;

-- query1
select aname
from aircraft a,certified c,employees e
where a.aid=c.aid and c.eid=e.eid and e.salary>80000;

-- query2
select c.eid,max(cruisingrange)
from aircraft a,certified c
where a.aid=c.aid 
group by c.eid
having count(c.aid)>=3;

-- query3
select eid,ename 
from employees 
where salary < (select min(price)
                from flights
                where ffrom='Bengaluru' and fto='Frankfurt');

-- query4
select a.aid,aname,avg(salary)
from aircraft a,certified c,employees e
where cruisingrange>1000 and a.aid=c.aid and c.eid=e.eid
group by c.aid;

-- query5
select distinct e.eid,e.ename
from aircraft a,certified c,employees e 
where aname='Boeing' and a.aid=c.aid and e.eid=c.eid;

-- query6
select aid
from aircraft 
where cruisingrange >= (select distance
                       from flights
                       where ffrom='Bengaluru' and fto='New Delhi');
			


show databases;
use krishn;
create table Person
( driver_id varchar(10) primary key,
name varchar(20),
address varchar(50)
);
create table Car
( reg_num varchar(10) primary key,
model varchar(15),
year int
);
create table Accident
( report_num int primary key,
accident_date varchar(20),
location varchar(20)
);
create table Owns
( driver_id varchar(10),
reg_num varchar(10),
primary key(driver_id,reg_num),
foreign key(driver_id) references Person (driver_id),
foreign key(reg_num) references Car(reg_num)
);
create table Participated
( driver_id varchar(10),
reg_num varchar(10),
report_num int,
damage_amount int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references Person(driver_id),
foreign key(reg_num) references Car(reg_num),
foreign key(report_num) references Accident(report_num)
);

insert into Person
values ("A01","Richard","Srinivas Nagar"),("A02","Pradeep","Rajaji Nagar"),("A03","Smith","Ashok Nagar"),("A04","Venu","NR Colony"),("A05","John","Hanumanth Nagar");
insert into Car
values ("KA052250","Indica",1990),("KA031241","Lancer",1957),("KA456723","Toyota",1998),("KA234518","Honda",2008),("KA000021","Audi",2013);
insert into Owns
values("A01","KA052250"),("A02","KA234518"),("A03","KA031241"),("A04","KA456723"),("A05","KA000021");
insert into Accident
values (11,"1 Jan 03","Mysore road"),(12,"2 Feb 04","South End Circle"),(13,"21 Jan 03","Bull temple road"),(14,"17 Feb 08","Mysore Road"),(15,"4 Mar 05","Kanakpur Road");
insert into Participated
values("A01","KA052250",11,10000),("A02","KA234518",12,50000),("A03","KA456723",13,25000),("A04","KA031241",14,3000),("A05","KA000021",15,5000);
select* from Person;
select* from Car;
select* from Accident;
select* from Owns;
select* from Participated;
select accident_date,location from Accident;
select driver_id from Participated where damage_amount>25000;
select driver_id from Participated where damage_amount>=25000;
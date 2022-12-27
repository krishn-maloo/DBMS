show databases;
create database emp_092;
use emp_092;
show tables;
create table dept
(
deptno int primary key,
dname varchar(20),
dloc varchar(20)
);
create table employee
(
empno int primary key,
ename varchar(20),
mgr_no int,
hiredate date,
sal double,
deptno int,
foreign key(deptno) references dept(deptno)
);
create table project
(
pno int primary key,
ploc varchar(20),
pname varchar(20)
);
create table assignedto
(
empno int,
pno int,
job_role varchar(20),
primary key(empno,pno),
foreign key(empno) references employee(empno),
foreign key(pno) references project(pno)
);
create table incentives
(
empno int,
incentivedate date,
incentiveamount double,
primary key(empno,incentivedate),
foreign key(empno) references employee(empno)
);
insert into dept
values(1,'accounts','delhi');
insert into dept
values(2,'technical','bengaluru');
insert into dept
values(3,'hr','kolkata');
insert into dept
values(4,'maintainence','jaipur');
insert into dept
values(5,'sales','mumbai');

insert into employee
values(21,'abc',22,'22-10-21',10000,1);
insert into employee
values(22,'def',22,'22-10-20',15000,2);
insert into employee
values(23,'ghi',22,'22-10-19',20000,3);
insert into employee
values(24,'jkl',null,'22-10-18',25000,4);
insert into employee
values(25,'mno',24,'22-10-17',30000,5);
insert into employee
values(26,'pqr',24,'22-10-16',35000,1);

insert into project
values(11,'jaipur','hex');
insert into project
values(12,'delhi','pqr');
insert into project
values(13,'bengaluru','stu');
insert into project
values(14,'kolkata','vwx');
insert into project
values(15,'jaipur','yz');

insert into assignedto
values(21,15,'sd1');
insert into assignedto
values(22,14,'sd2');
insert into assignedto
values(23,13,'sd3');
insert into assignedto
values(24,12,'sd4');
insert into assignedto
values(25,11,'sd5');
insert into assignedto
values(26,12,'sd6');
insert into assignedto
values(21,13,'sd7');

insert into incentives
values(21,'26-11-21',2000);
insert into incentives
values(22,'27-11-21',2500);
insert into incentives
values(23,'28-11-21',3000);
insert into incentives
values(24,'29-11-21',3500);
insert into incentives
values(25,'30-11-21',4000);

show tables;

select e.empno
from employee e,assignedto a,project p
where e.empno=a.empno and p.pno=a.pno and ploc in ('jaipur','delhi','bengaluru');

select e.empno
from employee e
where not exists (select i.empno
                  from incentives i
                  where e.empno=i.empno);
                  
select ename,e.empno,d.dname,job_role,dloc,ploc
from employee e,dept d,assignedto a,project p
where p.pno=a.pno and a.empno=e.empno and e.deptno=d.deptno and ploc=dloc;


                  


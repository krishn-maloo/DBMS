show databases;
use bank_database;
desc Depositor;
desc bankaccount;
show tables;
desc loan;
select * from depositor;
select * from borrower;
create table Borrower
(
Customername varchar(20),
Loannumber int,
primary key(Customername,Loannumber),
foreign key(Customername) references Bankcustomer(Customername),
foreign key(Loannumber) references Loan(Loannumber)
);
insert into Borrower
values("Avinash",1);
insert into Borrower
values("Dinesh",2);
insert into Borrower
values("Mohan",3);
insert into Borrower
values("Nikil",4);
insert into Borrower
values("Ravi",5);

Insert into Branch 
values("SBI_Mantrimarg","Delhi",200000);
Insert into  bankaccount
values(12,"SBI_Mantrimarg",2000); 
Insert into  Depositor
values("Nikil",12);

select Customername 
from Borrower 
where Customername not in (select Customername from Depositor); 

-- select distinct Customername
-- from Depositor 
-- where Accno in (select Accno
--                 from Bankaccount
--                 where Branchname in (select Branchname
--                                       from branch
--                                       where Branchcity="Delhi")) and =(select count(Branchname)
--                                                                       from branch
--                                                                       where Branchcity="Delhi")

select Branchname from branch
where Assets>(select max(Assets)
              from branch
              where Branchcity="Bangalore") and Branchcity<>"Bangalore";
              
select customername
from borrower 
where loannumber = any(select loannumber 
                       from loan 
                        where branchname= any(select branchname
                                               from branch 
                                                where branchcity="Bangalore")) and customername in (select customername from depositor 
                                                                                                     where customername=any(select customername from 
																						                                    bankcustomer where city="Bangalore"));
update Bankaccount
set Balance=1.05*Balance;
select*from Bankaccount;

delete from Bankaccount
where Branchname in(select branchname 
                    from branch
                    where Branchcity="Bombay");


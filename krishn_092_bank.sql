show databases;
create database Bank_database;
use Bank_database;
create table Branch
(
Branchname varchar(30) primary key ,
Branchcity varchar(20),
Assets real
);
create table Bankaccount
(
Accno int primary key ,
Branchname varchar(30),
Balance real,
foreign key(Branchname) references Branch(Branchname)
);
create table Bankcustomer
(
Customername varchar(20) primary key,
Customerstreet varchar(15),
City varchar(20)
);
create table Depositor
(
Customername varchar(20),
Accno int,
Primary key(Customername,Accno),
foreign key (Customername) references Bankcustomer(Customername),
foreign key(Accno) references Bankaccount(Accno)
);
create table Loan
(
Loannumber int primary key,
Branchname varchar(30),
Amount real,
foreign key(Branchname) references Branch(Branchname)
);
Insert into Branch 
values ("SBI_Chamrajpet","Bangalore",50000);
Insert into Branch 
values ("SBI_ResidencyRoad","Bangalore",10000);
Insert into Branch 
values ("SBI_Shivaji Road","Bombay",20000);
Insert into Branch 
values ("SBI_ParliamentRoad","Delhi",10000);
Insert into Branch 
values ("SBI_Jantarmantar","Delhi",50000);
Insert into Bankaccount 
values (1,"SBI_Chamrajpet",2000);
Insert into Bankaccount 
values (2,"SBI_ResidencyRoad",5000);
Insert into Bankaccount 
values (3,"SBI_Shivaji Road",6000);
Insert into Bankaccount 
values (4,"SBI_ParliamentRoad",9000);
Insert into Bankaccount 
values (5,"SBI_Jantarmantar",8000);
Insert into Bankaccount 
values (6,"SBI_Shivaji Road",4000);
Insert into Bankaccount 
values (8,"SBI_ResidencyRoad",4000);
Insert into Bankaccount 
values (9,"SBI_ParliamentRoad",3000);
Insert into Bankaccount 
values (10,"SBI_ResidencyRoad",5000);
Insert into Bankaccount 
values (11,"SBI_Jantarmantar",2000);
Insert into Bankcustomer 
values ("Avinash","Bull_Temple","Bangalore");
Insert into Bankcustomer 
values ("Dinesh","Banergatta","Bangalore");
Insert into Bankcustomer 
values ("Mohan","National_Clg","Bangalore");
Insert into Bankcustomer 
values ("Nikil","Akbar_road","Delhi");
Insert into Bankcustomer 
values ("Ravi","Prithvi_road","Delhi");
Insert into Depositor 
values("Avinash",1);
Insert into Depositor 
values("Dinesh",2);
Insert into Depositor 
values("Nikil",4);
Insert into Depositor 
values("Ravi",5);
Insert into Depositor 
values("Avinash",8);
Insert into Depositor 
values("Nikil",9);
Insert into Depositor 
values("Dinesh",10);
Insert into Depositor 
values("Nikil",11);
Insert into Loan
values(1,"SBI_Chamrajpet",1000);
Insert into Loan
values(2,"SBI_ResidencyRoad",2000);
Insert into Loan
values(3,"SBI_Shivaji Road",3000);
Insert into Loan
values(4,"SBI_ParliamentRoad",4000);
Insert into Loan
values(5,"SBI_Jantarmantar",5000);

Select Branchname, (Assets/100000) as Assets_in_lakhs
from Branch;

Create view LoanView2(Branch_Name,Total_Loan)
as Select Branchname,Sum(Amount)
from Loan
group by Branchname;
Select * from LoanView2;

Select D.Customername
from Bankaccount B, Depositor D
where Branchname="SBI_ResidencyRoad"  and 







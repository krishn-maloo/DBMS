show databases;
use krishn;
show tables;
select*from accident;
select*from owns;
select*from participated;
select* from car;
Update participated
set damage_amount=25000
where report_num=12;
Select * 
from car
order by year asc;
select count(car.reg_num) as total_accident
from participated,car
where car.reg_num=participated.reg_num AND car.model="lancer";
select count(report_num) as Accidents_2008
from accident
where accident_date like '%08';
select count(driver_id) as People_owned
from participated,accident
where accident.report_num=participated.report_num AND accident_date like '%08';
insert into accident
values (16,"21 Jun 13","Jayanagar");
insert into car
values("KA234567","Lancer",2007);
select avg(damage_amount)
from participated;
delete from participated 
where damage_amount<( select avg(damage_amount));


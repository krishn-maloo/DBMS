show databases;
use emp_092;
show tables;
select* from employee;

select a.ename
from employee a, employee b
where a.empno=b.mgr_no
group by a.ename
having count(*)=( select max(emps)
                 from (select count(*) emps
                       from employee
                       group by mgr_no ) x);
                       
select m.ename
from employee m
where m.sal >=  (select avg(sal)
                from employee s
	            where m.empno=s.mgr_no
				group by(mgr_no));
                
update employee
set deptno=1
where deptno=3;


		



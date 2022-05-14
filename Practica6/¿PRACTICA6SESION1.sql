--actvidad4
--PRAC6


SELECT * FROM REGIONS;


insert into regions values (101,'Great Britain');


insert into regions values
(&Region_number,'&Region_name');

insert into regions values ((select
max(region_id)+1 from regions), 'Oceania');


select * from regions;


commit;




--actividad5
--prac6



update regions set region_name='Scandinavia' where
region_id=101;


update regions set region_name='Iberia' where region_id >
100;



update regions
set region_id=(region_id+(select max(region_id) from
regions))
where region_id in (select region_id from regions where
region_id > 100);



select * from regions;



commit;




--PRACTCA6
--ACT6

delete from regions where region_id=204;

delete from regions;

delete from regions where
region_id in (select region_id from regions where region_name='Iberia');

select * from regions;


commit;


--PRACTICA6
--ACT7
create table employees_new as select * from employees
where 1=2;


desc employees_new;


insert into employees_new select * from employees where
employee_id=100;


update employees_new set salary=500 where
employee_id=100;


merge into employees_new e using employees n
on (e.employee_id = n.employee_id)
when matched then
update set e.salary=n.salary
when not matched then
insert(employee_id,first_name,last_name,email,hire_date,job_id,salary) values
(n.employee_id,n.first_name,n.last_name,n.email,n.hire_date,n.job_id,n.salary);



select * from employees_new;



--ACIVIDAD8 SON PREGUNTAS





--ACTIVIDAD9
--1
SELECT *FROM REGIONS;


--2
INSERT INTO REGIONS VALUES(100,'UK');


--3
SELECT *FROM REGIONS;

--4
COMMIT;

--5
SELECT *FROM REGIONS;

--6
ROLLBACK;

--7
SELECT *FROM REGIONS;

--8
DELETE FROM REGIONS WHERE REGION_ID=100;

--9
SELECT *FROM REGIONS;


--10
COMMIT;

--11
SELECT *FROM REGIONS;





















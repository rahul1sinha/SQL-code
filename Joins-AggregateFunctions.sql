-- Q1
select max(salary) "Max Salary"
from employees
where MONTHS_BETWEEN(SYSDATE,hire_date)<240
;

/*  Test work
select first_name, salary  --max(salary)
from employees
where MONTHS_BETWEEN(SYSDATE,hire_date)<240
;
*/

-- Q2
select e.first_name, e.last_name, e.salary, e.department_id, j.country_id
from employees e, (select department_id, country_id
                   from departments d, locations c
                   where d.location_id = c.location_id
                   ) j
where e.department_id = j.department_id
and country_id != 'US'
;

-- or
select e.first_name, e.last_name, e.salary, e.department_id, c.country_id
from employees e, departments d, locations c
where e.department_id = d.department_id
and d.location_id = c.location_id
and c.country_id != 'US'
;

/*Test work
select * from employees
where department_id is null
;
select distinct department_id from departments;
select * from departments;
select * from countries;
select * from locations;
desc locations;

select e.first_name, e.salary, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id;
*/


-- Q3
select job_id, min(salary), max(salary)
from employees
group by job_id
having avg(salary)>5000
;

-- Q4
select (select count(*) from employees) Total
,(select count(*) from employees where hire_date like '%95') "1995"
,(select count(*) from employees where hire_date like '%96') "1996"
,(select count(*) from employees where hire_date like '%97') "1997"
,(select count(*) from employees where hire_date like '%98') "1998"
from dual   -- dummy
;

-- Q5
-- Lengthy group by
select worker.manager_id "Manager ID"
, (managers.first_name || ' ' || managers.last_name) "Manager's Name"
, count(*) "Total Managed Employees"
from employees managers right join employees worker
on managers.employee_id = worker.manager_id
group by worker.manager_id, (managers.first_name || ' ' || managers.last_name)
order by 3, 1 desc nulls first
;

-- Q5 extra work
-- without group by in the main query
-- Running a subquery to get number of Employees managed
select distinct worker.manager_id "Manager ID"
, managers.first_name || ' ' || managers.last_name "Manager's Name"
, nvl((select count(*)
       from employees
       group by manager_id
       having manager_id = worker.manager_id
       ), 1) "Total Managed Employees"
from employees managers right join employees worker
on managers.employee_id = worker.manager_id
order by 3 nulls first
;


-- group by in main query /Issue: lengthy group by
select worker.manager_id "Manager ID"
, (managers.first_name || ' ' || managers.last_name) "Manager's Name"
, count(*) "Total Managed Employees"
from employees managers right join employees worker
on managers.employee_id = worker.manager_id
group by worker.manager_id, (managers.first_name || ' ' || managers.last_name)
order by 3,1 nulls first
;

-- Issue: replacing null with blank space may not be acceptable
select worker.manager_id "Manager ID"
, (nvl((select first_name || ' ' || last_name
        from employees
        where employee_id = worker.manager_id
        ),' ')) "Manager's Name"
, count(*) "Total Managed Employees"
from employees managers right join employees worker
on managers.employee_id = worker.manager_id
group by worker.manager_id
order by 3
;

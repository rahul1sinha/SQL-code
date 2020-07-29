-- Q1
select c.country_id, d.location_id, e.department_id, round(avg(e.salary),2) AVG_SALARY
, ( select round(avg(x.salary),2) from employees x, departments y, locations z
    where x.department_id = y.department_id
    and y.location_id = z.location_id
    and c.country_id = z.country_id
    group by z.country_id
  ) "COUNTRY_AVG_SALARY"
, round(avg(e.salary)-( select round(avg(x.salary),2) from employees x, departments y, locations z
                        where x.department_id = y.department_id
                        and y.location_id = z.location_id
                        and c.country_id = z.country_id
                        group by z.country_id
                      ), 2) "DEPTMT_VS_COUNTRY_DIFFERENCE"
from employees e, departments d, locations c
where e.department_id = d.department_id
and d.location_id = c.location_id
group by e.department_id, c.country_id, d.location_id
having e.department_id is not null
order by c.country_id, d.location_id
;

-- or
SELECT l.COUNTRY_ID
    , d.location_id
    , d.department_id
    , ROUND(AVG(E.SALARY),2)
    , avsal.COUNTRY_AVG_SALARY
    , ROUND(AVG(E.SALARY)-avsal.COUNTRY_AVG_SALARY,2) "DEPTMT_VS_COUNTRY_DIFFERENCE"
FROM EMPLOYEES E
    , DEPARTMENTS D
    , locations l
    , (SELECT z.COUNTRY_ID, ROUND(AVG(x.SALARY),2) as COUNTRY_AVG_SALARY
        FROM EMPLOYEES x JOIN DEPARTMENTS y
        ON x.DEPARTMENT_ID = y.DEPARTMENT_ID
        join locations z
        on y.location_id = z.location_id
        GROUP BY z.COUNTRY_ID
      ) avsal
where e.DEPARTMENT_ID = d.DEPARTMENT_ID
    and d.location_id = l.location_id
    and l.COUNTRY_ID = avsal.COUNTRY_ID
GROUP BY l.COUNTRY_ID,d.location_id,d.department_id,avsal.COUNTRY_AVG_SALARY
ORDER BY l.country_id, d.location_id
;

-- Q2
select job_id, job_title
from jobs
where job_id IN (
    select job_id from Jobs
    minus
    select job_id from job_history
    );

-- Q3
select j.grade_level
, count(*) "COUNT_POSITIONS"
, sum(e.salary) "SUM_SALARY"
, round(avg(e.salary), 2) "AVG_SALARY_PERJOBGRADE"
, lpad(concat(round(sum(e.salary)/(select sum(salary) from employees)*100, 1), '%'), 9, ' ') "PERCENTAGE_OF_SUMSALARY_TOTAL"
from employees e join job_grades j
on e.salary between j.lowest_sal and j.highest_sal
group by j.grade_level
;

-- Q4
select avg(end_date-start_date) AVG_DAYS_TOPROMOTION, job_id "Job ID"
from job_history
group by job_id
order by 1
;

-- Q5
select location_id
, count(*) "Count of diff. depts"
, LISTAGG(department_id, ', ') WITHIN GROUP (ORDER BY department_id) "List of DeptsIDs"
from departments
group by location_id
;

-- Q6
/*
6. Do you think it is advisable to automate processes “as is” using workflow technology?
Why or why not? In what cases might be useful, and in what cases might this be a waste of time. Give an example of each.

It depends on the process; we generally want to optimize the process when we are automating a process.
What are the steps when automating processes?
We identify repetitive steps, state the goals (e.g., minimizing employee/resource time spent on monitoring activities),
model the current process(as-is), reengineer the process(to-be), automate the process.
Thus, one of the goals of automation is to find issues in the as-is process and reengineer and improve it to result in a to-be process.
Hence, it is not prudent to automate processes as-is.
Even if we automate a process "as-is," we generally have process KPIs, which can indicate the need for optimization.
Automating "as-is" can be extremely helpful in repetitive steps that do not have many exceptions or variety.
For example, automating an existing process for handling customer care calls and creating service tickets is amenable to automation
and can offer benefits such as cost reduction, call quality consistency, and cycle time reduction,
i.e., benefits across three levels of operations - Cost, Quality, and Time.
However, if the process is extremely complicated and has wide variety, then automating the process "as-is" can be a waste of time;
as data collection, process discovery, and as-is process modeling itself is extremely complicated and can waste a lot of time.
Furthermore, the automation of such a process would also most likely be complicated and time-consuming.
For example, automating the purchase process for a mass-market clothing store may be easy with standard sizes and procedures,
but the purchase process for a sartorial shop may have a lot of variety in the process, and hence automating the process may be a waste of time.

*/

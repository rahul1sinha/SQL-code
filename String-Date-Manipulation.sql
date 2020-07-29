--
-- Q1
--
SELECT GRADE_LEVEL "Job's Grade"
FROM JOB_GRADES
WHERE &SALARY BETWEEN lowest_sal AND highest_sal
;

--
-- Q2
--
SELECT 'Employee ' || EMPLOYEE_ID || 
        ' worked as ' || JOB_ID || 
        ' for ' || (end_date-start_date) || 
        ' days' as "Employee's History" --DAYS IN JOB POSN
FROM JOB_HISTORY
;

--
-- Q3
--
SELECT FIRST_NAME, LAST_NAME, SALARY "CURRENT_SALARY",
(CASE when months_between(to_date('01-JAN-2000','DD-MM-YYYY'), hire_date) > 120 then salary*2.00
                when months_between(to_date('01-JAN-2000','DD-MM-YYYY'), hire_date) > 60 
                AND months_between(to_date('01-JAN-2000','DD-MM-YYYY'), hire_date) <= 120 then salary*1.50
                when months_between(to_date('01-JAN-2000','DD-MM-YYYY'), hire_date) <= 0 then salary
                else salary*1.20
                end) "UPDATED_SALARY"
FROM employees
ORDER BY department_id NULLS FIRST
;

--
-- Q4
--
SELECT FIRST_NAME || ' ' || 
        LAST_NAME AS "Name", --PHONE_NUMBER, 
        RPAD(substr(PHONE_NUMBER, 0, length(PHONE_NUMBER)-4), length(PHONE_NUMBER), 'X') "Telephone Number"
FROM employees;

--
-- Q5
--
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, FIRST_NAME || 
        ' (Employee ID - ' || EMPLOYEE_ID ||
        ') was hired on ' || 
        to_char(HIRE_DATE, 'fmDD", "MONTH "of "YYYY') as "EMPLOYEE INFO"
FROM employees
WHERE EMPLOYEE_ID IS NOT NULL;
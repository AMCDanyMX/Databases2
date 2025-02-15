SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT JOB_ID, COUNT(*) FROM EMPLOYEES
WHERE JOB_ID = '&JOB_ID'
GROUP BY JOB_ID;



--7

SELECT COUNT(*) AS "NUMBER OF MANAGERS" FROM EMPLOYEES
GROUP BY MANAGER_ID;

--8
SELECT (MAX(SALARY) - MIN(SALARY)) AS "DIFFERENCE" FROM EMPLOYEES;

--9
SELECT * FROM EMPLOYEES;

SELECT MANAGER_ID, MIN(SALARY)FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID
ORDER BY MANAGER_ID ASC;



--10

SELECT * FROM EMPLOYEES;

SELECT COUNT(*) AS "TOTAL", 
SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'),1995,1,0)) "1995",
SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'),1996,1,0)) "1996",
SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'),1997,1,0)) "1997",  --NO HAY REGISTROS CON ESOS A�O
SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'),1998,1,0)) "1998",
SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'),2005,1,0)) "2005"
FROM EMPLOYEES;



--11
SELECT JOB_ID AS "JOB", 
SUM(DECODE(DEPARTMENT_ID,20,SALARY)) "Dept 20",
SUM(DECODE(DEPARTMENT_ID,50,SALARY)) "Dept 50",
SUM(DECODE(DEPARTMENT_ID,80,SALARY)) "Dept 80",
SUM(DECODE(DEPARTMENT_ID,90,SALARY)) "Dept 90",
SUM(SALARY) "TOTAL"
FROM EMPLOYEES GROUP BY JOB_ID;


















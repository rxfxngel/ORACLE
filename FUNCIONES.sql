SELECT employee_id, TO_CHAR(hire_date, 'DD/MM/YYYY') Month_Hired
FROM   employees
WHERE  last_name = 'Higgins';


--convierte el null a un valor especificado
SELECT NVL(TO_CHAR('null'),'resultado') from dual;
SELECT NVL(TO_CHAR(null),'resultado') from dual;



SELECT last_name, salary, commission_pct, NVL(commission_pct, 0),
   (salary*12) + (salary*12*NVL(commission_pct, 0)) AN_SAL
FROM employees;

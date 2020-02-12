--CLAUSULA WHERE (CUANDO FILTRA TEXTO TOMA EN CUENTA LAS MAYUSCULAS Y MINUSCULAS
  SELECT employee_id, last_name, job_id, department_id
  FROM   employees
  WHERE  department_id = 90 ;
--WHERE CON FECHA SE DEBE TOMAR EN CUENTA EL IDIOMA DE LA BASE DE DATOS ( FORMATO POR DEFECTO) DD-MON-RR.
  SELECT last_name
  FROM   employees
  WHERE  hire_date = '17-OCT-03' ;
--OPERADORES DE COMPARACION
  SELECT last_name, salary
  FROM   employees
  WHERE  salary <= 3000 ;
-- CONDICIONANDO RANGOS USANDO BETWEEN
  SELECT last_name, salary
  FROM   employees
  WHERE  salary BETWEEN 2500 AND 3500 ;

  SELECT last_name, salary
  FROM   employees
  WHERE  last_name BETWEEN 'B' AND 'D' ;
-- USANDO EL OPERADOR IN
  SELECT employee_id, last_name, salary, manager_id
  FROM   employees
  WHERE  manager_id IN (100, 101, 201) ;

  SELECT employee_id, manager_id, department_id
  FROM   employees
  WHERE  last_name IN ('Hartstein', 'Vargas');
-- OPERADOR LIKE (SI SE QUIERE USAR EL SIMBOLO _ O % anteponer el simbolo \ por ejemplo "like '\_A%';
  SELECT	first_name
  FROM 	employees
  WHERE	first_name LIKE '_a%a_' OR first_name LIKE '_a_' ;
  
  SELECT last_name
  FROM employees 
  WHERE last_name
  LIKE '%A\_B%' ESCAPE '\'
  ORDER BY last_name;
--CONDICION NULL
  SELECT last_name, manager_id
  FROM   employees
  WHERE  manager_id IS NULL ;
--CONDICION AND
  SELECT employee_id, last_name, job_id, salary
  FROM   employees
  WHERE  salary >= 10000
  AND    job_id LIKE '%MAN%' ;
 -- CONDICION CON OR
  SELECT employee_id, last_name, job_id, salary
  FROM   employees
  WHERE  salary >= 10000
  OR     job_id LIKE '%MAN%' ;
  
 -- OPERADOR NOT IN
  SELECT last_name, job_id
  FROM   employees
  WHERE  job_id 
         NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP') ;
         
  
--La tabla enumera el orden de prioridad por defecto.

--1 Operadores aritméticos
--2 Operador de Concatenación
--3 Condiciones de comparación
--4 IS [NOT] NULL, LIKE, [NOT] IN
--5 [NOT] BETWEEN
--6 Condición lógica NOT
--7 Condición lógica AND
--8 Condición lógica OR

--Por ejemplo en la siguiente consulta se ejecuta primero el AND y luego el OR
SELECT last_name, department_id, salary
FROM   employees
WHERE  department_id = 60
OR     department_id = 80
AND    salary > 10000;






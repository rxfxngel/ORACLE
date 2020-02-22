--NVL
--convierte el null a un valor especificado
SELECT NVL(TO_CHAR('null'),'resultado') from dual;
SELECT NVL(TO_CHAR(null),'resultado') from dual;

--NL2 ( string1, value_if_not_null, value_if_null )
SELECT last_name,  salary, commission_pct,
       NVL2(commission_pct, 
            'SAL+COMM', 'SAL') income
FROM   employees WHERE department_id IN (50, 80);

--NULLIF       NULLIF(LENGTH(valor1), LENGTH(valor2)) 
--si valor 1=valor2 entonces retorna null caso contrario retorna el valor 1
        
SELECT first_name, LENGTH(first_name) "expr1", 
       last_name,  LENGTH(last_name)  "expr2",
       NULLIF(LENGTH(first_name), LENGTH(last_name)) result
FROM   employees;


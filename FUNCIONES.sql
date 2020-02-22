--NVL
--convierte el null a un valor especificado
SELECT NVL(TO_CHAR('null'),'resultado') from dual;
SELECT NVL(TO_CHAR(null),'resultado') from dual;

--NL2 ( string1, value_if_not_null, value_if_null )
SELECT last_name,  salary, commission_pct,
       NVL2(commission_pct, 
            'SAL+COMM', 'SAL') income
FROM   employees WHERE department_id IN (50, 80);

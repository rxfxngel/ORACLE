--JOINS ORACLE

--NATURAL JOIN

-- La cláusula NATURAL JOIN se basa en todas las columnas que tienen el mismo nombre en dos tablas.
-- Selecciona filas de las dos tablas que tienen valores iguales en todas las columnas coincidentes.
-- Si las columnas que tienen los mismos nombres tienen diferentes tipos de datos, se devuelve un error.

--SELECT * FROM table1 NATURAL JOIN table2;

/*
Puede unir tablas automáticamente en función de las columnas 
en las dos tablas que tienen nombres y tipos de datos coincidentes. 
Para ello, utilice las palabras clave NATURAL JOIN.
Nota: La unión puede ocurrir solo en aquellas columnas que tienen los mismos nombres y
tipos de datos en ambas tablas. 
Si las columnas tienen el mismo nombre pero diferentes tipos de datos, 
la sintaxis de NATURAL JOIN provoca un error.
*/


SQL> DESCRIBE EMPLOYEES;
Nombre         ¿Nulo?   Tipo         
-------------- -------- ------------ 
EMPLOYEE_ID    NOT NULL NUMBER(6)    
FIRST_NAME              VARCHAR2(20) 
LAST_NAME      NOT NULL VARCHAR2(25) 
EMAIL          NOT NULL VARCHAR2(25) 
PHONE_NUMBER            VARCHAR2(20) 
HIRE_DATE      NOT NULL DATE         
JOB_ID         NOT NULL VARCHAR2(10) 
SALARY                  NUMBER(8,2)  
COMMISSION_PCT          NUMBER(2,2)  
MANAGER_ID              NUMBER(6)    ---------------COLUMNA COINCIDENTE>>MISMO TIPO DE DATO
DEPARTMENT_ID           NUMBER(4)    ---------------COLUMNA COINCIDENTE>>MISMO TIPO DE DATO
SQL> 
SQL> DESCRIBE DEPARTMENTS;
Nombre          ¿Nulo?   Tipo         
--------------- -------- ------------ 
DEPARTMENT_ID   NOT NULL NUMBER(4)    ---------------COLUMNA COINCIDENTE>>MISMO TIPO DE DATO
DEPARTMENT_NAME NOT NULL VARCHAR2(30) 
MANAGER_ID               NUMBER(6)    ---------------COLUMNA COINCIDENTE>>MISMO TIPO DE DATO
LOCATION_ID              NUMBER(4)    

SELECT * FROM EMPLOYEES 
NATURAL JOIN DEPARTMENTS;--ESTE SELECT  UNE POR LAS COLUMNAS COINCIDENTES EN ESTE CASO UNE POR (DEPARTMENT_ID Y MANAGER_ID)



--QUE PASA CUANDO NO HAY COLUMNAS COINCIDENTES???????

SQL> DESCRIBE COUNTRIES;
Nombre       ¿Nulo?   Tipo         
------------ -------- ------------ 
COUNTRY_ID   NOT NULL CHAR(2)      
COUNTRY_NAME          VARCHAR2(40) 
REGION_ID             NUMBER       
SQL> 
SQL> DESCRIBE DEPARTMENTS;
Nombre          ¿Nulo?   Tipo         
--------------- -------- ------------ 
DEPARTMENT_ID   NOT NULL NUMBER(4)    
DEPARTMENT_NAME NOT NULL VARCHAR2(30) 
MANAGER_ID               NUMBER(6)    
LOCATION_ID              NUMBER(4)  


SELECT * FROM COUNTRIES
NATURAL JOIN DEPARTMENTS;

--EN ESTE CASO MULTIPLICA LOS RESULTADOS DE CADA TABLA DANDO COMO RESULTADO 25*27 =675 filas
-- OJO: "si no encuentra coincidencias combina todo."

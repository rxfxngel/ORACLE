/*Crear una función que tenga como parámetro un número de departamento y que devuelve la suma de los salarios de dicho departamento. La imprimimos por pantalla.

• Si el departamento no existe debemos generar una excepción con dicho mensaje*/


create or replace FUNCTION salarios_dept(dep_id NUMBER) RETURN NUMBER
IS
TOTAL_SAL NUMBER;
dept DEPARTMENTS.department_id%TYPE;
BEGIN
    --COMPROBAR QUE EL DEPARTAMENTO EXISTE. SI NO EXISTE SE DISPARA LA EXCEPCIÓN
    SELECT DEPARTMENT_ID INTO DEPT FROM DEPARTMENTS WHERE DEPARTMENT_ID=DEP_ID;
    --SI EL DEPARTAMENTO EXISTE CALCULAR EL TOTAL
    SELECT sum(salary) INTO TOTAL_SAL from employees where department_id=dep_id group by department_id;
    RETURN TOTAL_SAL;
EXCEPTION
WHEN NO_DATA_FOUND THEN
    --SI EL DEPARTAMENTO NO EXISTE DEVUELVE ERROR
    RAISE_APPLICATION_ERROR(-20001,'ERROR, DEPARTAMENTO '||DEP_ID|| ' NO EXISTE');
END;


--PROBAR LA FUNCIÓN
SET SERVEROUTPUT ON
DECLARE
SAL NUMBER;
DEPT NUMBER:=100;
BEGIN
SAL:=salarios_dept(DEPT);
DBMS_OUTPUT.PUT_LINE('El salario total del departamento ' || DEPT || ' es: ' || SAL);
END;
/


/*Modificar el programa anterior para incluir un parámetro de tipo OUT por el que vaya el número de empleados afectados por la query. Debe ser visualizada en el programa que llama a la función. De esta forma vemos que se puede usar este tipo de parámetros también en una función*/


CREATE OR REPLACE FUNCTION salarios_dept1(dep_id NUMBER, n_empleados OUT NUMBER) RETURN NUMBER
IS
sal NUMBER;
BEGIN
	--COMPROBAR QUE EL DEPARTAMENTO EXISTE. SI NO EXISTE SE DISPARA LA EXCEPCIÓN
    SELECT DEPARTMENT_ID INTO DEPT FROM DEPARTMENTS WHERE DEPARTMENT_ID=DEP_ID;
	--SI EL DEPARTAMENTO EXISTE CALCULAR TOTALES
	SELECT sum(salary),count(salary) INTO SAL,n_empleados from employees where department_id=dep_id group by department_id;
	RETURN sal;
END;
/

--PROBAR LA FUNCIÓN
set serveroutput on
declare
TOTAL_SAL NUMBER;
NUM_EMPLE NUMBER;
DEPT NUMBER:=110;
BEGIN
TOTAL_SAL:=salarios_dept1(DEPT,NUM_EMPLE);
DBMS_OUTPUT.PUT_LINE('El salario total del departamento ' || DEPT || ' es: ' || TOTAL_SAL);
DBMS_OUTPUT.PUT_LINE('El número total de empleados recabados es : ' || NUM_EMPLE);
END;

/*Crear una función llamada CREAR_REGION, donde se pase un nombre de región que debe ser insertada en la tabla REGIONS y que devuelva un número.
De forma automática debe calcular el código de región más alto, añadir 1 e insertar un registro con el nuevo número y la región que se ha pasado.
Si la región no existe debe arrojar un error de control.
El valor devuelto es el número que ha asignado a la región.*/


create or replace FUNCTION CREAR_REGION (nombre varchar2) 
RETURN NUMBER IS
regiones NUMBER;
NOM_REGION VARCHAR2(100);
BEGIN
	--AVERIGUAR SI EXISTE LA REGIÓN. SI YA EXISTE DAMOS ERROR. SI NO EXISTE PASAMOS A EXCEPTION Y SEGUIMOS CON EL PROGRAMA
	SELECT REGION_NAME INTO NOM_REGION FROM REGIONS WHERE REGION_NAME=UPPER(NOMBRE);
	raise_application_error(-20321,'Esta región ya existe!');
EXCEPTION
	-- SI LA REGION NO EXISTE LA INSERTAMOS. ES UN EJEMPLO DE COMO PODEMOS USAR LA EXCEPCION PARA HACER ALGO CORRECTO
	WHEN NO_DATA_FOUND THEN
	SELECT MAX(REGION_ID)+1 INTO REGIONES from REGIONS;
	INSERT INTO REGIONS (region_id,region_name) VALUES (regiones,upper(nombre));
	RETURN REGIONES;
END;
/

--PROBAR LA FUNCIÓN

DECLARE
N_REGION NUMBER;
BEGIN
N_REGION:=crear_region('NORMANDIA');
DBMS_OUTPUT.PUT_LINE('EL NUMERO ASIGNADO ES:'||N_REGION);
END;
/


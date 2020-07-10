/*Crear un procedimiento llamado visualizar que visualice el nombre y salario de todos los empleados.*/

CREATE OR REPLACE PROCEDURE visualizar IS
CURSOR C1 IS SELECT first_name,salary FROM EMPLOYEES;
v_nombre employees.first_name%TYPE;
v_salario employees.salary%TYPE;
BEGIN
FOR i IN C1
LOOP
DBMS_OUTPUT.PUT_LINE(i.first_name || ' ' || i.salary);
END LOOP;
END;
/
EXECUTE visualizar;


/*Modificar el programa anterior para incluir un parámetro que pase el número de departamento para que visualice solo los empleados de ese departamento

Debe devolver el número de empleados en una variable de tipo OUT*/


create or replace PROCEDURE visualizar(departamento NUMBER, numero OUT NUMBER) IS
CURSOR C1 IS SELECT first_name,salary FROM EMPLOYEES WHERE department_id=departamento;
v_nombre employees.first_name%TYPE;
v_salario employees.salary%TYPE;
BEGIN
NUMERO:=0;
FOR i IN C1
LOOP
DBMS_OUTPUT.PUT_LINE(i.first_name || ' ' || i.salary);
NUMERO:=NUMERO+1;
END LOOP;

END;



DECLARE
x NUMBER;
BEGIN
visualizar(60,x);
DBMS_OUTPUT.PUT_LINE('El número de empleados es:'||x);
END;
/


/*Crear un bloque por el cual se de formato a un nº de cuenta suministrado por completo, por ej , 11111111111111111111

Formateado a: 1111-1111-11-1111111111

Debemos usar un parámetro de tipo IN-OUT*/


CREATE OR REPLACE PROCEDURE formateo_cuenta (numero IN OUT VARCHAR2)
IS
guardar1 VARCHAR2(20);
guardar2 VARCHAR2(20);
guardar3 VARCHAR2(20);
guardar4 VARCHAR2(20);
BEGIN
guardar1:=substr(numero,1,4);
guardar2:=substr(numero,5,4);
guardar3:=substr(numero,9,2);
guardar4:=substr(numero,10);
numero:=guardar1 || '-' || guardar2 || '-' || guardar3 || '-' || guardar4;
END;
/



DECLARE
x varchar2(30):='15210457901111111111';
BEGIN
formateo_cuenta(x);
dbms_output.put_line(x);
END;

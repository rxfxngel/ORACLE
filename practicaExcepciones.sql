/*Crear una SELECT (no un cursor explícito) que devuelva el nombre de un empleado pasándole el EMPLOYEE_ID en el WHERE,  

o Comprobar en primer lugar que funciona pasando un empleado existente
o Pasar un empleado inexistente y comprobar que genera un error
o Crear una zona de EXCEPTION controlando el NO_DATA_FOUND para que pinte un mensaje como “Empleado inexistente”*/



DECLARE

nombre_empleado employees.first_name%TYPE;
BEGIN
    SELECT first_name INTO nombre_empleado FROM employees
    WHERE employee_id=1000;   --EMPLEADO INEXISTENTE
   DBMS_OUTPUT.PUT_LINE(nombre_empleado);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
   DBMS_OUTPUT.PUT_LINE('No existe el empleado.');

END;
/

 /*Modificar la SELECT para que devuelva más de un empleado, por ejemplo poniendo EMPLOYEE_ID> 100. Debe generar un error
Controlar la excepción para que genere un mensaje como “Demasiados empleados en la consulta”*/

DECLARE

nombre_empleado employees.first_name%TYPE;
BEGIN
    SELECT first_name INTO nombre_empleado FROM employees
    WHERE employee_id=1000;
    DBMS_OUTPUT.PUT_LINE(nombre_empleado);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
           DBMS_OUTPUT.PUT_LINE('No existe el empleado.');
    WHEN TOO_MANY_ROWS THEN
           DBMS_OUTPUT.PUT_LINE('Empleado duplicado.');
END;
/


 /*Modificar la consulta para que devuelva un error de división por CERO, por ejemplo, vamos a devolver el salario en vez del nombre y lo dividimos por 0.
En este caso, en vez de controlar la excepción directamente, creamos una sección WHEN OTHERS y pintamos el error con SQLCODE y SQLERRM*/


DECLARE
    nombre_empleado   employees.first_name%TYPE;
    salario number;
BEGIN
    SELECT  salary iNTO   salario
    FROM
        employees
    WHERE
        employee_id = 100;
    salario:=salario/0;
    dbms_output.put_line(salario);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No existe el empleado.');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Empleado duplicado.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('CODIGO:'||SQLCODE);
        DBMS_OUTPUT.PUT_LINE('MENSAJE:'||SQLERRM);
END;
/

/*El error -00001 es clave primaria duplicada. Aunque ya existe una predefinida (DUP_VAL_ON_INDEX) vamos a crear una excepción no -predefinida que haga lo mismo. o Vamos a usar la tabla REGIONS para hacerlo más fácil o Usamos PRAGMA EXCEPTION_INIT y creamos una excepción denominada “duplicado”. Cuando se genere ese error debemos pintar “Clave duplicada, intente otra”. o Insertamos una fila en la tabla REGIONS que esté duplicada y vemos que se controla el error*/


set serveroutput on
DECLARE
duplicado EXCEPTION;
PRAGMA EXCEPTION_INIT(duplicado,-00001);
BEGIN
INSERT INTO REGIONS VALUES (1,'PRUEBA');
COMMIT;
EXCEPTION
when duplicado then
dbms_output.put_line('Registro duplicado');
End;



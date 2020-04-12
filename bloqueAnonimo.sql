SET SERVEROUTPUT ON

DECLARE
    nombre     VARCHAR2(100);
    apellido   VARCHAR2(100);
BEGIN
    nombre := 'JUAN';
    apellido := 'PEREZ';
    DBMS_OUTPUT.PUT_LINE(nombre);
    DBMS_OUTPUT.PUT_LINE(apellido);
    DBMS_OUTPUT.PUT_LINE(apellido);
END;

SET SERVEROUTPUT ON

DECLARE
    num1 number;
    num2 number;
BEGIN
    num1:=2;
    num2:=3;
    DBMS_OUTPUT.PUT_LINE(num1+num2);
END;

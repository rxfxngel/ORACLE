SET SERVEROUTPUT ON

DECLARE
-- CTRL + F7 PARA FORMATEAR
    x   CONSTANT NUMBER := 10;
    z   NUMBER NOT NULL := 20;
BEGIN
    dbms_output.put_line(x);
    z := 30;
    dbms_output.put_line(z);
END;


SET SERVEROUTPUT ON

DECLARE
    nombre     VARCHAR2(100);
    apellido   VARCHAR2(100);
BEGIN
    nombre := 'JUAN';
    apellido := 'PEREZ';
    DBMS_OUTPUT.PUT_LINE(nombre);
    DBMS_OUTPUT.PUT_LINE(apellido);
     DBMS_OUTPUT.PUT_LINE(nombre||' '||apellido);
END;

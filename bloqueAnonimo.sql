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

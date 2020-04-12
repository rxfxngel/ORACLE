SET SERVEROUTPUT ON

DECLARE
    nombre     VARCHAR2(100);
    apellido   VARCHAR2(100);
BEGIN
    nombre := 'JUAN';
    apellido := 'PEREZ';
    dbms_output.put_line(nombre);
    dbms_output.put_line(apellido);
    dbms_output.put_line(nombre||' '|| apellido);
END;

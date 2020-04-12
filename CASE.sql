SET SERVEROUTPUT ON
DECLARE
    x NUMBER:= 20;
BEGIN
   CASE x
   WHEN 10 THEN dbms_output.put_line('A');
   WHEN 20 THEN dbms_output.put_line('B');
   ELSE dbms_output.put_line('Z');
   END CASE;
END;

BEGIN
    FOR i IN 5..15 LOOP   --PLS_INTEGER
        CONTINUE WHEN i=10 OR i=9;
        dbms_output.put_line(i);
    END LOOP;
    
     dbms_output.put_line('--------------');
    FOR i IN REVERSE 5..15 LOOP   --PLS_INTEGER
        dbms_output.put_line(i);
        EXIT WHEN i=10;
    END LOOP;
END;

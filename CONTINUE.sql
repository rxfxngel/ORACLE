DECLARE
    x NUMBER:=0;
BEGIN
    LOOP
        x:=x+1;
        CONTINUE WHEN x<3;
        DBMS_OUTPUT.PUT_LINE('DESPUES DE CONTINUE: x='||TO_CHAR(x));
        EXIT WHEN X=5;
    END LOOP;
END;

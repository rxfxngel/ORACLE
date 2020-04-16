DECLARE
    i NUMERIC:=0;
    j NUMERIC;
BEGIN
    <<parent>>
    LOOP
        i:=i+1;
        j:=0;
        DBMS_OUTPUT.PUT_LINE('TABLA DEL '||i);
        <<child>>
        LOOP
            j:=j+1;
            DBMS_OUTPUT.PUT_LINE(i||'x'||j||'='||i*j);
            EXIT child WHEN j=10;
        END LOOP;
        EXIT parent WHEN i=10;
    END LOOP;
END;

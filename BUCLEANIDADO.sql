DECLARE
    s PLS_INTEGER:=0;
    i PLS_INTEGER:=0;
    j PLS_INTEGER;
BEGIN
    <<parent>>
    LOOP
        i:=i+1;
        j:=100;
        DBMS_OUTPUT.PUT_LINE('Parent:'||i);
        <<child>>
        LOOP
            EXIT parent WHEN(i>3);
                DBMS_OUTPUT.PUT_LINE('child:'||j);
            j:=j+1;
            EXIT child WHEN (j>105);
        
        END LOOP child;
        DBMS_OUTPUT.PUT_LINE('Finish!!!');
    END LOOP parent;

END;

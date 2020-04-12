DECLARE
    X NUMBER:=1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(X);
        X:=X+1;
        
        EXIT WHEN X=11;
    END LOOP;
    
END;

SET SERVEROUTPUT ON
DECLARE
    TYPE DEPARTAMENTOS IS TABLE OF
        DEPARTMENTS%ROWTYPE
    INDEX BY PLS_INTEGER;
    DEPTS DEPARTAMENTOS;
BEGIN
    FOR I IN 1..10 LOOP
    SELECT * INTO DEPTS(I) FROM DEPARTMENTS WHERE DEPARTMENT_ID=I*10;
    END LOOP;
    
    FOR I IN  DEPTS.FIRST..DEPTS.LAST LOOP
        DBMS_OUTPUT.PUT_LINE(DEPTS(I).DEPARTMENT_NAME);
    END LOOP;

END;
/
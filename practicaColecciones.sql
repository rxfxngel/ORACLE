SET SERVEROUTPUT ON
DECLARE
  TYPE EMPL_RECORD IS RECORD 
  ( 
    NAME VARCHAR2(100),
    SAL EMPLOYEES.SALARY%TYPE,
    COD_DEPT EMPLOYEES.DEPARTMENT_ID%TYPE);
  
  TYPE EMPL_TABLE IS TABLE OF
      EMPL_RECORD
  INDEX BY PLS_INTEGER;
     
  EMPL EMPL_TABLE; 
BEGIN
   FOR I in 100..206 LOOP
       SELECT FIRST_NAME||' '||LAST_NAME, SALARY, DEPARTMENT_ID  INT0 EMPL(I) FROM EMPLOYEES
       WHERE EMPLOYEE_ID=I;
   END LOOP;

   FOR I IN EMPL.FIRST..EMPL.LAST LOOP
     DBMS_OUTPUT.PUT_LINE(EMPL(I).NAME||' '||EMPL(I).SAL||' '||EMPL(I).COD_DEPT);
   END LOOP;
   DBMS_OUTPUT.PUT_LINE('EL PRIMERO');
   DBMS_OUTPUT.PUT_LINE(EMPL(EMPL.FIRST).NAME);
   DBMS_OUTPUT.PUT_LINE('EL ÚLTIMO'); 
   DBMS_OUTPUT.PUT_LINE(EMPL(EMPL.LAST).NAME);  
   DBMS_OUTPUT.PUT_LINE('BORRAMOS LOS EMPLEADOS QUE GANEN MENOS DE 7000'); 
   DBMS_OUTPUT.PUT_LINE('ANTES');
   DBMS_OUTPUT.PUT_LINE(EMPL.COUNT);
   FOR I IN EMPL.FIRST..EMPL.LAST LOOP
     IF EMPL(I).SAL < 7000 THEN
         EMPL.DELETE(I) ;
     END IF;
   END LOOP;
      DBMS_OUTPUT.PUT_LINE('DESPUES');
   DBMS_OUTPUT.PUT_LINE(EMPL.COUNT);
  
END;
/

SET SERVEROUTPUT ON
DECLARE
    EMPLEADO EMPLOYEES%ROWTYPE;
BEGIN
    SELECT *
    INTO EMPLEADO
    FROM
        EMPLOYEES
    WHERE
    EMPLOYEE_ID=100;
    
    DBMS_OUTPUT.PUT_LINE(EMPLEADO.SALARY);
END;

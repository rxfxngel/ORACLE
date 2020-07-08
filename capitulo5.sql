--Working with Packages

--..Ejemplo sobrecarga de PROCEDURES


CREATE OR REPLACE PACKAGE dept_pkg IS
PROCEDURE add_department
(p_deptno departments.department_id%TYPE,
p_name departments.department_name%TYPE :='unknown',
p_loc departments.location_id%TYPE := 1700);
PROCEDURE add_department
(p_name departments.department_name%TYPE :='unknown',
p_loc departments.location_id%TYPE := 1700);
END dept_pkg;
/

--...cuerpo del paquete

-- Package body of package defined on previous slide.
CREATE OR REPLACE PACKAGE BODY dept_pkg IS
PROCEDURE add_department -- First procedure's declaration
(p_deptno departments.department_id%TYPE,
p_name departments.department_name%TYPE := 'unknown',
p_loc departments.location_id%TYPE := 1700) IS
BEGIN
INSERT INTO departments(department_id,
department_name, location_id)
VALUES (p_deptno, p_name, p_loc);
END add_department;
PROCEDURE add_department -- Second procedure's declaration
(p_name departments.department_name%TYPE := 'unknown',
p_loc departments.location_id%TYPE := 1700) IS
BEGIN
INSERT INTO departments (department_id,
department_name, location_id)
VALUES (departments_seq.NEXTVAL, p_name, p_loc);
END add_department;
END dept_pkg; 



----probando el ejemplo

EXECUTE dept_pkg.add_department(980,'Education',2500)
SELECT * FROM departments
WHERE department_id = 980;



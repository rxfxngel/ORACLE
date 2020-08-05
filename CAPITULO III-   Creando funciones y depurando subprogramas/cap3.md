Creating Functions and
Debugging Subprograms

Una función:
- Es un bloque PL / SQL con nombre que devuelve un valor
- Se puede almacenar en la base de datos como un objeto de esquema para ejecución repetida
- Se llama como parte de una expresión o se usa para proporcionar un valor de parámetro para otro subprograma
- Se puede agrupar en paquetes PL / SQL

 ```sql
CREATE [OR REPLACE] FUNCTION function_name
[(parameter1 [mode1] datatype1, . . .)]
RETURN datatype IS|AS
[local_variable_declarations;
. . .]
BEGIN
-- actions;
RETURN expression;
END [function_name];
 ```
Ejemplo

 ```sql
CREATE OR REPLACE FUNCTION get_sal
(p_id employees.employee_id%TYPE) RETURN NUMBER IS
v_sal employees.salary%TYPE := 0;
BEGIN
SELECT salary
INTO v_sal
FROM employees
WHERE employee_id = p_id;
RETURN v_sal;
END get_sal;
/
 ```
Ejecutar funcion
 ```sql
EXECUTE dbms_output.put_line(get_sal(100))
 ```

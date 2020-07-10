--Consideraciones de diseño para código PL / SQL

/*
Objetivos
Después de completar esta lección, deberías poder hacer
siguiendo:
• Crear constantes estándar y excepciones
• Escribir y llamar a subprogramas locales.
• Controlar los privilegios de tiempo de ejecución de un subprograma
• Realizar transacciones autónomas
• Otorgue roles a paquetes PL / SQL y almacenes independientes
subprogramas
• Pase los parámetros por referencia utilizando una sugerencia NOCOPY
• Utilice la sugerencia PARALLEL ENABLE para la optimización
• Utilice el caché de resultados de la función PL / SQL entre sesiones(cross-session)
• Use la cláusula DETERMINISTIC con funciones
• Use la cláusula RETURNING y el enlace masivo con DML
*/


--!!!!!!!!!!!!estandarizar la captura de errores con pragma

CREATE OR REPLACE PACKAGE error_pkg IS
e_fk_err EXCEPTION;
e_seq_nbr_err EXCEPTION;
PRAGMA EXCEPTION_INIT (e_fk_err, -2292);
PRAGMA EXCEPTION_INIT (e_seq_nbr_err, -2277);
...
END error_pkg;
/

--!!!!!!!!!!!!crear constantes para optimizar

CREATE OR REPLACE PACKAGE constant_pkg IS
  c_order_received CONSTANT VARCHAR(2) := 'OR';
  c_order_shipped CONSTANT VARCHAR(2) := 'OS';
  c_min_sal CONSTANT NUMBER(3) := 900;
END constant_pkg;

--usando las constantes
BEGIN
UPDATE employees
SET salary = salary + 200
WHERE salary <= constant_pkg.c_min_sal;
END;
/
--!!!!!!!!!!!!se puede crear una funcion en la parte de declaraciones de un procedimiento almacenado

CREATE PROCEDURE employee_sal(p_id NUMBER) IS
v_emp employees%ROWTYPE;
FUNCTION tax(p_salary VARCHAR2) RETURN NUMBER IS
BEGIN
RETURN p_salary * 0.825;
END tax;
BEGIN
SELECT * INTO v_emp
FROM EMPLOYEES WHERE employee_id = p_id;
DBMS_OUTPUT.PUT_LINE('Tax: '|| tax(v_emp.salary));
END;
/
EXECUTE employee_sal(100)
/*
Puede definir un bloque PL / SQL con nombre en la sección declarativa de cualquier programa PL / SQL,
procedimiento, función o bloque anónimo si se declara al final de la Declaración
sección. Los subprogramas locales tienen las siguientes características:
• Son accesibles solo para el bloque en el que están definidos.
• Se compilan como parte de sus bloques de cerramiento.
Los beneficios de los subprogramas locales son:
• Reducción del código repetitivo.
• Legibilidad mejorada del código y facilidad de mantenimiento.
• Menos administración porque hay un programa para mantener en lugar de dos
El concepto es simple. El ejemplo que se muestra en la diapositiva ilustra esto con un ejemplo básico de un cálculo del impuesto sobre la renta del salario de un empleado.

*/


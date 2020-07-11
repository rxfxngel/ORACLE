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

                                   
                                   
                                   
--      Derechos del definidor versus derechos del invocador
/*
Derechos del definidor:
      • Los programas se ejecutan con el
      privilegios de la creación
      usuario.
                                   
      • El usuario no requiere
      privilegios sobre subyacente
      objeta que el procedimiento
      accesos. El usuario requiere
      privilegio solo para ejecutar un
      procedimiento.
Derechos del invocador:
      • Programas ejecutados
      con los privilegios de
      El usuario llamante.
                                   
      • El usuario requiere
      privilegios en el
      objetos subyacentes
      que el procedimiento
      accesos
                                    
Especificación de los derechos del invocador:
Establecer AUTHID en CURRENT_USER
                                   
*/                                   
    CREATE OR REPLACE PROCEDURE add_dept(
    p_id NUMBER, p_name VARCHAR2) AUTHID CURRENT_USER IS
    BEGIN
      INSERT INTO departments
      VALUES (p_id, p_name, NULL, NULL);
    END;

/*                              
Cuando se usa con funciones independientes, procedimientos o
paquetes:
• Nombres utilizados en consultas, DML, SQL dinámico nativo y
El paquete DBMS_SQL se resuelve en el esquema del invocador
• Las llamadas a otros paquetes, funciones y procedimientos son
resuelto en el esquema del definidor
                                   
*/ 
                                   
                                   
--Autonomous Transactions

/*
son transacciones independientes iniciadas por otra transacción principal
• Se especifican con PRAGMA AUTONOMOUS_TRANSACTION                                  
*/
                                   
--Usando la sugerencia NOCOPY
                                  
/*
• Permite que el compilador PL / SQL pase OUT y IN OUT
parámetros por referencia en lugar de por valor
• Mejora el rendimiento al reducir los gastos generales cuando
parámetros de paso
*/
--Usando la sugerencia PARALLEL_ENABLE                                 
/*
• Se puede usar en funciones como una sugerencia de optimización
• Indica que una función puede usarse en una consulta paralela o en una declaración DML paralela
*/
                                   
--  Uso de la sesión cruzada PL / SQL Función Caché de resultados
/*                                                          
• Cada vez que se llama a una función PL / SQL en caché de resultados con diferentes valores de parámetros, esos parámetros y sus resultados se almacenan en caché.
• La función de caché de resultados se almacena en un área global compartida (SGA), por lo que está disponible para cualquier sesión que ejecute su aplicación.
• Las llamadas posteriores a la misma función con los mismos parámetros utilizan el resultado de la memoria caché.
• Se han mejorado el rendimiento y la escalabilidad.
• Esta característica se utiliza con funciones que se llaman con frecuencia y dependen de la información que cambia con poca frecuencia.
*/
                                   
--ejemplo
CREATE OR REPLACE FUNCTION get_hire_date (emp_id NUMBER)
RETURN VARCHAR
RESULT_CACHE
AUTHID CURRENT_USER
IS
date_hired DATE;
BEGIN
SELECT hire_date INTO date_hired
from employees
WHERE employee_id = emp_id;
RETURN TO_CHAR(date_hired);
END;
/
SELECT get_hire_date(206) from DUAL;
                                   
--Uso de la cláusula DETERMINISTICA con funciones
/*
• Especifique DETERMINISTIC para indicar que la función devuelve el mismo valor de resultado siempre que se llame con los mismos valores para sus argumentos.
• Esto ayuda al optimizador a evitar llamadas a funciones redundantes.
• Si se llamó previamente a una función con los mismos argumentos, el optimizador puede elegir usar el resultado anterior.
• No especifique DETERMINISTIC para una función cuyo resultado depende del estado de las variables de sesión u objetos de esquema.                                   
*/
                                   
/*
Puede usar la cláusula de función DETERMINISTIC para indicar que la función devuelve el mismo valor de resultado siempre que se llame 
con los mismos valores para sus argumentos.

Debe especificar esta palabra clave si tiene la intención de llamar a la función en la expresión de un índice basado en funciones 
o desde la consulta de una vista materializada que está marcada como REFRESH FAST o ENABLE QUERY REWRITE. Cuando Oracle Database 
encuentra una función determinista en uno de estos contextos, intenta usar resultados calculados previamente cuando sea posible en 
lugar de ejecutar la función nuevamente. Si posteriormente cambia la semántica de la función, debe reconstruir manualmente todos 
los índices basados en funciones dependientes y las vistas materializadas.

No especifique esta cláusula para definir una función que use variables de paquete o que acceda a la base de datos de alguna manera 
que pueda afectar el resultado de retorno de la función. Los resultados de hacerlo no se capturarán si Oracle Database elige no volver 
a ejecutar la función.
                                   
Notas
• No especifique DETERMINISTIC para una función cuyo resultado depende del estado de las variables de sesión u objetos de esquema 
porque los resultados pueden variar entre llamadas. En su lugar, considere hacer que la función quede en caché de resultados.
• Para obtener más información sobre la cláusula DETERMINISTIC, consulte la Referencia del lenguaje SQL de la base de datos Oracle.
*/
                                   
--Using the RETURNING Clause                                 
/*
• Mejora el rendimiento al devolver valores de columna con
INSERTAR, ACTUALIZAR y ELIMINAR declaraciones
• Elimina la necesidad de una instrucción SELECT                         
*/
--ejemplo
                                   
CREATE OR REPLACE PROCEDURE update_salary(p_emp_id
NUMBER) IS
v_name employees.last_name%TYPE;
v_new_sal employees.salary%TYPE;
BEGIN
UPDATE employees
SET salary = salary * 1.1
WHERE employee_id = p_emp_id
RETURNING last_name, salary INTO v_name, v_new_sal;
DBMS_OUTPUT.PUT_LINE(v_name || ' new salary is ' ||
v_new_sal);
END update_salary;
/
                                   
/*
Vincula conjuntos completos de valores en una sola operación, en lugar de utilizar un bucle 
para realizar una operación FETCH, INSERT, UPDATE y DELETE varias veces.
*/
--Bulk Binding FORALL: Example                          
                                   
CREATE PROCEDURE raise_salary(p_percent NUMBER) IS
TYPE numlist_type IS TABLE OF NUMBER
INDEX BY BINARY_INTEGER;
v_id numlist_type; -- collection
BEGIN
v_id(1):= 100; v_id(2):= 102; v_id(3):= 104; v_id(4) := 110;
-- bulk-bind the PL/SQL table
FORALL i IN v_id.FIRST .. v_id.LAST
UPDATE employees
SET salary = (1 + p_percent/100) * salary
WHERE employee_id = v_id(i);
END;
/
/*
Un atributo de cursor adicional para operaciones DML
Otro atributo de cursor agregado para admitir operaciones masivas es% BULK_ROWCOUNT. 
El atributo% BULK_ROWCOUNT es una estructura compuesta diseñada para usar con la instrucción FORALL. 
Este atributo actúa como una tabla de índice por. Su elemento i-ésimo almacena el número de filas procesadas 
por la i-ésima ejecución de una instrucción UPDATE o DELETE. Si la ejecución i-ésima no afecta a ninguna fila, 
entonces% BULK_ROWCOUNT (i) devuelve cero.
*/
CREATE TABLE num_table (n NUMBER);
DECLARE
TYPE num_list_type IS TABLE OF NUMBER
INDEX BY BINARY_INTEGER;
v_nums num_list_type;
BEGIN
v_nums(1) := 1;
v_nums(2) := 3;
v_nums(3) := 5;
v_nums(4) := 7;
v_nums(5) := 11;
FORALL i IN v_nums.FIRST .. v_nums.LAST
INSERT INTO v_num_table (n) VALUES (v_nums(i));
FOR i IN v_nums.FIRST .. v_nums.LAST
LOOP
dbms_output.put_line('Inserted ' ||
SQL%BULK_ROWCOUNT(i) || ' row(s)'
|| ' on iteration ' || i);
END LOOP;
END;
/
DROP TABLE num_table
/*

Uso de BULK COLLECT INTO con consultas La instrucción SELECT admite la sintaxis BULK COLLECT INTO.                                         
*/   
--ejemplo
CREATE PROCEDURE get_departments(p_loc NUMBER) IS
TYPE dept_tab_type IS
TABLE OF departments%ROWTYPE;
v_depts dept_tab_type;
BEGIN
SELECT * BULK COLLECT INTO v_depts
FROM departments
WHERE location_id = p_loc;
FOR i IN 1 .. v_depts.COUNT LOOP
DBMS_OUTPUT.PUT_LINE(v_depts(i).department_id
||' '|| v_depts(i).department_name);
END LOOP;
END;
/*
Comenzando con Oracle Database 10g, cuando se usa una instrucción SELECT en PL / SQL, puede usar la sintaxis 
de colección masiva que se muestra en el ejemplo de la diapositiva. Por lo tanto, puede obtener rápidamente 
un conjunto de filas sin utilizar un mecanismo de cursor.
El ejemplo lee todas las filas de departamento para una región específica en una tabla PL / SQL, cuyo contenido 
se muestra con el bucle FOR que sigue a la instrucción SELECT.                                          
*/
                                           
/*
La instrucción FETCH se ha mejorado para admitir la sintaxis BULK COLLECT INTO.
*/
                                           
CREATE OR REPLACE PROCEDURE get_departments(p_loc NUMBER) IS
CURSOR cur_dept IS
SELECT * FROM departments
WHERE location_id = p_loc;
TYPE dept_tab_type IS TABLE OF cur_dept%ROWTYPE;
v_depts dept_tab_type;
BEGIN
OPEN cur_dept;
FETCH cur_dept BULK COLLECT INTO v_depts;
CLOSE cur_dept;
FOR i IN 1 .. v_depts.COUNT LOOP
DBMS_OUTPUT.PUT_LINE(v_depts(i).department_id
||' '|| v_depts(i).department_name);
END LOOP;
END;
                                           
/*Usando BULK COLLECT INTO
con una Cláusula de RETURNING */
                                           
                                           
CREATE OR REPLACE PROCEDURE raise_salary(p_rate NUMBER)
IS
TYPE emplist_type IS TABLE OF NUMBER;
TYPE numlist_type IS TABLE OF employees.salary%TYPE
INDEX BY BINARY_INTEGER;
v_emp_ids emplist_type :=
emplist_type(100,101,102,104);
v_new_sals numlist_type;
BEGIN
FORALL i IN v_emp_ids.FIRST .. v_emp_ids.LAST
UPDATE employees
SET commission_pct = p_rate * salary
WHERE employee_id = v_emp_ids(i)
RETURNING salary BULK COLLECT INTO v_new_sals;
FOR i IN 1 .. v_new_sals.COUNT LOOP
DBMS_OUTPUT.PUT_LINE(v_new_sals(i));
END LOOP;
END;
/*
Los enlaces masivos se pueden usar para mejorar el rendimiento de los bucles FOR que hacen referencia a colecciones 
y devuelven DML. Si tiene, o planea tener, un código PL / SQL que hace esto, entonces puede usar la palabra clave FORALL 
junto con las palabras clave RETURNING y BULK COLLECT INTO para mejorar el rendimiento.

En el ejemplo que se muestra en la diapositiva, la información salarial se recupera de la tabla EMPLOYEES y se recopila 
en la matriz new_sals. La colección new_sals se devuelve de forma masiva al motor PL / SQL.

El ejemplo en la diapositiva muestra un ciclo FOR incompleto que se utiliza para recorrer los nuevos datos salariales 
recibidos de la operación ACTUALIZAR y luego procesar los resultados
 */

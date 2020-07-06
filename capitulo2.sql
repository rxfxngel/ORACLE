/*
Bloques anónimos: descripción general
Bloques anónimos:
• Forma la estructura básica de bloques PL / SQL
• Inicia tareas de procesamiento PL / SQL desde aplicaciones
• Se puede anidar dentro de la sección ejecutable de cualquier
Bloque PL / SQL

[DECLARE -- Declaration Section (Optional)
variable declarations; ... ]
BEGIN -- Executable Section (Mandatory)
SQL or PL/SQL statements;
[EXCEPTION -- Exception Section (Optional)
WHEN exception THEN statements; ]
END; -- End of Block (Mandatory


Los bloques anónimos se usan típicamente para:
• Escribir código de activación para componentes de Oracle Forms
• Iniciar llamadas a procedimientos, funciones y construcciones de paquetes
• Aislar el manejo de excepciones dentro de un bloque de código
• Anidamiento dentro de otros bloques PL / SQL para administrar el control del flujo de código
La palabra clave DECLARE es opcional, pero es obligatoria si declara variables, constantes y
excepciones para ser utilizadas dentro del bloque PL / SQL.
BEGIN y END son obligatorios y requieren al menos una declaración entre ellos, SQL,
PL / SQL, o ambos.
La sección de excepción es opcional y se usa para manejar errores que ocurren dentro del alcance de
El bloque PL / SQL. Las excepciones se pueden propagar a la persona que llama del bloque anónimo mediante
excluyendo un controlador de excepción para la excepción específica, creando así lo que se conoce como un
Excepción no controlada

*/
-------------------------------------------------------------------------------------------------------------------------------

/*


¿Qué son los subprogramas PL / SQL?
• Un subprograma PL / SQL es un bloque PL / SQL con nombre que puede
ser llamado con un conjunto de parámetros.
• Puede declarar y definir un subprograma dentro de un
Bloque PL / SQL u otro subprograma.
• Un subprograma consta de una especificación y un cuerpo.
• Un subprograma puede ser un procedimiento o una función.
• Normalmente, utiliza un procedimiento para realizar una acción y un
función para calcular y devolver un valor.
• Los subprogramas se pueden agrupar en paquetes PL / SQL
*/

/*
Partes del subprograma: un subprograma consta de una especificación (especificación) y un cuerpo. Declarar
un subprograma, debe proporcionar las especificaciones, que incluyen descripciones de
parámetros Para definir un subprograma, debe proporcionar tanto las especificaciones como el cuerpo.
Puede declarar un subprograma primero y luego definirlo en el mismo bloque o subprograma,
o declararlo y definirlo al mismo tiempo.
Tipos de subprogramas: PL / SQL tiene dos tipos de subprogramas: procedimientos y funciones.
Normalmente, utiliza un procedimiento para realizar una acción y una función para calcular y devolver un
valor.
Un procedimiento y una función tienen la misma estructura, excepto que solo una función tiene alguna
elementos adicionales como la cláusula RETURN o la declaración RETURN.
La cláusula RETURN especifica el tipo de datos del valor de retorno (requerido). UN RETORNO
La instrucción especifica el valor de retorno (requerido). Las funciones se cubren con más detalle en el
próxima lección titulada "Creación de funciones y depuración de subprogramas".
Los subprogramas se pueden agrupar en paquetes PL / SQL, que hacen que el código sea aún más reutilizable
y mantenible. Para obtener más información, consulte las lecciones tituladas "Creación de paquetes" y "Trabajo con
Paquetes
*/


/*
Los procedimientos y funciones tienen muchos beneficios debido a la modularización del código:
• Se realiza un mantenimiento sencillo porque los subprogramas están ubicados en un solo lugar.
Las modificaciones deben hacerse en un solo lugar para afectar múltiples aplicaciones y
minimizar las pruebas excesivas
• Se puede lograr una mayor seguridad de los datos controlando el acceso indirecto a la base de datos.
objetos de usuarios no privilegiados con privilegios de seguridad. Los subprogramas son por
predeterminado ejecutado con el derecho del definidor. El privilegio de ejecución no permite a un usuario llamante
Acceso directo a objetos accesibles para el subprograma.
• La integridad de los datos se gestiona mediante acciones relacionadas que se realizan juntas o que no se realizan.
• Se puede obtener un rendimiento mejorado a partir de la reutilización del código PL / SQL analizado que
está disponible en el área SQL compartida del servidor. Llamadas posteriores a la
subprograma evitar analizar el código nuevamente. Porque el código PL / SQL se analiza en la compilación
tiempo, se evita la sobrecarga de análisis de las instrucciones SQL en tiempo de ejecución. El código puede ser
escrito para reducir el número de llamadas de red a la base de datos y, por lo tanto, disminuir
tráfico de red.
• Se puede lograr una claridad de código mejorada mediante el uso de nombres y convenciones apropiados para
describir la acción de las rutinas, reduciendo así la necesidad de comentarios y
mejorando la claridad del código.
*/


/*
Diferencias entre bloques anónimos y subprogramas


Bloques anónimos
• Bloques PL / SQL sin nombre 
• Compilado cada vez 
• No almacenado en la base de datos
• No puede ser invocado por otras aplicaciones
• No retorna valores
• No puede pedir parámetros

Subprogramas 

• Bloques PL / SQL con nombre
• Compilado solo una vez
• Almacenado en la base de datos
• Nombrado y, por lo tanto, puede ser invocado por otras aplicaciones
• Los subprogramas llamados funciones deben devolver valores.
• No puede tomar parámetros Puede tomar parámetros

*/
----------------------------------------------------------------------------------------------------------------------

/*

¿Qué son los procedimientos?
• Un tipo de subprograma que realiza una acción.
• Se puede almacenar en la base de datos como un objeto de esquema
• Promover la reutilización y la mantenibilidad.
*/



/*
Un procedimiento es un bloque PL / SQL con nombre que puede aceptar parámetros (a veces denominados argumentos). 
Generalmente, utiliza un procedimiento para realizar una acción. Tiene un encabezado, una sección de declaración, 
una sección ejecutable y una sección opcional de manejo de excepciones.

Se invoca un procedimiento utilizando el nombre del procedimiento en la sección de ejecución de otro
Bloque PL / SQL.

Un procedimiento se compila y almacena en la base de datos como un objeto de esquema. Si está utilizando los procedimientos 
con Oracle Forms and Reports, se pueden compilar dentro de los Oracle Forms u Oracle Reports ejecutables.

Los procedimientos promueven la reutilización y la mantenibilidad. Cuando se validan, se pueden usar en cualquier 
número de aplicaciones. Si los requisitos cambian, solo el procedimiento debe actualizarse

*/


/*
Crear procedimientos con el SQL
CREAR O REEMPLAZAR Declaración
• Use la cláusula CREATE para crear un procedimiento independiente
que se almacena en la base de datos Oracle.
• Use la opción O REEMPLAZAR para sobrescribir un existente
procedimiento
*/


/*
CREATE [OR REPLACE] PROCEDURE procedure_name
[(parameter1 [mode] datatype1,
parameter2 [mode] datatype2, ...)]
IS|AS
[local_variable_declarations; ...]
BEGIN
-- actions;
END [procedure_name]
*/

/*
¿Qué son los parámetros y los modos de parámetros?
• Se declaran después del nombre del subprograma en PL / SQL
encabezamiento
• Pasar o comunicar datos entre el entorno de llamada y el subprograma.
• Se usan como variables locales pero dependen de su modo de paso de parámetros:
  - Un modo de parámetro IN (el valor predeterminado) proporciona valores para que los procese un subprograma
  - Un modo de parámetro OUT devuelve un valor a la persona que llama
  - Un modo de parámetro IN OUT proporciona un valor de entrada, que puede devolverse (salida) como un valor modificado
*/

/*
CREATE OR REPLACE PROCEDURE query_emp
(p_id IN employees.employee_id%TYPE,
p_name OUT employees.last_name%TYPE,
p_salary OUT employees.salary%TYPE) IS
BEGIN
SELECT last_name, salary INTO p_name, p_salary
FROM employees
WHERE employee_id = p_id;
END query_emp;

EXAMPLE:
*/

CREATE OR REPLACE PROCEDURE query_emp
(p_id IN employees.employee_id%TYPE,
p_name OUT employees.last_name%TYPE,
p_salary OUT employees.salary%TYPE) IS
BEGIN
SELECT last_name, salary INTO p_name, p_salary
FROM employees
WHERE employee_id = p_id;
END query_emp;
/


---LLAMANDO AL PROCEDIMIENTO ALMACENADO

SET SERVEROUTPUT ON
DECLARE
v_emp_name employees.last_name%TYPE;
v_emp_sal employees.salary%TYPE;
BEGIN
query_emp(171, v_emp_name, v_emp_sal);
DBMS_OUTPUT.PUT_LINE(v_emp_name||' earns '||
to_char(v_emp_sal, '$999,999.00'));
END;
/

--Uso del modo de parámetro IN OUT: ejemplo


CREATE OR REPLACE PROCEDURE format_phone
(p_phone_no IN OUT VARCHAR2) IS
BEGIN
p_phone_no := '(' || SUBSTR(p_phone_no,1,3) ||') ' || SUBSTR(p_phone_no,4,3) ||'-' || SUBSTR(p_phone_no,7);
END format_phone;
/

--- EJECUTANDO

VARIABLE b_phone_no VARCHAR2(15)
EXECUTE :b_phone_no := '8006330575'
PRINT b_phone_no
EXECUTE format_phone (:b_phone_no)
PRINT b_phone_no






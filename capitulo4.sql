--Creating Packages
/*
¿Qué son los paquetes PL / SQL?
• Un paquete es un objeto de esquema que agrupa lógicamente
Tipos de PL / SQL, variables y subprogramas.
• Los paquetes generalmente tienen dos partes:
- Una especificación (spec)
- Un cuerpo
• La especificación es la interfaz del paquete. Eso
declara los tipos, variables, constantes, excepciones,
cursores y subprogramas a los que se puede hacer referencia desde
Fuera del paquete.
• El cuerpo define las consultas para los cursores y el código.
para los subprogramas.
• Habilite el servidor Oracle para leer múltiples objetos en
memoria a la vez
*/

/*
Ventajas de usar paquetes
• Modularidad: encapsulando construcciones relacionadas
• Mantenimiento sencillo: mantener funcionalidades relacionadas lógicamente
juntos
• Diseño de aplicación más fácil: codificación y compilación de
especificación y cuerpo por separado
• Provisión para ocultar información:
- Solo las declaraciones en la especificación del paquete son visibles
y accesible a las aplicaciones.
- Las construcciones privadas en el cuerpo del paquete están ocultas y
inaccesible.
- Toda la codificación está oculta en el cuerpo del paquete.
*/


/*
Crea un paquete en dos partes:
• La especificación del paquete es la interfaz para sus aplicaciones. Declara al público
tipos, variables, constantes, excepciones, cursores y subprogramas disponibles para su uso. los
La especificación del paquete también puede incluir PRAGMA, que son directivas para el compilador.
• El cuerpo del paquete define sus propios subprogramas y debe implementarse completamente
subprogramas declarados en la parte de especificación. El cuerpo del paquete también puede definir
Construcciones PL / SQL, como tipos, variables, constantes, excepciones y cursores.
*/



/*
Los componentes públicos se declaran en la especificación del paquete. La especificación define un
interfaz pública de programación de aplicaciones (API) para usuarios de características y funcionalidades de paquetes,
es decir, se puede hacer referencia a los componentes públicos desde cualquier entorno de servidor Oracle que sea
externo al paquete.
Los componentes privados se colocan en el cuerpo del paquete y solo pueden ser referenciados por otros
construye dentro del mismo cuerpo del paquete. Los componentes privados pueden hacer referencia al público.
componentes de un paquete.
Nota: Si una especificación de paquete no contiene declaraciones de subprograma, no hay
requisito para un cuerpo de paquete
*/


/*
Creando la especificación del paquete:
Uso de la declaración CREAR PAQUETE
*/

CREATE [OR REPLACE] PACKAGE package_name IS|AS
public type and variable declarations
subprogram specifications
END [package_name];


/*
La opción O REEMPLAZAR elimina y vuelve a crear la especificación del paquete
• Las variables declaradas en la especificación del paquete son
inicializado a NULL por defecto.
• Todas las construcciones declaradas en una especificación de paquete son
visible para los usuarios que tienen privilegios en el paquete.
*/
-- EJEMPLO DE LA ESPECIFICACION DEL PAQUETE

-- The package spec with a public variable and a
-- public procedure that are accessible from
-- outside the package.

CREATE OR REPLACE PACKAGE comm_pkg IS
v_std_comm NUMBER := 0.10; --initialized to 0.10
PROCEDURE reset_comm(p_new_comm NUMBER);
END comm_pkg;
/
--------------------package body

CREATE [OR REPLACE] PACKAGE BODY package_name IS|AS
private type and variable declarations
subprogram bodies
[BEGIN initialization statements]
END [package_name];


/*
La opción OR REPLACE cae y vuelve a crear el
cuerpo del paquete
• Los identificadores definidos en el cuerpo del paquete son privados y
no visible fuera del cuerpo del paquete.
• Todas las construcciones privadas deben declararse antes de ser
referenciado
• Las construcciones públicas son visibles para el cuerpo del paquete.

*/

--[[[[[[[Ejemplo package BODY]]]]]]]]]]

CREATE OR REPLACE PACKAGE BODY comm_pkg IS
FUNCTION validate(p_comm NUMBER) RETURN BOOLEAN IS
v_max_comm employees.commission_pct%type;
BEGIN
SELECT MAX(commission_pct) INTO v_max_comm
FROM employees;
RETURN (p_comm BETWEEN 0.0 AND v_max_comm);
END validate;
PROCEDURE reset_comm (p_new_comm NUMBER) IS
BEGIN
IF validate(p_new_comm) THEN
v_std_comm := p_new_comm; -- reset public var
ELSE RAISE_APPLICATION_ERROR(
-20210, 'Bad Commission');
END IF;
END reset_comm;
END comm_pkg;



--................ejemplo package con constantes

CREATE OR REPLACE PACKAGE global_consts IS
c_mile_2_kilo CONSTANT NUMBER := 1.6093;
c_kilo_2_mile CONSTANT NUMBER := 0.6214;
c_yard_2_meter CONSTANT NUMBER := 0.9144;
c_meter_2_yard CONSTANT NUMBER := 1.0936;
END global_consts;

--ejecucion del ejemplo

SET SERVEROUTPUT ON
BEGIN
DBMS_OUTPUT.PUT_LINE('20 miles = ' ||
20 * global_consts.c_mile_2_kilo || ' km');
END;


--................funcion usando constante del paquete

SET SERVEROUTPUT ON
CREATE FUNCTION mtr2yrd(p_m NUMBER) RETURN NUMBER IS
BEGIN
RETURN (p_m * global_consts.c_meter_2_yard);
END mtr2yrd;
/

--ejecutando la funcion
EXECUTE DBMS_OUTPUT.PUT_LINE(mtr2yrd(1))


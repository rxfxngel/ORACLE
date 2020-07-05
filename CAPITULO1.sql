/*Objetivos de la lección

Después de completar esta lección, deberías poder hacer
siguiendo:

• Discutir los objetivos del curso.
• Identificar los entornos disponibles que se pueden usar en este
curso
• Describir el esquema de la base de datos y las tablas que se usan en
el curso
• Describir las características más destacadas de Oracle Cloud 12c.
• Enumerar la documentación y los recursos disponibles.*/
------------------------------------------------------
/*
PL / SQL admite muchas construcciones de programas. En esta lección, revisa las unidades del programa en
forma de bloques anónimos, y se le presentan bloques PL / SQL con nombre. Nombrado PL / SQL
Los bloques también se denominan subprogramas. Los bloques PL / SQL nombrados incluyen procedimientos y
funciones
Las tablas del esquema de Recursos Humanos (HR) (que se utiliza para las prácticas en este
curso) se discuten brevemente. Las herramientas de desarrollo para escribir, probar y depurar
PL / SQL se enumeran.
*/
------------------------------------------------------
/*
Descripciones de tabla (ESQUEMA HR - RECURSOS HUMANOS)
• REGIONS contiene filas que representan una región como América, Asia, etc.
• COUNTRIES contiene filas para países, cada una de las cuales está asociada a una región.
• LOCATIONS contiene la dirección específica de una oficina, almacén o producción específicos.
sitio de una empresa en un país en particular.
• DEPARTMENTS muestra detalles sobre los departamentos en los que trabajan los empleados. Cada
el departamento puede tener una relación que represente al gerente del departamento en el
Mesa de EMPLEADOS.
• EMPLOYEES contiene detalles sobre cada empleado que trabaja para un departamento. Algunos
los empleados no pueden ser asignados a ningún departamento.
• TRABAJOS contiene los tipos de trabajo que puede tener cada empleado.
• JOB_HISTORY contiene el historial de trabajo de los empleados. Si un empleado cambia
departamentos dentro de un trabajo o cambia trabajos dentro de un departamento, se inserta una nueva fila en
esta tabla con la información de trabajo anterior del empleado.

*/

----------------------------------------------

/*
¿Qué es Oracle SQL Developer?
• Oracle SQL Developer es una herramienta gráfica gratuita que
mejora la productividad y simplifica la base de datos
tareas de desarrollo
• Puede conectarse a cualquier esquema de base de datos Oracle objetivo
utilizando la autenticación estándar de la base de datos Oracle.
• Utiliza SQL Developer en este curso.
• El Apéndice B contiene detalles sobre el uso de SQL Developer
*/

---------------------


/*
Oracle SQL * Plus es una interfaz gráfica de usuario (GUI) o una aplicación de línea de comandos que permite
enviar declaraciones SQL y bloques PL / SQL para su ejecución y recibir los resultados en un
aplicación o ventana de comando.
SQL * Plus es:
• Enviado con la base de datos
• Instalado en un cliente y en el sistema del servidor de la base de datos.
• Se accede desde un icono o la línea de comando
Al codificar subprogramas PL / SQL con SQL * Plus, recuerde lo siguiente:
• Cree subprogramas utilizando la instrucción CREATE SQL.
• Ejecuta subprogramas utilizando un bloque PL / SQL anónimo o el EJECUTAR
mando.
• Si utiliza los procedimientos del paquete DBMS_OUTPUT para imprimir texto en la pantalla, debe
primero ejecute el comando SET SERVEROUTPUT ON en su sesión.

*/
----------------------------

/*
Habilitación de salida de un bloque PL / SQL

Para habilitar la salida en SQL Developer, ejecute lo siguiente
comando antes de ejecutar el bloque PL / SQL:
*/

SET SERVEROUTPUT ON;
/*
 Utilice el paquete de Oracle DBMS_OUTPUT predefinido
y su procedimiento para mostrar la salida de la siguiente manera:
*/

DBMS_OUTPUT.PUT_LINE('The First Name of theEmployee is ' || v_fname);

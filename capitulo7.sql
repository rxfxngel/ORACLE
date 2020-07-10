--sql dinamico

/*
Objetivos
Después de completar esta lección, deberías poder hacer
siguiendo:
• Describir el flujo de ejecución de las sentencias SQL.
• Cree y ejecute sentencias SQL dinámicamente utilizando
SQL dinámico nativo (NDS)
• Identificar situaciones en las que debe usar DBMS_SQL
paquete en lugar de NDS para construir y ejecutar SQL
declaraciones dinámicamente
*/

/*
Todas las declaraciones SQL pasan por algunos o todos los siguientes
etapas:

– Parse
– Bind
– Execute
– Fetch


• Algunas etapas pueden no ser relevantes para todas las declaraciones:
- La fase de búsqueda es aplicable a las consultas.
- Para sentencias de SQL incorporado como SELECT, DML,
MERGE, COMMIT, SAVEPOINT y ROLLBACK, el análisis y
Las fases de enlace se realizan en tiempo de compilación.
- Para sentencias SQL dinámicas, todas las fases se realizan en
tiempo de ejecución
*/




/*
Todas las declaraciones SQL tienen que pasar por varias etapas. Sin embargo, algunas etapas pueden no ser
relevante para todas las declaraciones. Las siguientes son las etapas clave:

• Parse: cada instrucción SQL debe analizarse. Analizar la declaración incluye verificar
la sintaxis de la declaración y la validación de la declaración, asegurando que todas las referencias a
los objetos son correctos y que existen los privilegios relevantes para esos objetos.

• Bind: después del análisis, el servidor Oracle puede necesitar valores de o para cualquier variable de enlace en
la declaración. El proceso de obtención de estos valores se denomina variables de enlace. Esta
se puede omitir la etapa si la declaración no contiene variables de enlace.

• Execute: en este punto, el servidor Oracle tiene toda la información y los recursos necesarios,
y la declaración se ejecuta. Para declaraciones no consultadas, esta es la última fase.

• Fetch: en la etapa de recuperación, que es aplicable a las consultas, se seleccionan las filas y
ordenado (si lo solicita la consulta), y cada búsqueda sucesiva recupera otra fila de
el resultado, hasta que se haya obtenido la última fila



*/


/*
Las sentencias de SQL incorporado disponibles en PL / SQL están limitadas a SELECT, INSERT,
UPDATE, DELETE, MERGE, COMMIT y ROLLBACK, todos los cuales se analizan en tiempo de compilación:
es decir, tienen una estructura fija. Debe utilizar la funcionalidad dinámica de SQL si necesita:
• La estructura de una instrucción SQL para ser alterada en tiempo de ejecución
• Acceso a las instrucciones del lenguaje de definición de datos (DDL) y otras funciones SQL en
PL / SQL

Para realizar este tipo de tareas en PL / SQL, debe construir sentencias SQL dinámicamente
en cadenas de caracteres y ejecútelas usando cualquiera de los siguientes:
• Sentencias SQL dinámicas nativas con EXECUTE IMMEDIATE
• El paquete DBMS_SQL

El proceso de usar sentencias SQL que no están incrustadas en su programa fuente y son
construido en cadenas y ejecutado en tiempo de ejecución se conoce como "SQL dinámico". El SQL
las declaraciones se crean dinámicamente en tiempo de ejecución y pueden acceder y utilizar variables PL / SQL.

Por ejemplo, crea un procedimiento que utiliza SQL dinámico para operar en una tabla cuyo nombre no se conoce hasta el tiempo de ejecución,
o ejecuta una instrucción DDL (como CREATE TABLE), una instrucción de control de datos (como GRANT) o una sesión declaración de control (como ALTER SESSION).
*/


--/////////////////////////

/*
SQL dinámico nativo (NDS)

Proporciona soporte nativo para SQL dinámico directamente en el
Lenguaje PL / SQL.
• Proporciona la capacidad de ejecutar sentencias SQL cuya estructura es desconocida hasta el momento de la ejecución.
• Si la instrucción SQL dinámica es una instrucción SELECT que devuelve varias filas, NDS le ofrece las siguientes opciones:
- Utilice la instrucción EXECUTE INMEDIATE con la cláusula BULK COLLECT INTO
- Use las declaraciones OPEN-FOR, FETCH y CLOSE
• En Oracle Database 11g, NDS admite declaraciones más grandes
de 32 KB aceptando un argumento CLOB



porciona la capacidad de ejecutar dinámicamente sentencias SQL cuya estructura se construye en el momento de la ejecución. 
Las siguientes declaraciones se han agregado o ampliado en PL / SQL para admitir SQL dinámico nativo:
  • EXECUTE IMMEDIATE: prepara una declaración, la ejecuta, devuelve variables y luego desasigna recursos
  • OPEN-FOR: Prepara y ejecuta una declaración usando una variable de cursor
  • FETCH: recupera los resultados de una declaración abierta utilizando la variable del cursor
  • CLOSE: cierra el cursor utilizado por la variable del cursor y desasigna recursos. 

Puede usar variables de enlace en los parámetros dinámicos en las instrucciones EJECUTAR INMEDIATO y ABRIR. Native Dynamic SQL incluye las siguientes capacidades:
  • Definir una declaración SQL dinámica.
  • Manejar variables de enlace IN, IN OUT y OUT que están unidas por posición, no por nombre
*/

--ejemplo

CREATE FUNCTION get_emp( p_emp_id NUMBER )
RETURN employees%ROWTYPE IS
v_stmt VARCHAR2(200);
v_emprec employees%ROWTYPE;
BEGIN
v_stmt := 'SELECT * FROM employees ' ||
'WHERE employee_id = :p_emp_id';
EXECUTE IMMEDIATE v_stmt INTO v_emprec USING p_emp_id ;
RETURN v_emprec;
END;
/


--ejecucion del ejemplo


DECLARE
v_emprec employees%ROWTYPE := get_emp(100);
BEGIN
DBMS_OUTPUT.PUT_LINE('Emp: '|| v_emprec.last_name);
END;
/

# Creando Triggers(Disparadores)
**Objetivos**
Después de completar esta lección aprendera a:
- Describir los triggers de la base de datos y sus usos.
- Describir los diferentes tipos de triggers.
- Crear triggers de bases de datos.
- Describir las reglas de ejecucion de triggers de la base de datos.
- Eliminar los triggers de la base de datos.
- Mostrar la información de los triggers.


## ¿Qué son los Triggers?
- Un disparador es un bloque PL / SQL que se almacena en la base de datos y se dispara (ejecuta) en respuesta a un evento específico.
- La base de datos Oracle ejecuta automáticamente un activador cuando se producen condiciones específicas.

Los **triggers** son similares a los procedimientos almacenados. Un trigger almacenado en la base de datos contiene PL / SQL en forma de un bloque anónimo, una declaración de llamada o un bloque disparador compuesto. Sin embargo, los procedimientos y los triggers difieren en la forma en que se invocan. Un usuario, aplicación o activador ejecuta explícitamente un procedimiento. La base de datos Oracle dispara implícitamente los triggers cuando ocurre un evento desencadenante, sin importar qué usuario esté conectado o qué aplicación se esté utilizando.

## Definiendo triggers
Se puede definir un trigger en la tabla, vista, esquema o base de datos (todos los usuarios).

Tipos de eventos de activación
Puede escribir desencadenantes que se activan siempre que uno de los siguientes
las operaciones ocurren en la base de datos:
- Una declaración de manipulación de base de datos (DML) (DELETE, INSERT o UPDATE)
- Una declaración de definición de base de datos (DDL) (CREATE, ALTER o DROP)
- Una operación de base de datos como SERVERERROR, LOGON, LOGOFF, STARTUP o SHUTDOWN

## Escenarios de aplicaciones comerciales para implementar disparadores
Puede usar desencadenantes para:
- seguridad
- Auditoría
- Integridad de los datos
- Integridad referencial
- replicación de tablas
- Calcular datos derivados automáticamente
- El registro de eventos


## Tipo de eventos trigger y cuerpo(body)
 Un tipo de evento desencadenante determina qué instrucción DML
hace que se ejecute el disparador. Los posibles eventos son:
- INSERT
- UPDATE [OF column]
- DELETE

 Un cuerpo desencadenante determina qué acción se realiza y es un bloque PL / SQL o una LLAMADA a un procedimiento.
 
 ## Creando triggers DML con la instrucción CREATE TRIGGER
```
CREATE [OR REPLACE] TRIGGER trigger_name
timing –- when to fire the trigger
event1 [OR event2 OR event3]
ON object_name
[REFERENCING OLD AS old | NEW AS new]
FOR EACH ROW –- default is statement level trigger
WHEN (condition)]]
DECLARE]
BEGIN
... trigger_body –- executable statements
[EXCEPTION . . .]
END [trigger_name];
```

```
timing = BEFORE | AFTER | INSTEAD OF
```
```
event = INSERT | DELETE | UPDATE | UPDATE OF column_list
```

## Triggers a nivel de sentencias vs Triggers a nivel de filas

| **Triggers a nivel de sentencias**  | **Triggers a nivel de filas**  |
|---|---|
| Es el valor por defecto al crear un trigger  | Use la cláusula FOR EACH ROW cuando cree un trigger |
| Se dispara una vez por el evento desencadenante  |  Se dispara una vez por cada fila afectada por el evento desencadenante |
| Se dispara una vez, incluso si no hay filas afectadas  | No se dispara si el evento desencadenante no afecta a ninguna fila  |

Ejemplo
 ```sql
CREATE OR REPLACE TRIGGER secure_emp
BEFORE INSERT ON employees
BEGIN
IF (TO_CHAR(SYSDATE,'DY') IN ('SAT','SUN')) OR
(TO_CHAR(SYSDATE,'HH24:MI')
NOT BETWEEN '08:00' AND '18:00') THEN
RAISE_APPLICATION_ERROR(-20500, 'You may insert'
||' into EMPLOYEES table only during '
||' normal business hours.');
END IF;
END;
 ``` 
 probando trigger
 ```sql
INSERT INTO employees (employee_id, last_name,
first_name, email, hire_date, job_id, salary,
department_id)
VALUES (300, 'Smith', 'Rob', 'RSMITH', SYSDATE,
'IT_PROG', 4500, 60);
 ``` 
 ### Usando predicados condicionales
 ```sql
CREATE OR REPLACE TRIGGER secure_emp BEFORE
INSERT OR UPDATE OR DELETE ON employees
BEGIN
IF (TO_CHAR(SYSDATE,'DY') IN ('SAT','SUN')) OR
(TO_CHAR(SYSDATE,'HH24')
NOT BETWEEN '08' AND '18') THEN
IF DELETING THEN RAISE_APPLICATION_ERROR(
-20502,'You may delete from EMPLOYEES table'||
'only during normal business hours.');
ELSIF INSERTING THEN RAISE_APPLICATION_ERROR(
-20500,'You may insert into EMPLOYEES table'||
'only during normal business hours.');
ELSIF UPDATING ('SALARY') THEN
RAISE_APPLICATION_ERROR(-20503, 'You may '||
'update SALARY only normal during business hours.');
ELSE RAISE_APPLICATION_ERROR(-20504,'You may'||
' update EMPLOYEES table only during'||
' normal business hours.');
END IF;
END IF;
END;
 ``` 
### Creando un Trigger DML por fila
 ```sql
CREATE OR REPLACE TRIGGER restrict_salary
BEFORE INSERT OR UPDATE OF salary ON employees
FOR EACH ROW
BEGIN
IF NOT (:NEW.job_id IN ('AD_PRES', 'AD_VP'))
AND :NEW.salary > 15000 THEN
RAISE_APPLICATION_ERROR (-20202,
'Employee cannot earn more than $15,000.');
END IF;
END;
 ```
 ```sql
UPDATE employees
SET salary = 15500
WHERE last_name = 'Russell';
 ```
### Using OLD and NEW Qualifiers

Cuando se dispara un disparador de nivel de fila, el motor de tiempo de ejecución PL / SQL
crea y llena dos estructuras de datos:
- OLD: almacena los valores originales del registro procesado por el Trigger
- NEW: contiene los nuevos valores

NEW y OLD tienen la misma estructura que un registro declarado utilizando el %ROWTYPE en la tabla a la que se crea el Trigger.


|Data Operations |Old Value |New Value|
|---|---|---|
|INSERT |NULL |Inserted value|
|UPDATE |Value before update |Value after update|
|DELETE |Value |before delete |NULL|

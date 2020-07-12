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

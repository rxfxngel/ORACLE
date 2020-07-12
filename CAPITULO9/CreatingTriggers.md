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


## Tipo de eventos trigger y cuerpo(Body)
 Un tipo de evento desencadenante determina qué instrucción DML
hace que se ejecute el disparador. Los posibles eventos son:
– INSERT
– UPDATE [OF column]
– DELETE
Un cuerpo desencadenante determina qué acción se realiza y se
un bloque PL / SQL o una LLAMADA a un procedimiento

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

Los **triggers** son similares a los procedimientos almacenados. Un disparador almacenado en la base de datos contiene PL / SQL en forma de un bloque anónimo, una declaración de llamada o un bloque disparador compuesto. Sin embargo, los procedimientos y los desencadenantes difieren en la forma en que se invocan. Un usuario, aplicación o activador ejecuta explícitamente un procedimiento. La base de datos Oracle dispara implícitamente los activadores cuando ocurre un evento desencadenante, sin importar qué usuario esté conectado o qué aplicación se esté utilizando.

# Creating Compound, DDL,and Event Database Triggers
Después de completar esta lección, deberías poder hacer
siguiendo:
- Describir los desencadenantes compuestos.
- Describir tablas mutantes.
- Crear disparadores en sentencias DDL
- Crear disparadores en eventos del sistema
- Mostrar información sobre los desencadenantes

## ¿Qué es un Trigger compuesto?
Un disparador único en una tabla que le permite especificar acciones para cada uno de los siguientes cuatro puntos de tiempo:
- Antes de la declaración de despido
- Antes de cada fila que afecta la declaración de disparo
- Después de cada fila que afecta la declaración de disparo
- Después de la declaración de despido


Puede usar desencadenantes compuestos para:
- Programe un enfoque donde desee las acciones que desea. implementar para los diversos puntos de tiempo para compartir comunes datos
- Acumula filas destinadas a una segunda tabla para que puedas puede insertarlos a granel periódicamente
- Evite el error de la tabla de mutaciones (ORA-04091) permitiendo filas destinadas a una segunda tabla para acumular y luego insertarlos a granel

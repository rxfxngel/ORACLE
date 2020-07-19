# Conceptos
## DML 
A database manipulation (DML) statement (DELETE,INSERT, or UPDATE)
## DDL
A database definition (DDL) statement (CREATE, ALTER, or DROP)
## Pragma SERIE_REUSABLE
Puede marcar un paquete sin cuerpo como reutilizable en serie. Si un paquete tiene una especificación y un cuerpo, debe marcar ambos. No puedes marcar solo el cuerpo. La memoria global para paquetes reutilizables en serie se agrupa en el Área global del sistema (SGA), no se asigna a usuarios individuales en el Área global del usuario (UGA). De esa manera, el área de trabajo del paquete puede reutilizarse. Cuando finaliza la llamada al servidor, la memoria se devuelve al grupo. Cada vez que se reutiliza el paquete, sus variables públicas se inicializan a sus valores predeterminados o a NULL.
## stand-alone
Se dice cuando procedimientos o funciones u otros objetos son independientes.

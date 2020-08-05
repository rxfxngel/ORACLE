# INTRODUCCION

El esquema de Recursos Humanos (HR) es parte de los Esquemas de muestra de Oracle que se pueden instalar en una base de datos Oracle. Las sesiones de práctica en este curso utilizan datos del esquema de recursos humanos.
Descripciones de tabla
- REGIONS: contiene filas que representan una región como América, Asia, etc.
- COUNTRIES: contiene filas para países, cada una de las cuales está asociada a una región.
- LOCATIONS: contiene la dirección específica de una oficina, almacén o sitio de producción específico de una empresa en un país en particular.
- DEPARTAMENTOS muestra detalles sobre los departamentos en los que trabajan los empleados. Cada departamento puede tener una relación que represente al gerente del departamento en la tabla EMPLOYEES.
- EMPLOYEES: contiene detalles sobre cada empleado que trabaja para un departamento. Algunos empleados no pueden ser asignados a ningún departamento.
- JOBS: contiene los tipos de trabajo que puede tener cada empleado.
- JOB_HISTORY: contiene el historial de trabajo de los empleados. Si un empleado cambia de departamento dentro de un trabajo o cambia de trabajo dentro de un departamento, se inserta una nueva fila en esta tabla con la información de trabajo anterior del empleado.


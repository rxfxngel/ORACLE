# Gestión de dependencias
Después de completar esta lección, debería poder hacer lo siguiente:
- Seguimiento de dependencias procesales
- Predecir el efecto de cambiar un objeto de base de datos en procedimientos y funciones
- Gestionar dependencias procesales
Esta lección le presenta las dependencias de objetos y la compilación implícita y explícita de objetos no válidos.

## Consulta de dependencias de objetos directos: uso de la vista 

```sql
DESCRIBE user_dependencies
```
```sql
SELECT name, type, referenced_name, referenced_type
FROM   user_dependencies
WHERE  referenced_name IN ('EMPLOYEES','EMP_VW' ); 
```

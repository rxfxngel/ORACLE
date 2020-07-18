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



## Activar restricciones en tablas de mutación
### Una tabla de mutaciones es:
- Una tabla que está siendo modificada por una instrucción UPDATE, DELETE o INSERT, o
- Una tabla que podría actualizarse por los efectos de una restricción DELETE CASCADE
### Mutating Table: Example

```sql
CREATE OR REPLACE TRIGGER check_salary
BEFORE INSERT OR UPDATE OF salary, job_id
ON employees
FOR EACH ROW
WHEN (NEW.job_id <> 'AD_PRES')
DECLARE
v_minsalary employees.salary%TYPE;
v_maxsalary employees.salary%TYPE;
BEGIN
SELECT MIN(salary), MAX(salary)
INTO v_minsalary, v_maxsalary
FROM employees
WHERE job_id = :NEW.job_id;
IF :NEW.salary < v_minsalary OR :NEW.salary > v_maxsalary THEN
RAISE_APPLICATION_ERROR(-20505,'Out of range');
END IF;
END;
/
```

```sql
UPDATE employees
SET salary = 3400
WHERE last_name = 'Stiles';
```

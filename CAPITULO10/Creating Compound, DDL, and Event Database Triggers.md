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
Resultado
```
Error que empieza en la línea: 1 del comando :
UPDATE employees
SET salary = 3400
WHERE last_name = 'Stiles'
Informe de error -
ORA-04091: la tabla HR.EMPLOYEES está mutando, puede que el disparador/la función no puedan verla
ORA-06512: en "HR.CHECK_SALARY", línea 5
ORA-04088: error durante la ejecución del disparador 'HR.CHECK_SALARY'
```
Posibles Soluciones

- Use un disparador compuesto como se describió anteriormente en esta lección.
- Almacene los datos de resumen (los salarios mínimos y los salarios máximos) en otra tabla de resumen, que se mantiene actualizada con otros desencadenantes de DML.
- Almacene los datos de resumen en un paquete PL / SQL y acceda a los datos del paquete. Esto se puede hacer en un desencadenador ANTES de la instrucción.

### Using a Compound Trigger to Resolve the Mutating Table Error

```sql
CREATE OR REPLACE TRIGGER check_salary
FOR INSERT OR UPDATE OF salary, job_id
ON employees
WHEN (NEW.job_id <> 'AD_PRES')
COMPOUND TRIGGER
TYPE salaries_t IS TABLE OF employees.salary%TYPE;
min_salaries salaries_t;
max_salaries salaries_t;
TYPE department_ids_t IS TABLE OF employees.department_id%TYPE;
department_ids department_ids_t;
TYPE department_salaries_t IS TABLE OF employees.salary%TYPE
INDEX BY VARCHAR2(80);
department_min_salaries department_salaries_t;
department_max_salaries department_salaries_t;
-- example continues on next slide
BEFORE STATEMENT IS
BEGIN
SELECT MIN(salary), MAX(salary), NVL(department_id, -1)
BULK COLLECT INTO min_Salaries, max_salaries, department_ids
FROM employees
GROUP BY department_id;
FOR j IN 1..department_ids.COUNT() LOOP
department_min_salaries(department_ids(j)) := min_salaries(j);
department_max_salaries(department_ids(j)) := max_salaries(j);
END LOOP;
END BEFORE STATEMENT;
AFTER EACH ROW IS
BEGIN
IF :NEW.salary < department_min_salaries(:NEW.department_id)
OR :NEW.salary > department_max_salaries(:NEW.department_id) THEN
RAISE_APPLICATION_ERROR(-20505,'New Salary is out of acceptable
range');
END IF;
END AFTER EACH ROW;
END check_salary;

```

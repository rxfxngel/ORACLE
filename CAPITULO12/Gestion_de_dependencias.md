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

```
login as: root
root@192.168.2.142's password:
Last login: Sat Jul 18 15:26:04 2020 from 192.168.2.1
[root@srvdbqa01 ~]# su - oraqa
[oraqa@srvdbqa01 ~]$ export ORACLE_SID=MAMANI
[oraqa@srvdbqa01 ~]$ find $ORACLE_HOME -name utldtree.sql
/pu05/app/oraqa/product/12.1.0/dbhome_1/rdbms/admin/utldtree.sql
[oraqa@srvdbqa01 ~]$ sqlplus / as sysdba

SQL*Plus: Release 12.1.0.2.0 Production on Sat Jul 18 15:30:45 2020

Copyright (c) 1982, 2014, Oracle.  All rights reserved.


Connected to:
Oracle Database 12c Enterprise Edition Release 12.1.0.2.0 - 64bit Production
With the Partitioning, OLAP, Advanced Analytics and Real Application Testing opt                                                                                        ions

SQL> ^C^C^C@/pu05/app/oraqa/product/12.1.0/dbhome_1/rdbms/admin/utldtree.sql                                                                                            
SQL> @/pu05/app/oraqa/product/12.1.0/dbhome_1/rdbms/admin/utldtree.sql
drop sequence deptree_seq
              *
ERROR at line 1:
ORA-02289: sequence does not exist



Sequence created.

drop table deptree_temptab
           *
ERROR at line 1:
ORA-00942: table or view does not exist



Table created.


Procedure created.

drop view deptree
*
ERROR at line 1:
ORA-00942: table or view does not exist


SQL>
SQL> REM This view will succeed if current user is sys.  This view shows
SQL> REM which shared cursors depend on the given object.  If the current
SQL> REM user is not sys, then this view get an error either about lack
SQL> REM of privileges or about the non-existence of table x$kglxs.
SQL>
SQL> set echo off

View created.

SQL>
SQL> REM This view will succeed if current user is not sys.     This view
SQL> REM does *not* show which shared cursors depend on the given object.
SQL> REM If the current user is sys then this view will get an error
SQL> REM indicating that the view already exists (since prior view create
SQL> REM will have succeeded).
SQL>
SQL> set echo off
create view deptree
            *
ERROR at line 1:
ORA-00955: name is already used by an existing object


drop view ideptree
*
ERROR at line 1:
ORA-00942: table or view does not exist



View created.

SQL> exit
Disconnected from Oracle Database 12c Enterprise Edition Release 12.1.0.2.0 - 64                                                                                        bit Production
With the Partitioning, OLAP, Advanced Analytics and Real Application Testing opt                                                                                        ions
[oraqa@srvdbqa01 ~]$ sqlplus / as sysdba

SQL*Plus: Release 12.1.0.2.0 Production on Sat Jul 18 15:33:36 2020

Copyright (c) 1982, 2014, Oracle.  All rights reserved.


Connected to:
Oracle Database 12c Enterprise Edition Release 12.1.0.2.0 - 64bit Production
With the Partitioning, OLAP, Advanced Analytics and Real Application Testing opt                                                                                        ions

SQL> EXECUTE deptree_fill('TABLE', 'HR', 'EMPLOYEES')

PL/SQL procedure successfully completed.

SQL> SELECT * FROM  DEPTREE_TEMPTAB;

 OBJECT_ID REFERENCED_OBJECT_ID NEST_LEVEL       SEQ#
---------- -------------------- ---------- ----------
     92593                    0          0          0
     93014                92593          1          1
     93016                92593          1          2
     93018                92593          1          3
     93053                92593          1          4
     93586                92593          1          5
     93698                92593          1          6
     93699                92593          1          7
     93710                92593          1          8
     93780                92593          1          9
     93802                92593          1         10

 OBJECT_ID REFERENCED_OBJECT_ID NEST_LEVEL       SEQ#
---------- -------------------- ---------- ----------
     93932                92593          1         11
     93957                92593          1         12
     93963                92593          1         13
     93964                92593          1         14
     93966                92593          1         15
     93967                92593          1         16
     93970                92593          1         17
     93971                93970          2         18
     93972                92593          1         19
     93978                92593          1         20
     94120                92593          1         21

 OBJECT_ID REFERENCED_OBJECT_ID NEST_LEVEL       SEQ#
---------- -------------------- ---------- ----------
     94269                92593          1         22
     94270                92593          1         23

24 rows selected.

SQL> exit
Disconnected from Oracle Database 12c Enterprise Edition Release 12.1.0.2.0 - 64                                                                                        bit Production
With the Partitioning, OLAP, Advanced Analytics and Real Application Testing opt                                                                                        ions
[oraqa@srvdbqa01 ~]$ sqlplus / as sysdba

SQL*Plus: Release 12.1.0.2.0 Production on Sat Jul 18 15:34:24 2020

Copyright (c) 1982, 2014, Oracle.  All rights reserved.


Connected to:
Oracle Database 12c Enterprise Edition Release 12.1.0.2.0 - 64bit Production
With the Partitioning, OLAP, Advanced Analytics and Real Application Testing opt                                                                                        ions

SQL> COLUMN NAME FORMAT A32
SQL> SET LINE 100
SQL> SELECT   nested_level, type, name
  2  FROM     deptree
  3  ORDER BY seq#;

NESTED_LEVEL TYPE                    NAME
------------ ----------------------- --------------------------------
           0 TABLE                   EMPLOYEES
           1 CURSOR                  "LOCK TABLE "EMPLOYEES" IN EXCLU
                                     SIVE MODE  NOWAIT "

           1 CURSOR                  "SELECT MIN(SALARY),MAX(SALARY)
                                     FROM EMPLOYEES WHERE department_
                                     id=90"

           1 VIEW                    EMP_DETAILS_VIEW
           1 TRIGGER                 SECURE_EMPLOYEES
           1 TRIGGER                 UPDATE_JOB_HISTORY

NESTED_LEVEL TYPE                    NAME
------------ ----------------------- --------------------------------
           1 SYNONYM                 EMPLOYEES
           1 FUNCTION                GET_SAL
           1 FUNCTION                DML_CALL_SQL
           1 FUNCTION                QUERY_CALL_SQL
           1 PROCEDURE               SPCUST2
           1 PROCEDURE               QUERY_EMP
           1 PACKAGE BODY            COMM_PKG
           1 FUNCTION                GET_EMP
           1 FUNCTION                GET_HIRE_DATE
           1 TRIGGER                 TRIGGER1
           1 TRIGGER                 SECURE_EMP

NESTED_LEVEL TYPE                    NAME
------------ ----------------------- --------------------------------
           1 TRIGGER                 AUDIT_EMP_VALUES
           1 TRIGGER                 DERIVE_COMMISSION_PCT
           1 VIEW                    EMP_DETAILS
           2 TRIGGER                 NEW_EMP_DEPT
           1 TRIGGER                 CHECK_SALARY
           1 TRIGGER                 LOG_EMPLOYEE
           1 TRIGGER                 RESTRICT_SALARY
           1 VIEW                    COMMISSIONED
           1 VIEW                    SIX_FIGURE_SALARY

26 rows selected.
```

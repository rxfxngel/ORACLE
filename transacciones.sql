/*COMMIT;-- HACER CAMBIOS PERMANENTES


CREATE TABLE PRUEBA(
COL1 NUMBER,
COL2 NUMBER
);
commit;


SET TRANSACTION NAME 'actualiza fila 1';
update prueba set col2=0 where  col1=1;
select * from prueba;

savepoint  despues_act_1;
update prueba set col2=-1 where  col1=2;
savepoint  despues_act_2;

ROLLBACK TO SAVEPOINT despues_act_1;


update prueba set col2=-10 where  col1=3;

ROLLBACK;*/

INSERT INTO PRUEBA VALUES(6,36);
COMMIT;

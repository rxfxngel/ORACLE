DECLARE   
   regn NUMBER;
   regt varchar2(200);
BEGIN
   regn:=101;
   regt:='ASIA';
   iF regn > 100 THEN
       -- EL CODIGO DEBE ESTAR ENTRE -20000 Y -20999
       RAISE_APPLICATION_ERROR(-20001,'LA ID NO PUEDE SER MAYOR DE 100');  
    ELSE
       insert into regions values (regn,regt);
       commit;
    END IF;
END;
/

DECLARE
    COL1 TEST.C1%TYPE;
BEGIN
    COL1:=10;
    INSERT INTO TEST  (C1,C2) VALUES (COL1,'AAAAAA');
    COMMIT;
END;

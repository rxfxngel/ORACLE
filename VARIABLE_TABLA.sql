SET serveroutput ON 
DECLARE 
    TYPE r_vtab_tipo_lect IS RECORD ( 
      indice INT, 
      empresa VARCHAR2(15), 
      codigo VARCHAR2(15)
    ); 

    TYPE t_vtab_tipo_lect IS TABLE OF R_VTAB_TIPO_LECT INDEX BY BINARY_INTEGER; 
    vtab_tipo_lect T_VTAB_TIPO_LECT; 

    vid_lote       INT; 
    vempresa       VARCHAR2(15); 
    vcodigo        VARCHAR2(15); 
    vcad_campos    VARCHAR2(4000); 
BEGIN 
    SELECT Row_number() 
             over( 
               PARTITION BY codigo 
               ORDER BY empresa), 
           empresa, 
           codigo
    bulk   collect INTO vtab_tipo_lect 
    FROM   (
              SELECT personal.empresa, 
              personal.codigo
              FROM   tipo_lectora, 
              personal PERSONAL 
              WHERE 
              personal.empresa = '01' 
              AND personal.codigo = '61262'
            )TAB ;

    FOR i IN vtab_tipo_lect.first .. vtab_tipo_lect.last LOOP

        vempresa := Vtab_tipo_lect(i).empresa; 
        vcodigo := Vtab_tipo_lect(i).codigo; 
        dbms_output.Put_line(vempresa); 
        dbms_output.Put_line(vcodigo); 

    END LOOP;
END; 


-- eliminar un registro de objeto Tab_Datos.DELETE(v_i);

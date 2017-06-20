CREATE OR REPLACE PACKAGE G_MMSC_ZTE AS 
/**
  * Author: Carrasco Marcelo mailto: mcarrasco@harriague.com
  * Date: 04/04/2017
  * Comment: Paquete para conter la funcionalidad asociada a MMSC ZTE.
  */
  -- BULK COLLECT LIMIT
  bulk_limit  CONSTANT PLS_INTEGER := 100;
  -- LIMITE DE FILAS PARA LA SUMARIZACION IBHW
  limit_in    CONSTANT PLS_INTEGER  := 3; 
  -- Para el manejo de errores en el bulk insert
  L_ERRORS NUMBER;
  L_ERRNO  NUMBER;
  L_MSG    VARCHAR2(4000);
  L_IDX    NUMBER;
    -- END LOG --
  /**
  * Inserta los datos correspondientes a la sum. DAY
  * @param: P_FECHA --> DD.MM.YYYY
  */
  PROCEDURE P_MMSC_SERVICE_ZTE_DAY(P_FECHA IN VARCHAR2);
   /**
  * Inserta los datos correspondientes a la sum. BH
  * @param: P_FECHA --> DD.MM.YYYY
  */
  PROCEDURE P_MMSC_SERVICE_ZTE_BH(P_FECHA IN VARCHAR2);
  /**
  * Inserta los datos correspondientes a la sum. IBHW
  * @param: P_SABADO --> DD.MM.YYYY
  * @param: P_DOMINGO --> DD.MM.YYYY
  */
  PROCEDURE P_MMSC_SERVICE_ZTE_IBHW(P_DOMINGO IN VARCHAR2,P_SABADO VARCHAR2);
  /**
  * Ejecuta las sumarizaciones en los distintos niveles
  * @param: P_FECHA --> YYYYMMDD
  */
  PROCEDURE P_CALC_SUMARIZACIONES(P_FECHA IN VARCHAR2);
  /**
  * Ejecuta el rework de las sumarizaciones en los distintos niveles
  * @param: P_FECHA --> YYYYMMDD
  */
  PROCEDURE P_CALC_SUMARIZACIONES_RWK(P_FECHA IN VARCHAR2);
END G_MMSC_ZTE;
/


CREATE OR REPLACE PACKAGE BODY G_MMSC_ZTE AS

  FUNCTION F_RECALCULAR_IBHW(P_DATE IN VARCHAR2) RETURN NUMBER IS
    V_CURRENT_WEEK  NUMBER; -- week
    V_DATE_WEEK     NUMBER; -- week that given date belongs to
  BEGIN
    SELECT  TO_CHAR(TO_DATE(P_DATE, 'DD.MM.YYYY'), 'ww') AS WEEKNUMBER 
    INTO    V_DATE_WEEK
    FROM    DUAL;
    --
    SELECT  TO_CHAR(SYSDATE, 'ww') AS WEEKNUMBER 
    INTO    V_CURRENT_WEEK
    FROM    DUAL;
    --
    IF V_CURRENT_WEEK != V_DATE_WEEK THEN
      RETURN 1;
    END IF;
    --
    RETURN 0;
  END F_RECALCULAR_IBHW;
  --**--**--**--
  PROCEDURE P_MMSC_SERVICE_ZTE_DAY(P_FECHA IN VARCHAR2) AS
    CURSOR DATOS(DIA VARCHAR2) IS
    SELECT  TRUNC(FECHA)                                FECHA,
            PAIS,
            MMSC,
            ROUND(SUM(NBR_MMS_SENT),2)                  NBR_MMS_SENT,
            ROUND(SUM(NBR_MMS_SENT_BY_TERMINAL),2)      NBR_MMS_SENT_BY_TERMINAL,
            ROUND(SUM(NBR_MMS_SENT_BY_APP),2)           NBR_MMS_SENT_BY_APP,
            ROUND(SUM(NBR_MMS_RECEIVED_BY_TERMINAL),2)  NBR_MMS_RECEIVED_BY_TERMINAL,
            ROUND(SUM(NBR_MMSC_FWR_TO_OTHER_MMSC),2)    NBR_MMSC_FWR_TO_OTHER_MMSC,
            ROUND(SUM(NBR_MMSC_FWR_REC_FROM_MMSC),2)    NBR_MMSC_FWR_REC_FROM_MMSC,
            ROUND(SUM(NBR_TERM_TO_TERM),2)              NBR_TERM_TO_TERM,
            ROUND(SUM(NBR_TERM_TO_APP),2)               NBR_TERM_TO_APP
    FROM MMSC_SERVICE_ZTE_HOUR
    WHERE TRUNC(FECHA) BETWEEN TO_DATE(DIA,'DD.MM.YYYY') AND TO_DATE(DIA,'DD.MM.YYYY')  + 86399/86400
    GROUP BY TRUNC(FECHA),PAIS,MMSC;
    --
    TYPE MMSC_SERVICE_ZTE_DAY_TAB IS TABLE OF MMSC_SERVICE_ZTE_DAY%ROWTYPE;
    V_MMSC_SERVICE_ZTE_DAY MMSC_SERVICE_ZTE_DAY_TAB;
    
  BEGIN
    EXECUTE IMMEDIATE 'alter session set nls_date_format = ''DD.MM.YYYY HH24:MI:SS''';
    OPEN DATOS(P_FECHA);
    LOOP
      FETCH DATOS BULK COLLECT INTO V_MMSC_SERVICE_ZTE_DAY LIMIT bulk_limit;
      BEGIN
        FORALL fila IN 1 .. V_MMSC_SERVICE_ZTE_DAY.COUNT SAVE EXCEPTIONS
          --INSERT INTO MMSC_SERVICE_ZTE_DAY VALUES V_MMSC_SERVICE_ZTE_DAY(fila);
          MERGE INTO MMSC_SERVICE_ZTE_DAY DIA
          USING DUAL
          ON ( DIA.FECHA    = V_MMSC_SERVICE_ZTE_DAY(fila).FECHA
              AND DIA.PAIS  = V_MMSC_SERVICE_ZTE_DAY(fila).PAIS
              AND DIA.MMSC  = V_MMSC_SERVICE_ZTE_DAY(fila).MMSC)
          WHEN MATCHED THEN
           UPDATE SET
            DIA.NBR_MMS_SENT                  = V_MMSC_SERVICE_ZTE_DAY(fila).NBR_MMS_SENT,
            DIA.NBR_MMS_SENT_BY_TERMINAL      = V_MMSC_SERVICE_ZTE_DAY(fila).NBR_MMS_SENT_BY_TERMINAL,
            DIA.NBR_MMS_SENT_BY_APP           = V_MMSC_SERVICE_ZTE_DAY(fila).NBR_MMS_SENT_BY_APP,
            DIA.NBR_MMS_RECEIVED_BY_TERMINAL  = V_MMSC_SERVICE_ZTE_DAY(fila).NBR_MMS_RECEIVED_BY_TERMINAL,
            DIA.NBR_MMSC_FWR_TO_OTHER_MMSC    = V_MMSC_SERVICE_ZTE_DAY(fila).NBR_MMSC_FWR_TO_OTHER_MMSC,
            DIA.NBR_MMSC_FWR_REC_FROM_MMSC    = V_MMSC_SERVICE_ZTE_DAY(fila).NBR_MMSC_FWR_REC_FROM_MMSC,
            DIA.NBR_TERM_TO_TERM              = V_MMSC_SERVICE_ZTE_DAY(fila).NBR_TERM_TO_TERM,
            DIA.NBR_TERM_TO_APP               = V_MMSC_SERVICE_ZTE_DAY(fila).NBR_TERM_TO_APP
          WHEN NOT MATCHED THEN
           INSERT (FECHA,PAIS,MMSC,NBR_MMS_SENT,NBR_MMS_SENT_BY_TERMINAL,NBR_MMS_SENT_BY_APP,NBR_MMS_RECEIVED_BY_TERMINAL,
                  NBR_MMSC_FWR_TO_OTHER_MMSC,NBR_MMSC_FWR_REC_FROM_MMSC,NBR_TERM_TO_TERM,NBR_TERM_TO_APP)
           VALUES (V_MMSC_SERVICE_ZTE_DAY(fila).FECHA,V_MMSC_SERVICE_ZTE_DAY(fila).PAIS,V_MMSC_SERVICE_ZTE_DAY(fila).MMSC,
           V_MMSC_SERVICE_ZTE_DAY(fila).NBR_MMS_SENT,V_MMSC_SERVICE_ZTE_DAY(fila).NBR_MMS_SENT_BY_TERMINAL,
           V_MMSC_SERVICE_ZTE_DAY(fila).NBR_MMS_SENT_BY_APP,V_MMSC_SERVICE_ZTE_DAY(fila).NBR_MMS_RECEIVED_BY_TERMINAL,
           V_MMSC_SERVICE_ZTE_DAY(fila).NBR_MMSC_FWR_TO_OTHER_MMSC,V_MMSC_SERVICE_ZTE_DAY(fila).NBR_MMSC_FWR_REC_FROM_MMSC,
           V_MMSC_SERVICE_ZTE_DAY(fila).NBR_TERM_TO_TERM,V_MMSC_SERVICE_ZTE_DAY(fila).NBR_TERM_TO_APP);
          
        EXCEPTION
            WHEN OTHERS THEN
              -- Capture exceptions to perform operations DML
              l_errors := sql%bulk_exceptions.count;
              for i in 1 .. l_errors
              loop
                  l_errno := sql%bulk_exceptions(i).error_code;
                  l_msg   := sqlerrm(-l_errno);
                  L_IDX   := sql%BULK_EXCEPTIONS(I).ERROR_INDEX;
                  
                  G_ERROR_LOG_NEW.P_LOG_ERROR('P_MMSC_SERVICE_ZTE_DAY',L_ERRNO,L_MSG,
                                              ' FECHA => '||V_MMSC_SERVICE_ZTE_DAY(I).FECHA||
                                              ' PAIS => '||V_MMSC_SERVICE_ZTE_DAY(I).PAIS||
                                              ' MMSC => '||V_MMSC_SERVICE_ZTE_DAY(I).MMSC||
                                              ' NBR_MMS_SENT => '||TO_CHAR(V_MMSC_SERVICE_ZTE_DAY(I).NBR_MMS_SENT)||
                                              ' NBR_MMS_SENT_BY_TERMINAL => '||TO_CHAR(V_MMSC_SERVICE_ZTE_DAY(I).NBR_MMS_SENT_BY_TERMINAL)||
                                              ' NBR_MMS_SENT_BY_APP => '||TO_CHAR(V_MMSC_SERVICE_ZTE_DAY(I).NBR_MMS_SENT_BY_APP)||
                                              ' NBR_MMS_RECEIVED_BY_TERMINAL => '||TO_CHAR(V_MMSC_SERVICE_ZTE_DAY(I).NBR_MMS_RECEIVED_BY_TERMINAL)||
                                              ' NBR_MMSC_FWR_TO_OTHER_MMSC => '||TO_CHAR(V_MMSC_SERVICE_ZTE_DAY(I).NBR_MMSC_FWR_TO_OTHER_MMSC)||                                                              
                                              ' NBR_MMSC_FWR_REC_FROM_MMSC => '||TO_CHAR(V_MMSC_SERVICE_ZTE_DAY(I).NBR_MMSC_FWR_REC_FROM_MMSC)||
                                              ' NBR_TERM_TO_TERM => '||TO_CHAR(V_MMSC_SERVICE_ZTE_DAY(I).NBR_TERM_TO_TERM)||
                                              ' NBR_TERM_TO_APP => '||TO_CHAR(V_MMSC_SERVICE_ZTE_DAY(I).NBR_TERM_TO_APP));
              end loop;
          -- end --
      END;
      EXIT WHEN DATOS%NOTFOUND;
    END LOOP;
    COMMIT;
    CLOSE DATOS;
    EXCEPTION
    WHEN OTHERS THEN
      G_ERROR_LOG_NEW.P_LOG_ERROR('P_MMSC_SERVICE_ZTE_DAY',SQLCODE,SQLERRM,DBMS_UTILITY.format_error_backtrace );
  END P_MMSC_SERVICE_ZTE_DAY;

  PROCEDURE P_MMSC_SERVICE_ZTE_BH(P_FECHA IN VARCHAR2) AS
    CURSOR DATOS(DIA VARCHAR2) IS
    SELECT  FECHA,
            PAIS,
            MMSC,
            NBR_MMS_SENT,
            NBR_MMS_SENT_BY_TERMINAL,
            NBR_MMS_SENT_BY_APP,
            NBR_MMS_RECEIVED_BY_TERMINAL,
            NBR_MMSC_FWR_TO_OTHER_MMSC,
            NBR_MMSC_FWR_REC_FROM_MMSC,
            NBR_TERM_TO_TERM,
            NBR_TERM_TO_APP
    FROM  (SELECT FECHA,
                  PAIS,
                  MMSC,
                  NBR_MMS_SENT,
                  NBR_MMS_SENT_BY_TERMINAL,
                  NBR_MMS_SENT_BY_APP,
                  NBR_MMS_RECEIVED_BY_TERMINAL,
                  NBR_MMSC_FWR_TO_OTHER_MMSC,
                  NBR_MMSC_FWR_REC_FROM_MMSC,
                  NBR_TERM_TO_TERM,
                  NBR_TERM_TO_APP   
                  ,ROW_NUMBER() OVER(PARTITION BY TRUNC(FECHA),
                                                  PAIS,
                                                  MMSC  
                                        ORDER BY  NBR_MMS_SENT  DESC) RN
            FROM  MMSC_SERVICE_ZTE_HOUR
            WHERE TRUNC(FECHA) BETWEEN  TO_DATE(DIA,'DD.MM.YYYY') AND 
                                        TO_DATE(DIA,'DD.MM.YYYY') + 86399/86400)
    WHERE RN = 1;
    --
    TYPE MMSC_SERVICE_ZTE_BH_TAB IS TABLE OF MMSC_SERVICE_ZTE_BH%ROWTYPE;
    V_MMSC_SERVICE_ZTE_BH MMSC_SERVICE_ZTE_BH_TAB;
    
  BEGIN
    EXECUTE IMMEDIATE 'alter session set nls_date_format = ''DD.MM.YYYY HH24:MI:SS''';
    -- 
    BEGIN
      DELETE FROM MMSC_SERVICE_ZTE_BH WHERE TO_CHAR(FECHA,'DD.MM.YYYY') = P_FECHA;
      COMMIT;
      EXCEPTION
        WHEN OTHERS THEN
          G_ERROR_LOG_NEW.P_LOG_ERROR('P_MMSC_SERVICE_ZTE_BH',SQLCODE,SQLERRM,DBMS_UTILITY.format_error_backtrace );
    END;
    -- Calculo la BH del dia P_FECHA
     OPEN DATOS(P_FECHA);
    LOOP
      FETCH DATOS BULK COLLECT INTO V_MMSC_SERVICE_ZTE_BH LIMIT bulk_limit;
      BEGIN
        FORALL fila IN 1 .. V_MMSC_SERVICE_ZTE_BH.COUNT SAVE EXCEPTIONS
          INSERT INTO MMSC_SERVICE_ZTE_BH 
          VALUES V_MMSC_SERVICE_ZTE_BH(fila);
    EXCEPTION
            WHEN OTHERS THEN
              -- Capture exceptions to perform operations DML
              l_errors := sql%bulk_exceptions.count;
              for i in 1 .. l_errors
              loop
                  l_errno := sql%bulk_exceptions(i).error_code;
                  l_msg   := sqlerrm(-l_errno);
                  L_IDX   := sql%BULK_EXCEPTIONS(I).ERROR_INDEX;
                  
                  G_ERROR_LOG_NEW.P_LOG_ERROR('P_MMSC_SERVICE_ZTE_BH',L_ERRNO,L_MSG,
                                              ' FECHA => '||V_MMSC_SERVICE_ZTE_BH(I).FECHA||
                                              ' PAIS => '||V_MMSC_SERVICE_ZTE_BH(I).PAIS||
                                              ' MMSC => '||V_MMSC_SERVICE_ZTE_BH(I).MMSC||
                                              ' NBR_MMS_SENT => '||TO_CHAR(V_MMSC_SERVICE_ZTE_BH(I).NBR_MMS_SENT)||
                                              ' NBR_MMS_SENT_BY_TERMINAL => '||TO_CHAR(V_MMSC_SERVICE_ZTE_BH(I).NBR_MMS_SENT_BY_TERMINAL)||
                                              ' NBR_MMS_SENT_BY_APP => '||TO_CHAR(V_MMSC_SERVICE_ZTE_BH(I).NBR_MMS_SENT_BY_APP)||
                                              ' NBR_MMS_RECEIVED_BY_TERMINAL => '||TO_CHAR(V_MMSC_SERVICE_ZTE_BH(I).NBR_MMS_RECEIVED_BY_TERMINAL)||
                                              ' NBR_MMSC_FWR_TO_OTHER_MMSC => '||TO_CHAR(V_MMSC_SERVICE_ZTE_BH(I).NBR_MMSC_FWR_TO_OTHER_MMSC)||                                                              
                                              ' NBR_MMSC_FWR_REC_FROM_MMSC => '||TO_CHAR(V_MMSC_SERVICE_ZTE_BH(I).NBR_MMSC_FWR_REC_FROM_MMSC)||
                                              ' NBR_TERM_TO_TERM => '||TO_CHAR(V_MMSC_SERVICE_ZTE_BH(I).NBR_TERM_TO_TERM)||
                                              ' NBR_TERM_TO_APP => '||TO_CHAR(V_MMSC_SERVICE_ZTE_BH(I).NBR_TERM_TO_APP));
              end loop;
          -- end --
      END;
      EXIT WHEN DATOS%NOTFOUND;
    END LOOP;
    COMMIT;
    CLOSE DATOS;
    EXCEPTION
    WHEN OTHERS THEN
      G_ERROR_LOG_NEW.P_LOG_ERROR('P_MMSC_SERVICE_ZTE_BH',SQLCODE,SQLERRM,DBMS_UTILITY.format_error_backtrace );
  END P_MMSC_SERVICE_ZTE_BH;

  PROCEDURE P_MMSC_SERVICE_ZTE_IBHW(P_DOMINGO IN VARCHAR2,P_SABADO VARCHAR2) AS
    CURSOR DATOS(DOMINGO VARCHAR2,SABADO VARCHAR2) IS
    SELECT  FECHA,
            PAIS,
            MMSC,
            ROUND(AVG(NBR_MMS_SENT),2),
            ROUND(AVG(NBR_MMS_SENT_BY_TERMINAL),2),
            ROUND(AVG(NBR_MMS_SENT_BY_APP),2),
            ROUND(AVG(NBR_MMS_RECEIVED_BY_TERMINAL),2),
            ROUND(AVG(NBR_MMSC_FWR_TO_OTHER_MMSC),2),
            ROUND(AVG(NBR_MMSC_FWR_REC_FROM_MMSC),2),
            ROUND(AVG(NBR_TERM_TO_TERM),2),
            ROUND(AVG(NBR_TERM_TO_APP),2)
    FROM  (SELECT DOMINGO FECHA,
                  PAIS,
                  MMSC,
                  NBR_MMS_SENT,
                  NBR_MMS_SENT_BY_TERMINAL,
                  NBR_MMS_SENT_BY_APP,
                  NBR_MMS_RECEIVED_BY_TERMINAL,
                  NBR_MMSC_FWR_TO_OTHER_MMSC,
                  NBR_MMSC_FWR_REC_FROM_MMSC,
                  NBR_TERM_TO_TERM,
                  NBR_TERM_TO_APP   
                  ,ROW_NUMBER() OVER(PARTITION BY TRUNC(FECHA),
                                                  PAIS,
                                                  MMSC  
                                        ORDER BY  NBR_MMS_SENT  DESC) RN
            FROM  MMSC_SERVICE_ZTE_HOUR
            WHERE TRUNC(FECHA) BETWEEN  TO_DATE(DOMINGO,'DD.MM.YYYY') AND 
                                        TO_DATE(SABADO,'DD.MM.YYYY') + 86399/86400)
    WHERE RN <= limit_in
    GROUP BY FECHA,
            PAIS,
            MMSC;
    --
    TYPE MMSC_SERVICE_ZTE_IBHW_TAB IS TABLE OF MMSC_SERVICE_ZTE_IBHW%ROWTYPE;
    V_MMSC_SERVICE_ZTE_IBHW MMSC_SERVICE_ZTE_IBHW_TAB;
    
  BEGIN
    EXECUTE IMMEDIATE 'alter session set nls_date_format = ''DD.MM.YYYY HH24:MI:SS''';
    -- 
    BEGIN
      DELETE FROM MMSC_SERVICE_ZTE_IBHW WHERE TO_CHAR(FECHA,'DD.MM.YYYY') = P_DOMINGO;
      COMMIT;
      EXCEPTION
        WHEN OTHERS THEN
          G_ERROR_LOG_NEW.P_LOG_ERROR('P_MMSC_SERVICE_ZTE_IBHW',SQLCODE,SQLERRM,DBMS_UTILITY.format_error_backtrace );
    END;
    -- Calculo la IBHW del dia P_FECHA
     OPEN DATOS(P_DOMINGO,P_SABADO);
    LOOP
      FETCH DATOS BULK COLLECT INTO V_MMSC_SERVICE_ZTE_IBHW LIMIT bulk_limit;
      BEGIN
        FORALL fila IN 1 .. V_MMSC_SERVICE_ZTE_IBHW.COUNT SAVE EXCEPTIONS
          INSERT INTO MMSC_SERVICE_ZTE_IBHW 
          VALUES V_MMSC_SERVICE_ZTE_IBHW(fila);
    EXCEPTION
            WHEN OTHERS THEN
              -- Capture exceptions to perform operations DML
              l_errors := sql%bulk_exceptions.count;
              for i in 1 .. l_errors
              loop
                  l_errno := sql%bulk_exceptions(i).error_code;
                  l_msg   := sqlerrm(-l_errno);
                  L_IDX   := sql%BULK_EXCEPTIONS(I).ERROR_INDEX;
                  
                  G_ERROR_LOG_NEW.P_LOG_ERROR('P_MMSC_SERVICE_ZTE_IBHW',L_ERRNO,L_MSG,
                                              ' FECHA => '                        ||V_MMSC_SERVICE_ZTE_IBHW(I).FECHA||
                                              ' PAIS => '                         ||V_MMSC_SERVICE_ZTE_IBHW(I).PAIS||
                                              ' MMSC => '                         ||V_MMSC_SERVICE_ZTE_IBHW(I).MMSC||
                                              ' NBR_MMS_SENT => '                 ||TO_CHAR(V_MMSC_SERVICE_ZTE_IBHW(I).NBR_MMS_SENT)||
                                              ' NBR_MMS_SENT_BY_TERMINAL => '     ||TO_CHAR(V_MMSC_SERVICE_ZTE_IBHW(I).NBR_MMS_SENT_BY_TERMINAL)||
                                              ' NBR_MMS_SENT_BY_APP => '          ||TO_CHAR(V_MMSC_SERVICE_ZTE_IBHW(I).NBR_MMS_SENT_BY_APP)||
                                              ' NBR_MMS_RECEIVED_BY_TERMINAL => ' ||TO_CHAR(V_MMSC_SERVICE_ZTE_IBHW(I).NBR_MMS_RECEIVED_BY_TERMINAL)||
                                              ' NBR_MMSC_FWR_TO_OTHER_MMSC => '   ||TO_CHAR(V_MMSC_SERVICE_ZTE_IBHW(I).NBR_MMSC_FWR_TO_OTHER_MMSC)||                                                              
                                              ' NBR_MMSC_FWR_REC_FROM_MMSC => '   ||TO_CHAR(V_MMSC_SERVICE_ZTE_IBHW(I).NBR_MMSC_FWR_REC_FROM_MMSC)||
                                              ' NBR_TERM_TO_TERM => '             ||TO_CHAR(V_MMSC_SERVICE_ZTE_IBHW(I).NBR_TERM_TO_TERM)||
                                              ' NBR_TERM_TO_APP => '              ||TO_CHAR(V_MMSC_SERVICE_ZTE_IBHW(I).NBR_TERM_TO_APP));
              end loop;
          -- end --
      END;
      EXIT WHEN DATOS%NOTFOUND;
    END LOOP;
    COMMIT;
    CLOSE DATOS;
    EXCEPTION
    WHEN OTHERS THEN
      G_ERROR_LOG_NEW.P_LOG_ERROR('P_MMSC_SERVICE_ZTE_IBHW',SQLCODE,SQLERRM,DBMS_UTILITY.format_error_backtrace );
  END P_MMSC_SERVICE_ZTE_IBHW;

  PROCEDURE P_CALC_SUMARIZACIONES(P_FECHA IN VARCHAR2) AS
    v_dia     VARCHAR2(10 CHAR) := '';
    v_domingo VARCHAR2(10 CHAR) := '';
    v_sabado  VARCHAR2(10 CHAR) := '';
    v_fecha   VARCHAR2(10 CHAR) := '';
  BEGIN
    -- Calculo el dia anterior basado en P_FECHA
    SELECT  to_char(TO_DATE(p_fecha,'YYYYMMDD')-1,'DD.MM.YYYY') 
    INTO    v_fecha
    FROM    DUAL;
    -- 
    G_ERROR_LOG_NEW.P_LOG_ERROR('P_MMSC_SERVICE_ZTE_DAY',0,'NO ERROR','COMIENZO DE SUMARIZACION DAY P_MMSC_SERVICE_ZTE_DAY('||V_FECHA||')');
    P_MMSC_SERVICE_ZTE_DAY(V_FECHA);
    G_ERROR_LOG_NEW.P_LOG_ERROR('P_MMSC_SERVICE_ZTE_DAY',0,'NO ERROR','FIN DE SUMARIZACION DAY');
    --
    G_ERROR_LOG_NEW.P_LOG_ERROR('P_MMSC_SERVICE_ZTE_BH',0,'NO ERROR','COMIENZO CALCULO BH P_MMSC_SERVICE_ZTE_BH('||V_FECHA||')');
    P_MMSC_SERVICE_ZTE_BH(V_FECHA);
    G_ERROR_LOG_NEW.P_LOG_ERROR('P_MMSC_SERVICE_ZTE_BH',0,'NO ERROR','FIN CALCULO BH');
    --
    -- Si el dia actual es DOMINGO, entonces calcular sumarizacion IBHW de la semana anterior,
    -- siempre de domingo a sabado
    --
    SELECT TO_CHAR(TO_DATE(V_FECHA,'DD.MM.YYYY'),'DAY')
    INTO V_DIA
    FROM DUAL;
    --
    V_DOMINGO := TO_CHAR(TO_DATE(V_FECHA,'DD.MM.YYYY')-7,'DD.MM.YYYY');
    V_SABADO  := TO_CHAR(TO_DATE(V_FECHA,'DD.MM.YYYY')-1,'DD.MM.YYYY');
    --
    IF (TRIM(V_DIA) = 'SUNDAY') OR (TRIM(V_DIA) = 'DOMINGO') THEN
      -- 
      G_ERROR_LOG_NEW.P_LOG_ERROR('P_MMSC_SERVICE_ZTE_IBHW',0,'NO ERROR','COMIENZO DE SUMARIZACION IBHW V_FECHA_DOMINGO => '||
                                  V_DOMINGO||' V_FECHA_SABADO => '||V_SABADO);
      --
      P_MMSC_SERVICE_ZTE_IBHW(V_DOMINGO,V_SABADO);
      --
      G_ERROR_LOG_NEW.P_LOG_ERROR('P_MMSC_SERVICE_ZTE_IBHW',0,'NO ERROR','FIN DE SUMARIZACION IBHW');
    END IF;
  END P_CALC_SUMARIZACIONES;
  --**--**--**--
  PROCEDURE P_CALC_SUMARIZACIONES_RWK(P_FECHA IN VARCHAR2) AS
    v_dia     VARCHAR2(10 CHAR) := '';
    v_domingo VARCHAR2(10 CHAR) := '';
    v_sabado  VARCHAR2(10 CHAR) := '';
    v_fecha   VARCHAR2(10 CHAR) := '';
  BEGIN
    -- Calculo el dia anterior basado en P_FECHA
    SELECT  to_char(TO_DATE(p_fecha,'YYYYMMDD')-1,'DD.MM.YYYY') 
    INTO    v_fecha
    FROM    DUAL;
    -- 
    G_ERROR_LOG_NEW.P_LOG_ERROR('P_MMSC_SERVICE_ZTE_DAY',0,'NO ERROR','COMIENZO DE SUMARIZACION DAY P_MMSC_SERVICE_ZTE_DAY('||V_FECHA||')');
    P_MMSC_SERVICE_ZTE_DAY(V_FECHA);
    G_ERROR_LOG_NEW.P_LOG_ERROR('P_MMSC_SERVICE_ZTE_DAY',0,'NO ERROR','FIN DE SUMARIZACION DAY');
    --
    G_ERROR_LOG_NEW.P_LOG_ERROR('P_MMSC_SERVICE_ZTE_BH',0,'NO ERROR','COMIENZO CALCULO BH P_MMSC_SERVICE_ZTE_BH('||V_FECHA||')');
    P_MMSC_SERVICE_ZTE_BH(V_FECHA);
    G_ERROR_LOG_NEW.P_LOG_ERROR('P_MMSC_SERVICE_ZTE_BH',0,'NO ERROR','FIN CALCULO BH');
    --
    -- Verificar si hay que re-calcular IBHW
    --
    IF F_RECALCULAR_IBHW(P_FECHA) = 1 THEN
      V_DOMINGO := TO_CHAR(TO_DATE(V_FECHA,'DD.MM.YYYY')+ (1-TO_CHAR(TO_DATE(V_FECHA,'DD.MM.YYYY'),'D')),'DD.MM.YYYY'); 
      V_SABADO  := TO_CHAR(TO_DATE(V_FECHA,'DD.MM.YYYY')+ (7-TO_CHAR(TO_DATE(V_FECHA,'DD.MM.YYYY'),'D')),'DD.MM.YYYY');
      -- 
      G_ERROR_LOG_NEW.P_LOG_ERROR('P_MMSC_SERVICE_ZTE_IBHW',0,'NO ERROR','COMIENZO DE SUMARIZACION IBHW V_FECHA_DOMINGO => '||
                                  V_DOMINGO||' V_FECHA_SABADO => '||V_SABADO);
      --
      P_MMSC_SERVICE_ZTE_IBHW(V_DOMINGO,V_SABADO);
      --
      G_ERROR_LOG_NEW.P_LOG_ERROR('P_MMSC_SERVICE_ZTE_IBHW',0,'NO ERROR','FIN DE SUMARIZACION IBHW');
    END IF;
  END P_CALC_SUMARIZACIONES_RWK;
END G_MMSC_ZTE;
/

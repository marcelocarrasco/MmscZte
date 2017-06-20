--
-- AUX TABLE
--
--DROP TABLE MMSC_SERVICE_ZTE_AUX;

CREATE TABLE MMSC_SERVICE_ZTE_AUX (
FECHA                         DATE GENERATED ALWAYS AS (TO_DATE(
                                                        SUBSTR(FECHA_PROC,7,2) ||'.'||
                                                        SUBSTR(FECHA_PROC,5,2) ||'.'||
                                                        SUBSTR(FECHA_PROC,1,4) ||' '||
                                                        SUBSTR(TIME_OF_PERIOD,1,5),'DD.MM.YYYY HH24:MI')-1) VIRTUAL,
PAIS                          VARCHAR2(3 CHAR) NOT NULL,
MMSC                          VARCHAR2(10 CHAR) NOT NULL,
NBR_MMS_SENT                  NUMBER NOT NULL,
NBR_MMS_SENT_BY_TERMINAL      NUMBER NOT NULL,
NBR_MMS_SENT_BY_APP           NUMBER NOT NULL,
NBR_MMS_RECEIVED_BY_TERMINAL  NUMBER NOT NULL,
NBR_MMSC_FWR_TO_OTHER_MMSC    NUMBER NOT NULL,
NBR_MMSC_FWR_REC_FROM_MMSC    NUMBER NOT NULL,
NBR_TERM_TO_TERM              NUMBER NOT NULL,
NBR_TERM_TO_APP               NUMBER NOT NULL,
TIME_OF_PERIOD                VARCHAR2(13 CHAR),
FECHA_PROC                    VARCHAR2(8 CHAR),
NOMBRE_CSV                    VARCHAR2(500 CHAR)
)NOLOGGING NOCOMPRESS
TABLESPACE TBS_AUXILIAR;

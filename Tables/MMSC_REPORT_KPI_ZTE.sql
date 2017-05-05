select TO_DATE(SUBSTR('20170402',7,2)||'.'||
        SUBSTR('20170402',5,2)||'.'||
        SUBSTR('20170402',1,4) --||' '||
        --SUBSTR(TIME_OF_PERIOD,1,5),'DD.MM.YYYY HH24:MI'
        ) from dual;
--
-- TMP
-- DROP TABLE MMSC_REPORT_KPI_ZTE_DAY_TMP PURGE;
CREATE TABLE MMSC_REPORT_KPI_ZTE_DAY_TMP(
  FECHA                         DATE GENERATED ALWAYS AS (TO_DATE(SUBSTR(FECHA_PROC,7,2)||'.'||
                                                                  SUBSTR(FECHA_PROC,5,2)||'.'||
                                                                  SUBSTR(FECHA_PROC,1,4) --||' '||
                                                                  --SUBSTR(TIME_OF_PERIOD,1,5)
                                                                  ,'DD.MM.YYYY'
                                                                  )) VIRTUAL,
  PAIS                          VARCHAR2(20 CHAR),
  MMSC                          VARCHAR2(10 CHAR),
  NBR_SENT_MMS                  NUMBER,
  NBR_SENT_MMS_2                NUMBER,
  NBR_RECEIVED_MMS_2            NUMBER,
  NETWORK_FAILURE_SUBMISSION    NUMBER,
  SUBSCRIBER_FAILURE_SUBMISSION NUMBER,
  NETWORK_FAILURE_DELIVERY      NUMBER,
  SUBSCRIBER_FAILURE_DELIBERY   NUMBER,
  MMS_NET_PROC_COMP_RATIO       NUMBER(12,2),
  FECHA_PROC                    VARCHAR2(8 CHAR)
)NOLOGGING NOCOMPRESS;
--TABLESPACE TBS_AUXILIAR;
--
-- POPULAR TEMPLATE
--ARG
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('ARG','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
--PY
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('PY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
--UY
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
INSERT INTO MMSC_REPORT_KPI_ZTE_DAY_TMP(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC) VALUES('UY','Local MMSC',0,0,0,0,0,0,0,0,'${FECHA_PROC}');
--
-- AUX
-- DROP TABLE MMSC_REPORT_KPI_ZTE_DAY_AUX PURGE;
CREATE TABLE MMSC_REPORT_KPI_ZTE_DAY_AUX(
  FECHA                         DATE GENERATED ALWAYS AS (TO_DATE(SUBSTR(FECHA_PROC,7,2)||'.'||
                                                                  SUBSTR(FECHA_PROC,5,2)||'.'||
                                                                  SUBSTR(FECHA_PROC,1,4)--||' '||
                                                                  --SUBSTR(TIME_OF_PERIOD,1,5)
                                                                  ,'DD.MM.YYYY'
                                                                  )) VIRTUAL,
  PAIS                          VARCHAR2(20 CHAR),
  MMSC                          VARCHAR2(10 CHAR),
  NBR_SENT_MMS                  NUMBER,
  NBR_SENT_MMS_2                NUMBER,
  NBR_RECEIVED_MMS_2            NUMBER,
  NETWORK_FAILURE_SUBMISSION    NUMBER,
  SUBSCRIBER_FAILURE_SUBMISSION NUMBER,
  NETWORK_FAILURE_DELIVERY      NUMBER,
  SUBSCRIBER_FAILURE_DELIBERY   NUMBER,
  MMS_NET_PROC_COMP_RATIO       NUMBER(12,2),
  FECHA_PROC                    VARCHAR2(8 CHAR),
  NOMBRE_CSV                    VARCHAR2(500 CHAR)
)NOLOGGING NOCOMPRESS;
--TABLESPACE TBS_AUXILIAR;
--
-- MERGE TMP Y AUX
MERGE INTO MMSC_REPORT_KPI_ZTE_DAY_AUX AUX
USING (SELECT FECHA,
              PAIS,
              MMSC,
              NBR_SENT_MMS,
              NBR_SENT_MMS_2,
              NBR_RECEIVED_MMS_2,
              NETWORK_FAILURE_SUBMISSION,
              SUBSCRIBER_FAILURE_SUBMISSION,
              NETWORK_FAILURE_DELIVERY,
              SUBSCRIBER_FAILURE_DELIBERY,
              MMS_NET_PROC_COMP_RATIO,
              FECHA_PROC
      FROM MMSC_REPORT_KPI_ZTE_DAY_TMP) TMP
ON (AUX.FECHA = TMP.FECHA AND AUX.PAIS = TMP.PAIS AND AUX.MMSC = TMP.MMSC)
WHEN NOT MATCHED THEN
  INSERT(PAIS,MMSC,NBR_SENT_MMS,NBR_SENT_MMS_2,NBR_RECEIVED_MMS_2,NETWORK_FAILURE_SUBMISSION,SUBSCRIBER_FAILURE_SUBMISSION,
        NETWORK_FAILURE_DELIVERY,SUBSCRIBER_FAILURE_DELIBERY,MMS_NET_PROC_COMP_RATIO,FECHA_PROC)
  VALUES (TMP.PAIS,
          TMP.MMSC,
          TMP.NBR_SENT_MMS,
          TMP.NBR_SENT_MMS_2,
          TMP.NBR_RECEIVED_MMS_2,
          TMP.NETWORK_FAILURE_SUBMISSION,
          TMP.SUBSCRIBER_FAILURE_SUBMISSION,
          TMP.NETWORK_FAILURE_DELIVERY,
          TMP.SUBSCRIBER_FAILURE_DELIBERY,
          TMP.MMS_NET_PROC_COMP_RATIO,
          TMP.FECHA_PROC);

--
CREATE TABLE MMSC_REPORT_KPI_ZTE_DAY(
  FECHA                         DATE NOT NULL,
  PAIS                          VARCHAR2(20 CHAR) NOT NULL,
  MMSC                          VARCHAR2(10 CHAR) NOT NULL,
  NBR_SENT_MMS                  NUMBER NOT NULL,
  NBR_SENT_MMS_2                NUMBER NOT NULL,
  NBR_RECEIVED_MMS_2            NUMBER NOT NULL,
  NETWORK_FAILURE_SUBMISSION    NUMBER NOT NULL,
  SUBSCRIBER_FAILURE_SUBMISSION NUMBER NOT NULL,
  NETWORK_FAILURE_DELIVERY      NUMBER NOT NULL,
  SUBSCRIBER_FAILURE_DELIBERY   NUMBER NOT NULL,
  MMS_NET_PROC_COMP_RATIO       NUMBER(12,2) NOT NULL
)NOLOGGING NOCOMPRESS
PARTITION BY RANGE (FECHA)
INTERVAL (NUMTODSINTERVAL(1, 'DAY'))
(
PARTITION MMSC_REPORT_KPI_ZTE_D_FIRST VALUES LESS THAN (TO_DATE('2017-03-20 00:00:00','SYYYY-MM-DD HH24:MI:SS'))
)
TABLESPACE DEVELOPER;
-- TABLESPACE TBS_DAY;

COMMENT ON COLUMN MMSC_REPORT_KPI_ZTE_DAY.PAIS                          IS 'Renombrado columna Country';
COMMENT ON COLUMN MMSC_REPORT_KPI_ZTE_DAY.FECHA                         IS 'Renombrado columna Date';
COMMENT ON COLUMN MMSC_REPORT_KPI_ZTE_DAY.NBR_SENT_MMS                  IS 'Total number of sent MMSs(O CDR total number (FO is not included))';
COMMENT ON COLUMN MMSC_REPORT_KPI_ZTE_DAY.NBR_SENT_MMS_2                IS 'Total number of sent MMSs-2(O CDR total number (FO is  included))';
COMMENT ON COLUMN MMSC_REPORT_KPI_ZTE_DAY.NBR_RECEIVED_MMS_2            IS 'Total number of received MMSs-2(T CDR total number(FT is included))';
COMMENT ON COLUMN MMSC_REPORT_KPI_ZTE_DAY.NETWORK_FAILURE_SUBMISSION    IS 'Network failure submission numbers';
COMMENT ON COLUMN MMSC_REPORT_KPI_ZTE_DAY.SUBSCRIBER_FAILURE_SUBMISSION IS 'Subscriber failure submission numbers';
COMMENT ON COLUMN MMSC_REPORT_KPI_ZTE_DAY.NETWORK_FAILURE_DELIVERY      IS 'Network failure delivery numbers';
COMMENT ON COLUMN MMSC_REPORT_KPI_ZTE_DAY.SUBSCRIBER_FAILURE_DELIBERY   IS 'Subscriber failure delivery numbers';
COMMENT ON COLUMN MMSC_REPORT_KPI_ZTE_DAY.MMS_NET_PROC_COMP_RATIO       IS 'MMS network whole process completion ratio(%)';

CREATE INDEX IDX_MMSC_REPORT_KPI_ZTE_DAY_F ON MMSC_REPORT_KPI_ZTE_DAY (TO_CHAR(FECHA,'DD.MM.YYYY'));
CREATE INDEX IDX_MMSC_REPORT_KPI_ZTE_DAY_FH ON MMSC_REPORT_KPI_ZTE_DAY (TO_CHAR(FECHA,'DD.MM.YYYY HH24'));
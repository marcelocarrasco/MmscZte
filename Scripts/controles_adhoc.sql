--
-- CONTROLES A NIVEL TABLA FILES
--
SET VERIFY OFF

DEFINE ARCHIVO = '/MMS_Service_Hour_Report__hourly__'
DEFINE FECHA = '20170505' -- FORMATO --> YYYYMMDD

-- Archivos con datos que no se cargaron con errores
SELECT 'Archivos con datos que se cargaron con errores --> ' TITULO ,NOMBRE_CSV
FROM FILES
WHERE NOMBRE_CSV LIKE '%&ARCHIVO&fecha%.csv'
AND ROW_NUM != 0
AND PROCESADO IS NOT NULL
AND STATUS != 0;
-- Archivos con datos que no se cargaron
SELECT 'Archivos con datos que no se cargaron --> ' TITULO, NOMBRE_CSV
FROM FILES
WHERE NOMBRE_CSV LIKE '%&ARCHIVO&fecha%.csv'
AND ROW_NUM != 0
AND PROCESADO IS NULL;
--
-- CONTROL DE LOS PROCESOS DE SUMARIZACIONES
--
DEFINE OBJETO = 'P_MMSC_SERVICE_ZTE_'
DEFINE FECHA = '05.05.2017' -- FORMATO --> DD.MM.YYYY

SELECT  'Comentario --> ' TITULO,COMENTARIO
FROM ERROR_LOG_NEW
WHERE OBJETO LIKE '%&OBJETO%'
and to_char(fecha,'DD.MM.YYYY') = '&FECHA'
AND SQL_CODE != 0
and SQL_ERRM != 'NO ERROR';
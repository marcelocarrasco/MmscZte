#!/bin/bash
<<COMMENT
Ejecuta el proceso end to end de rework para un dia determinado.
Recibe como parametro la fecha a reprocesar, ej. 20170502, pero le suma un (1) dia a la fecha pasada
como parametro por que los datos del dia 20170502 se encuentran en el archvio que contiene en el nombre
la fecha 20170503.
COMMENT

export ORACLE_HOME=/oracle/app/oracle/product/12.1.0.2/dbhome
export ORACLE_SID=DSMART2
export ORAENV_ASK=NO

FECHA_PROC=$(date +%Y%m%d -d "$1 + 1 day")
#FECHA_PROC=$1

echo "======================================================"
echo "Se copiaran los archivos generados el dia: $FECHA_PROC"
echo "======================================================"

sh $HOME/Pentaho61/data-integration/kitchen.sh -file=$HOME/MmscZte/Rework/MMSC_ZTE_Rework.kjb -param:FECHA_PROC=$FECHA_PROC
exit

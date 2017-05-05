#!/bin/bash

export ORACLE_HOME=/oracle/app/oracle/product/12.1.0.2/dbhome
export ORACLE_SID=DSMART2
export ORAENV_ASK=NO

FECHA_PROC=$(date +'%Y%m%d')

sh $HOME/Pentaho61/data-integration/kitchen.sh -file=$HOME/MmscZte/PentahoSourceFiles/MMSC_ZTE_EndToEnd.kjb -param:FECHA_PROC=$FECHA_PROC
exit

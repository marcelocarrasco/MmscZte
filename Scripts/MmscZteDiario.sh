#!/bin/bash
ps cax | grep mmsczte.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  sh $HOME/MmscZte/Scripts/mmsczte.sh
  sh $HOME/MmscZte/Scripts/cleanupLogs.sh $HOME/MmscZte/PentahoLogs
  sh $HOME/MmscZte/Scripts/deleteEmptyLogs.sh $HOME/MmscZte/PentahoLogs
fi
exit

#!/bin/bash
LOG_FILE="/home/ubuntu/workspace/fritzsforge/server.log"

REPORT=$(/bin/date)
CPU=$(/usr/bin/top -bn1 | /bin/grep "Cpu(s)" | /usr/bin/awk '{print $8}')

/usr/bin/echo "--- Report at $REPORT --- CPU Idle: $CPU%" >> $LOG_FILE

/usr/bin/tail -n 50 $LOG_FILE > ${LOG_FILE}.tmp && /bin/mv ${LOG_FILE}.tmp $LOG_FILE

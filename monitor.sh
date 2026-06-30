#!/bin/bash
LOG_FILE="/home/ubuntu/workspace/fritzsforge/server.log"

# 1. Capture report into a temporary location
# We use the absolute path for 'date' and 'top' to be safe with Cron
REPORT=$(/bin/date)
CPU=$(/usr/bin/top -bn1 | /bin/grep "Cpu(s)" | /usr/bin/awk '{print $8}')

# 2. Append to the log
/usr/bin/echo "--- Report at $REPORT --- CPU Idle: $CPU%" >> $LOG_FILE

# 3. THE 50-LINE LIMIT
# 'tail -n 50' keeps only the last 50 lines
# We move the result to a temp file, then rename it back to server.log
/usr/bin/tail -n 50 $LOG_FILE > ${LOG_FILE}.tmp && /bin/mv ${LOG_FILE}.tmp $LOG_FILE

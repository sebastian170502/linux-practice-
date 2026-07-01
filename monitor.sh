#!/bin/bash
# Objective: Monitor server health and flag high disk usage.
# Log target: server.log (handled via cron or redirect)

LOG_FILE="server.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# 1. Gather baseline metrics
CPU_LOAD=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM_USAGE=$(free -m | awk '/Mem:/ {printf "%.2f%%", $3/$2*100}')

# 2. Check primary disk capacity (Extracts percentage from root partition)
DISK_PCT=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# 3. Determine status flag based on capacity
if [ "$DISK_PCT" -gt 85 ]; then
    STATUS="[WARNING] High Disk Usage: ${DISK_PCT}%"
else
    STATUS="[OK]"
fi

# 4. Print structured log entry
echo "${TIMESTAMP} | Status: ${STATUS} | CPU: ${CPU_LOAD}% | Mem: ${MEM_USAGE}" >> "$LOG_FILE"

# 5. Maintain fixed-size log buffer (keep latest 50 entries)
if [ -f "$LOG_FILE" ]; then
    tail -n 50 "$LOG_FILE" > "${LOG_FILE}.tmp" && mv "${LOG_FILE}.tmp" "$LOG_FILE"
fi

# Automated Linux Server Monitor

## Objective
A lightweight, zero-dependency Bash script for automated server resource tracking and log rotation. Designed to capture critical metrics (CPU/Memory/Disk) and alert on high capacity, while preventing disk bloat.

## Tools Used
* **Bash Scripting**
* **Systemd** (Daemon Management)
* **Core Linux Utilities** (`top`, `awk`, `tail`, `df`)

## Architecture
This script runs as a continuous 24/7 background daemon managed by Systemd, featuring automatic crash recovery (`Restart=always`). It implements a self-cleaning "Fixed-Size Circular Buffer." Rather than relying on external tools like `logrotate`, the script truncates the log file to the last 50 lines internally, guaranteeing constant, predictable disk usage regardless of server uptime.

## Deployment Instructions
1. Clone this repository to your target Linux server.
2. Grant execute permissions to the script:
   ```bash
   chmod +x monitor.sh

# Automated Linux Server Monitor

## Objective
A lightweight, zero-dependency Bash script for automated server resource tracking and log rotation. Designed to capture critical metrics (CPU/Memory) while preventing disk bloat

## Tools Used
* **Bash Scripting**
* **Cron** (Task Scheduling)
* **Core Linux Utilities** (`top`, `awk`, `tail`, `grep`)

## Architecture
This script implements a self-cleaning "Fixed-Size Circular Buffer." Rather than relying on external tools like `logrotate`, the script uses standard out redirection and the `tail` command internally. After appending new metrics, it truncates the file to the last 50 lines. This guarantees constant, predictable disk usage regardless of server uptime.

## Deployment Instructions
1. Clone this repository to your target Linux server
2. Grant execute permissions to the script:
   ```bash
   chmod +x monitor.sh

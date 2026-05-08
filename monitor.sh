#!/bin/bash

#========================================================
#Author      : Amann Prakash
#Created Date: 8-05-2026
#Last Modified: 8-05-2026
#Version     : 1.0
#
#Description : Server monitoring script
#Output      : Logs saved to /home/ubuntu/monitor.log
#========================================================

LOGFILE="/home/ubuntu/monitor.log"

{
echo "================= REPORT ================="
echo "Date: $(date)"
echo ""

#========================================================
# RUNNING SERVICES
#========================================================
echo "========== RUNNING SERVICES =============="
systemctl list-units --type=service --state=running
echo ""

#========================================================
# CPU USAGE
#========================================================
echo "=============== CPU USAGE ================"
top -bn1 | grep "Cpu(s)"
echo ""

#========================================================
# MEMORY USAGE
#========================================================
echo "============= MEMORY USAGE ==============="
free -h
echo ""

#========================================================
# DISK USAGE
#========================================================
echo "============== DISK USAGE ================"
df -h
echo ""

echo "=========================================="

} | tee -a "$LOGFILE"

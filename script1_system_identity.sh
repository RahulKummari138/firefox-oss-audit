#!/bin/bash
# Script 1: System Identity Report
# Concepts: Variables, command substitution, echo formatting, uname, whoami, uptime, date

# Capture system data using command substitution
DISTRO=$(grep PRETTY_NAME /etc/os-release | cut -d '"' -f2)
KERNEL=$(uname -r)
USER=$(whoami)
HOME_DIR=$(echo $HOME)
UPTIME=$(uptime -p)
DATE=$(date '+%Y-%m-%d')
TIME=$(date '+%H:%M:%S')

# Output formatted welcome screen
echo "=============================================="
echo "       LINUX SYSTEM IDENTITY REPORT          "
echo "=============================================="
echo "Distribution : $DISTRO"
echo "Kernel Version: $KERNEL"
echo "Username     : $USER"
echo "Home Directory: $HOME_DIR"
echo "System Uptime: $UPTIME"
echo "Current Date : $DATE"
echo "Current Time : $TIME"
echo "----------------------------------------------"
echo "Licence Note : The underlying OS kernel is"
echo "               released under the GPL v2."
echo "=============================================="
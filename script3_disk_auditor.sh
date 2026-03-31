#!/bin/bash
# Script 3: Disk and Permission Auditor
# Concepts: for loop, arrays, du, ls, awk, conditional checks

# Define directories to audit (as per Report Section 4)
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/lib")

echo "=============================================="
echo "       DIRECTORY PERMISSION AUDIT            "
echo "=============================================="
printf "%-15s %-10s %-10s %-10s\n" "Directory" "Permissions" "Owner" "Group"
echo "----------------------------------------------"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Extract permissions, owner, and group using ls and awk
        STATS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        PERMS=$(echo $STATS | awk '{print $1}')
        OWNER=$(echo $STATS | awk '{print $2}')
        GROUP=$(echo $STATS | awk '{print $3}')
        
        # Get disk usage
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        printf "%-15s %-10s %-10s %-10s (Size: %s)\n" "$DIR" "$PERMS" "$OWNER" "$GROUP" "$SIZE"
    else
        printf "%-15s %-10s %-10s %-10s\n" "$DIR" "N/A" "N/A" "N/A"
    fi
done

echo "=============================================="
echo "       FIREFOX SPECIFIC CHECKS               "
echo "=============================================="
# Check User Profile
if [ -d "$HOME/.mozilla/firefox" ]; then
    echo "Profile Dir (~/.mozilla/firefox): EXISTS"
    ls -ld "$HOME/.mozilla/firefox" | awk '{print "Permissions:", $1, "Owner:", $3}'
else
    echo "Profile Dir (~/.mozilla/firefox): NOT FOUND"
fi

# Check System Config
if [ -d "/etc/firefox" ]; then
    echo "System Config (/etc/firefox): EXISTS"
    ls -ld "/etc/firefox" | awk '{print "Permissions:", $1, "Owner:", $3}'
else
    echo "System Config (/etc/firefox): NOT FOUND"
fi
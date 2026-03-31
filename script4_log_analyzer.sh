#!/bin/bash
# Script 4: Log File Analyzer
# Concepts: while read loop, arguments, counters, grep, tail, validation

LOG_FILE=$1
KEYWORD=${2:-error} # Default to 'error' if no keyword provided

# Input Validation
if [ -z "$LOG_FILE" ]; then
    echo "Error: Please provide a log file path."
    exit 1
fi

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' does not exist."
    exit 1
fi

if [ ! -s "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' is empty."
    exit 1
fi

echo "Analyzing '$LOG_FILE' for keyword: '$KEYWORD'..."
echo "----------------------------------------------"

COUNT=0

# Process file line by line
while IFS= read -r line; do
    # Check if line contains keyword (case-insensitive)
    if echo "$line" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOG_FILE"

# Output Summary
echo "Total matches found: $COUNT"
echo "----------------------------------------------"
if [ $COUNT -gt 0 ]; then
    echo "Last 5 matching lines:"
    grep -i "$KEYWORD" "$LOG_FILE" | tail -n 5
else
    echo "No matches found."
fi
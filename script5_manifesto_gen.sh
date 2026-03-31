#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Concepts: read, heredoc, writing to file, date, cat

# Interactive Input
echo "=== Open Source Philosophy Generator ==="
read -p "Name an open-source tool you use daily: " TOOL
read -p "Define 'freedom' in one word: " FREEDOM
read -p "What would you build and share with the world? " BUILD

# Prepare Filename
USERNAME=$(whoami)
FILENAME="manifesto_${USERNAME}.txt"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Generate Manifesto using Heredoc
cat << EOF > "$FILENAME"
OPEN SOURCE MANIFESTO
Generated: $TIMESTAMP
User: $USERNAME

I believe in the power of open collaboration.
My tool of choice is $TOOL, because it empowers me to work without barriers.
To me, freedom means $FREEDOM.
In the spirit of giving back, I pledge to build $BUILD and share it with the community.

"If you want to go fast, go alone. If you want to go far, go together."
EOF

# Note on Aliases (as per report requirements)
# alias showdate='date' 
# Note: Aliases defined here do not persist outside the script without sourcing.

# Display Output
echo "----------------------------------------------"
echo "Manifesto saved to: $FILENAME"
echo "----------------------------------------------"
cat "$FILENAME"
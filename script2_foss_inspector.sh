#!/bin/bash
# Script 2: FOSS Package Inspector
# Concepts: if-then-else, case statement, package manager detection

PACKAGE=${1:-firefox} # Default to firefox if no argument provided

# Detect Package Manager
if command -v rpm >/dev/null 2>&1; then
    PM_TYPE="rpm"
elif command -v dpkg >/dev/null 2>&1; then
    PM_TYPE="dpkg"
else
    echo "Error: No supported package manager (rpm or dpkg) found."
    exit 1
fi

# Check Installation Status
if [ "$PM_TYPE" == "rpm" ]; then
    INFO=$(rpm -qi $PACKAGE 2>/dev/null)
else
    INFO=$(dpkg -l $PACKAGE 2>/dev/null | grep ^ii)
fi

if [ -z "$INFO" ]; then
    echo "Package '$PACKAGE' is NOT installed."
    exit 1
else
    echo "Package '$PACKAGE' is installed."
    if [ "$PM_TYPE" == "rpm" ]; then
        VERSION=$(echo "$INFO" | grep Version | awk '{print $3}')
        LICENCE=$(echo "$INFO" | grep License | awk '{print $3}')
    else
        VERSION=$(echo "$INFO" | awk '{print $3}')
        LICENCE="Varies (Debian Repo)"
    fi
    echo "Version: $VERSION"
    echo "Licence: $LICENCE"
fi

# Philosophy Note based on Package Name
echo "----------------------------------------------"
case $PACKAGE in
    firefox)
        echo "Philosophy: A free web for everyone, not controlled by one company."
        ;;
    httpd|apache2)
        echo "Philosophy: The backbone of the open web server infrastructure."
        ;;
    mysql|mariadb)
        echo "Philosophy: Data freedom ensures no vendor lock-in for your records."
        ;;
    git)
        echo "Philosophy: Distributed control empowers every developer to contribute."
        ;;
    vlc)
        echo "Philosophy: Media should play everywhere, without proprietary codecs."
        ;;
    python)
        echo "Philosophy: Readability and community drive modern scripting."
        ;;
    *)
        echo "Philosophy: Open source tools empower users to inspect and modify."
        ;;
esac
echo "----------------------------------------------"
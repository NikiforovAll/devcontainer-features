#!/bin/sh
set -e

echo "Activating feature 'antlr4'"

ANTLER_VERSION=${VERSION:-"4.13.0"}

wget -O /usr/local/lib/antlr-${ANTLER_VERSION}.jar https://www.antlr.org/download/antlr-${ANTLER_VERSION}-complete.jar

# Create the wrapper script for Antler
echo "#!/usr/bin/env bash" > /usr/local/bin/antlr4
echo "java -jar /usr/local/lib/antlr-${ANTLER_VERSION}.jar \"\$@\"" >> /usr/local/bin/antlr4

# Make the wrapper script executable
chmod +x /usr/local/bin/antlr4

# Print a message to confirm installation
echo "ANTLR4 ${ANTLER_VERSION} has been installed successfully."
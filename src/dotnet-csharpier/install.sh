#!/bin/sh
set -e

CSHARPIER_VERSION="${VERSION:-"latest"}"
TOOL_PATH="/usr/local/share/dotnet-tools"

echo "Activating feature 'dotnet-csharpier'"

# Install to a shared path instead of `-g`: feature scripts run as root, and
# global tools land in root's home, invisible to the remote user (issue #13).
if test "${CSHARPIER_VERSION}" = "latest"; then
  dotnet tool install csharpier --tool-path "$TOOL_PATH"
else
  dotnet tool install csharpier --tool-path "$TOOL_PATH" --version "$CSHARPIER_VERSION"
fi

chmod -R a+rX "$TOOL_PATH"

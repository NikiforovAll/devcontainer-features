#!/bin/sh

CSHARPIER_VERSION="${VERSION:-"latest"}"

set -e

echo "Activating feature 'dotnet-csharpier'"

if test "${CSHARPIER_VERSION}" = "latest"; then
  dotnet tool install -g csharpier
else
  dotnet tool install -g csharpier --version "$CSHARPIER_VERSION"
fi
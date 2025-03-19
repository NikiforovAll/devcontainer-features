#!/bin/sh

CSHARPIER_VERSION="${VERSION:-"latest"}"

set -e

echo "Activating feature 'dotnet-csharpier'"

if [ -z "$VERSION" ]
then
  dotnet tool install csharpier --global
else
  dotnet tool install --global CSharpier --version $CSHARPIER_VERSION
fi
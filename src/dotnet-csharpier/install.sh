#!/bin/sh
set -e

echo "Activating feature 'dotnet-csharpier'"

dotnet tool install csharpier --global

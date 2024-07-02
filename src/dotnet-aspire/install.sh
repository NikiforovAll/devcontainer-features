#!/bin/sh
set -e

echo "Activating feature 'aspire'"

dotnet workload update
dotnet workload install aspire
